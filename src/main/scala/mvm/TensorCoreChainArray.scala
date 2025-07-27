package mvm

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import config._
import intel_ips._
import util._
import scala.math.{min, pow, ceil}

case class IdxWidth(r: Int, c: Int)

case class BfpBlockWithIdx(dwidth: Int,
                           ridx_width: Int,
                           cidx_width: Int,
                           dest_id_width: Int) extends Bundle {
  val blkData = UInt(dwidth bits)
  val rIdx = (ridx_width > 0) generate UInt(ridx_width bits)
  val cIdx = (cidx_width > 0) generate UInt(cidx_width bits)
  val destId = (dest_id_width > 0) generate Bits(dest_id_width bits)

  def fromUInt(src: UInt): this.type = {
    if (ridx_width > 0)
      this.rIdx := src(src.getBitsWidth-1 downto src.getBitsWidth-ridx_width)

    if (cidx_width > 0)
      this.cIdx := src(src.getBitsWidth-ridx_width-1 downto src.getBitsWidth-ridx_width-cidx_width)

    if (dest_id_width > 0)
      this.destId := src(
        src.getBitsWidth-ridx_width-cidx_width-1 downto src.getBitsWidth-ridx_width-cidx_width-dest_id_width).asBits

    this.blkData := src(src.getBitsWidth-ridx_width-cidx_width-dest_id_width-1 downto 0)

    this
  }

  def setDefault(): Unit = {
    if (ridx_width > 0) {this.rIdx := U(BigInt("1"*ridx_width, 2))}
    if (cidx_width > 0) {this.cIdx := U(BigInt("1"*ridx_width, 2))}
    if (dest_id_width > 0) {this.destId.clearAll()}
    this.blkData.clearAll()
  }

  override def getZero: this.type = {
    val zeroData = new BfpBlockWithIdx(dwidth, ridx_width, cidx_width, dest_id_width)
    zeroData.setName(this.getName() + "_ground")
    zeroData.blkData.clearAll()
    if(ridx_width > 0) {zeroData.rIdx.clearAll()}
    if(cidx_width > 0) {zeroData.cIdx.clearAll()}
    if(dest_id_width > 0) {zeroData.destId.clearAll()}
    zeroData.asInstanceOf[this.type]
  }

  def asUInt: UInt = {
    val res = UInt(this.getBitsWidth bits)
    res.setName(this.getName() + "_toUInt")
    res(res.getBitsWidth-ridx_width-cidx_width-dest_id_width-1 downto 0) := this.blkData
    if (ridx_width > 0)
      res(res.getBitsWidth-1 downto res.getBitsWidth-ridx_width) := this.rIdx
    if (cidx_width > 0)
      res(res.getBitsWidth-ridx_width-1 downto res.getBitsWidth-ridx_width-cidx_width) := this.cIdx
    if (dest_id_width > 0)
      res(res.getBitsWidth-ridx_width-cidx_width-1 downto res.getBitsWidth-ridx_width-cidx_width-dest_id_width) :=
        this.destId.asUInt

    res
  }

  override def getBitsWidth: Int = {
    dwidth + ridx_width + cidx_width + dest_id_width
  }
}

class CasLoadBubbleInsert(ridx_width: Int, chain_len: Int, bypass: Boolean = false) extends Component {
  val io = new Bundle {
    val casLoadBufIn = slave Stream(BfpBlockWithIdx(88, ridx_width, 0, 0))
    val datWithBubble = master Flow(BfpBlockWithIdx(88, ridx_width, 0, 0))
    val casLoadEn, colSel = in Bool()
    val isVecTail = out Bool()
  }

  if (bypass) {
    io.datWithBubble := io.casLoadBufIn.toFlow
    io.isVecTail := io.casLoadBufIn.payload.rIdx.msb
  } else {
    io.isVecTail.setAsReg()

    val outReg = Reg(BfpBlockWithIdx(88, ridx_width, 0, 0))
    outReg.blkData.init(0)
    outReg.rIdx.init(U(BigInt("1" * ridx_width, 2)))

    val cachedRidx = Reg(UInt(ridx_width bits), init = U(0))
    val isTailPadding = Reg(Bool(), False)
    val casLoadTailPaddingCtr = Counter(chain_len)
    val casLoad3FactorCtr = Counter(3)

    io.casLoadBufIn.ready := False
    io.datWithBubble.valid := Delay(io.casLoadEn, 1, init = False)

    when(casLoad3FactorCtr.willOverflow) {
      casLoadTailPaddingCtr.increment()
    }

    when(io.casLoadEn) {
      casLoad3FactorCtr.increment()
      when(io.colSel) {
        io.casLoadBufIn.ready := True
        outReg := io.casLoadBufIn.payload
        cachedRidx := io.casLoadBufIn.payload.rIdx
      }.otherwise {
        when(io.casLoadBufIn.payload.rIdx.msb | isTailPadding) {
          outReg.fromUInt(cachedRidx @@ U(0, outReg.blkData.getWidth bits))
        }.otherwise {
          outReg.fromUInt(io.casLoadBufIn.payload.rIdx @@ U(0, outReg.blkData.getWidth bits))
          cachedRidx := io.casLoadBufIn.payload.rIdx
        }

        when(isTailPadding) {
          io.casLoadBufIn.ready := False
          when(casLoadTailPaddingCtr.willOverflow) {
            isTailPadding := False
          }
        }.otherwise {
          when(io.casLoadBufIn.valid && io.casLoadBufIn.payload.rIdx.msb) {
            isTailPadding := True
            io.casLoadBufIn.ready := True
          }
        }
      }
    }

    io.datWithBubble.payload := outReg
    io.isVecTail := io.casLoadBufIn.payload.rIdx.msb | isTailPadding
  }
}

class TensorCoreChainArray(array_col: Int, chain_len: Int, idx_width: IdxWidth,
                           col_buffer_depth: Int, row_buffer_depth: Int,
                           out_buf_delay: Int, //should be (matBCols / array_row).ceil.toInt - 3
                           output_fifo_depth: Int, output_width: Int,
                           inout_pipe_delay: Int = 5, num_matb_cols: Int = 128,
                           n_out_chans: Int = 2, n_words_outchan: Int = 2,
                           debug_en: Boolean = false) extends Component {
  val io = new Bundle {
    val matALoad = Vec(slave Stream (BfpBlockWithIdx(88, idx_width.r, 0, 0)), array_col)
    val matBLoad = slave Stream(UInt(88 bits))
    val sortedColIdxSlow, sortedColIdxFast = slave Stream(IndexData(idx_width.c, array_col))
    val matADbuffWrPtr, matADbuffRdPtr = in Bool()
    // colIdxFifoNotEmpty is asserted when colIdxFifo has at least
    // half of the loading
    val calEn, colIdxFifoNotEmpty  = in Bool()
    val res = Vec(master Stream(UInt(256 bits)), n_out_chans)
    val calFin = out Bool()
    // config port
    val configRowBuffWrBound = in UInt(log2Up(row_buffer_depth) bits)
    val computeLatCounter = out UInt(32 bits)
    val clrCounters = in Bool()
    // err info ports
    val err_info = out Bits(2 bits)
  }
  //parameters
  val NUM_MATB_VEC_PER_ROW: Int = num_matb_cols
  val TRANSRAM_FOLDING_FACTOR: Int = 1
  // TODO: fix parameters here
  val COLIDX2ROWMEM_DELAY = 2
  val ROWMEM2TRANSRAM_DELAY = 2
  // keeping MATB_EN_DELAY and TRANS2TCC_DELAY the same
  val MATB_EN_DELAY = 2
  val TRANSRAM_RD_II = log2Up(NUM_MATB_VEC_PER_ROW/TRANSRAM_FOLDING_FACTOR)
  val TRANS2TCC_DELAY = 0
  val ROWMEM2TCC_TOTAL_DELAY = MATB_EN_DELAY + TRANSRAM_RD_II + TRANS2TCC_DELAY
  val COL_BB_INSERT2TCC_DELAY = 2
  val COLBUF2TCC_TOTAL_DELAY = 1 + COL_BB_INSERT2TCC_DELAY
  // output parameters
  val OUT_BLK_SIZE = 18

  //adding pipes to the ctrl signals
  val calEnDelay = Delay(io.calEn, 3)
  val colIdxFifoNotEmptyDelay = Delay(io.colIdxFifoNotEmpty, 3)

  val tensorArray = Array.ofDim[TensorCoreChainBf12](array_col)
  for (c <- 0 until array_col) {
    tensorArray(c) = new TensorCoreChainBf12(
      chain_len,
      out_buf_delay = 4,
      output_width = output_width,
      ridx_width = idx_width.r
    )
    tensorArray(c).setName("u_tc_core_c_" + c)
  }

  //signals between datapath and ctrl logic
  // start signal for mat a loading
  val cascadeLoadStart = Bool()
  val cascadeLoadEnLocal = Reg(Bits(array_col bits), init=B(0))
  //  tensor core chain inner double buffer switch signal
  val tccInnerBufSelLoad = Reg(Bits(array_col bits), init=B(0))
  val tccInnerBuffSelComp = Reg(Bits(array_col bits), init=B(0))
  // used to halt mat b broadcast when waiting for the mat a load
  val matBLoadPipelineEn, matBEn4BubbleIns = Reg(Bool(), init=False)
  val matBLoadPipelineEnDelayed = Delay(matBLoadPipelineEn, MATB_EN_DELAY, init=False)
  val matBEn4BubbleInsDelayed = Delay(matBEn4BubbleIns, ROWMEM2TCC_TOTAL_DELAY + 1)

  //input buffers
  val bufferArea = new Area {
    // buffer and ctrl signal def
    // col buffer has the depth x 2 for double buffering
    val colBuffer = Array.fill(array_col)(
      new StreamFifoIp(UInt(88 + idx_width.r bits), col_buffer_depth * 2, "M20K"))
    val rowMem = Array.fill(array_col, chain_len)(
      new spram_megafunc(88, row_buffer_depth, "M20K"))
    val isCurrSubgrpALoaded = Bool()

    // row buffer write and read
    val chainTimeCorrectedRowData = Vec(Vec(UInt(88 bits), chain_len), array_col)
    val rowBuffWrAddr = Array.fill(array_col)(Counter(row_buffer_depth))
    val rowBuffWrRsel = Array.fill(array_col)(Counter(array_col))
    val rowBufferBlkOut = Vec(Flow(Vec(BfpBlockWithIdx(88, 0, 0, 0), chain_len)), array_col)

    // col buffer double buffer control and credits
    val colBufferCredit = Array.fill(array_col, 2)(Reg(UInt(log2Up(col_buffer_depth) bits), init=U(0)))

    // col buffer bubble insertion
    val casLoadBubbleInsert = Array.fill(array_col)(new CasLoadBubbleInsert(idx_width.r, chain_len, true))

    val isVecALast = Vec(for(c <- casLoadBubbleInsert) yield c.io.isVecTail).asBits
    val isLastSubVecMultIter, isCurrLoadVecEmpty = Reg(Bits(array_col bits), init=B(0).resized)
    val isLastLoadVecEmpty = Reg(Bool(), init=False)
    val colIdxFifoPopEn, isCurrCasBufLoaded, isColBufferEmpty = Bits(array_col bits)

    //col cascade loading data and ctrl
    isLastLoadVecEmpty := ~ (io.sortedColIdxSlow.payload.destId | isCurrLoadVecEmpty).orR
    io.sortedColIdxSlow.ready := colIdxFifoPopEn.orR
    for (c <- 0 until array_col) {
      // col load ctrl counters
      val preArowCasLoadCounter, postArowCasLoadCounter = Counter(chain_len)
      preArowCasLoadCounter.setName("preArowCasLoadCounter_" + c)
      postArowCasLoadCounter.setName("bufferArea_cascadeLoadCounter_" + c)
      val preArowPop3Fac, postArowPop3Fac = Counter(3)
      preArowPop3Fac.setName("bufferArea_preArowPop3Fac_" + c)
      postArowPop3Fac.setName("bufferArea_postArowPop3Fac_" + c)

      // isolate the col idx fifo pop ctrl and the col buffer pop ctrl
      // this is the col idx fifo pop
      when(cascadeLoadEnLocal(c)) {
        preArowPop3Fac.increment()
        when(preArowPop3Fac.willOverflow) {preArowCasLoadCounter.increment()}
      }

      when(io.sortedColIdxSlow.payload.idxData.msb) {
        colIdxFifoPopEn(c) := preArowCasLoadCounter.willOverflow
      }.otherwise {
        colIdxFifoPopEn(c) := preArowPop3Fac.willOverflow
      }
      when(io.sortedColIdxSlow.fire) {
        when(preArowCasLoadCounter.willOverflow) {
          isCurrLoadVecEmpty(c).clearAll()
        }.otherwise {
          isCurrLoadVecEmpty(c) := io.sortedColIdxSlow.payload.destId(c) | isCurrLoadVecEmpty(c)
        }
      }

      // this is the col buffer pop ctrl
      // FIXME: dangerous! Regarding col buffer empty as a signal
      // for cascade loading finished.
      // must make sure starting calc only when it receives all mat A
      // and the col buffer is large enough hold all mat A.
      val currColRdCredit = io.matADbuffRdPtr ? colBufferCredit(c)(1) | colBufferCredit(c)(0)
      currColRdCredit.setName("currColRdCredit_" + c)
      // isCurrCasBufLoaded(c) := preArowCasLoadCounter.willOverflow | (currColRdCredit === 0)
      isCurrCasBufLoaded(c) := preArowCasLoadCounter.willOverflow
      isColBufferEmpty(c) := currColRdCredit === 0

      when(cascadeLoadEnLocal(c)) {
        when(isCurrCasBufLoaded(c)) {
          // TODO: this might only work under current config
          isLastSubVecMultIter(c) := isVecALast(c)
          when(cascadeLoadStart && colBuffer(c).io.pop.valid) {
            cascadeLoadEnLocal(c) := True
          }.otherwise {
            cascadeLoadEnLocal(c) := False
          }
        }
      }.otherwise {
        // don't reset/set cascadeLoadCounter/lastCasloadAmt as the
        // row controller needs to check isCurrCasBufLoaded to know
        // if safe to start next iter
        when(cascadeLoadStart && colBuffer(c).io.pop.valid) {
          postArowCasLoadCounter.clear()
          isLastSubVecMultIter(c) := False
          cascadeLoadEnLocal(c) := True
        }
      }

      when(isCurrCasBufLoaded(c)) {
        tccInnerBufSelLoad(c) := ~tccInnerBufSelLoad(c)
      }

      when(casLoadBubbleInsert(c).io.datWithBubble.valid) {
        postArowPop3Fac.increment()
      }
      when(postArowPop3Fac.willOverflow) {postArowCasLoadCounter.increment()}


      casLoadBubbleInsert(c).io.casLoadBufIn <<
        colBuffer(c).io.pop.map(x => BfpBlockWithIdx(88, idx_width.r, 0, 0).fromUInt(x))
      casLoadBubbleInsert(c).io.casLoadEn := Delay(cascadeLoadEnLocal(c), 1, init=False)
      casLoadBubbleInsert(c).io.colSel := True

      colBuffer(c).io.push << io.matALoad(c).map(x => x.asUInt)

      // actual col buffer credit control
      when(io.matADbuffWrPtr === io.matADbuffRdPtr) {
        when(colBuffer(c).io.push.fire) {
          when(io.matADbuffWrPtr) {
            colBufferCredit(c)(1) := colBufferCredit(c)(1) + 1
          }
          when(~io.matADbuffWrPtr) {
            colBufferCredit(c)(0) := colBufferCredit(c)(0) + 1
          }
        }.elsewhen(colBuffer(c).io.pop.fire) {
          when(io.matADbuffRdPtr) {
            colBufferCredit(c)(1) := colBufferCredit(c)(1) - 1
          }
          when(~io.matADbuffRdPtr) {
            colBufferCredit(c)(0) := colBufferCredit(c)(0) - 1
          }
        }
      }.otherwise {
        when(io.matADbuffWrPtr) {
          when(colBuffer(c).io.push.fire) {
            colBufferCredit(c)(1) := colBufferCredit(c)(1) + 1
          }
          when(colBuffer(c).io.pop.fire) {
            colBufferCredit(c)(0) := colBufferCredit(c)(0) - 1
          }
        }.otherwise {
          when(colBuffer(c).io.push.fire) {
            colBufferCredit(c)(0) := colBufferCredit(c)(0) + 1
          }
          when(colBuffer(c).io.pop.fire) {
            colBufferCredit(c)(1) := colBufferCredit(c)(1) - 1
          }
        }
      }
    }

    // row broadcast data and ctrl
    // row buff fetch fifo push ctrl
    //push vector tail before popping sortedColIdx, then skip the actual sortedColIdx popping

    // row mem reading ctrl
    val transposeBufferValid = Bool()
    val rowPrefetchEnStart = Reg(Bool())
    val rowMemRdAddr = UInt(log2Up(row_buffer_depth) bits)
    val isRowMemRdAddrTail = Delay(io.sortedColIdxFast.payload.idxData.msb, COLIDX2ROWMEM_DELAY + 2)

    val rowMemRdStateMachine = new StateMachine {
      //  + 1 because transposeBufferOccuCtrl to transposeBufferOccu has 1 extra delay
      val rdPropaCounter = Counter(COLIDX2ROWMEM_DELAY + 2 + 1)
      val rowBufferFetchFifoPopCounter =
        (TRANSRAM_FOLDING_FACTOR > 1) generate Counter(TRANSRAM_FOLDING_FACTOR)
      val rowMemRdCounter = DynaCounter(log2Up(row_buffer_depth), io.configRowBuffWrBound)
      val isCheckingOccu = Reg(Bool(), init=False)
      val rowMemRdValid = Bool()

      rowMemRdValid := False
      io.sortedColIdxFast.ready := False

      val sIdle: State = new State with EntryPoint {
        whenIsActive {
          when(io.sortedColIdxFast.valid & transposeBufferValid & rowPrefetchEnStart) {
            goto(sRead)
          }
        }
      }

      val sRead: State = new State {
        whenIsActive {
          if(TRANSRAM_FOLDING_FACTOR > 1) {
            rowBufferFetchFifoPopCounter.increment()
            io.sortedColIdxFast.ready :=
              rowBufferFetchFifoPopCounter.willOverflow | io.sortedColIdxFast.payload.idxData.msb
            rowMemRdValid := ~io.sortedColIdxFast.payload.idxData.msb
            when(rowBufferFetchFifoPopCounter.willOverflow) {
              rowMemRdCounter.increment()
            }
            when(rowMemRdCounter.willOverflow || io.sortedColIdxFast.payload.idxData.msb) {
              goto(sConfirm)
            }
          } else {
            rowMemRdCounter.increment()
            io.sortedColIdxFast.ready := True
            rowMemRdValid := True
            when(rowMemRdCounter.willOverflow) {
              rowMemRdValid := False
              goto(sConfirm)
            }
          }
        }
      }

      val sConfirm: State = new State {
        whenIsActive {
          rowMemRdCounter.clear()
          if (TRANSRAM_FOLDING_FACTOR > 1) {
            rowBufferFetchFifoPopCounter.clear()
          }
          io.sortedColIdxFast.ready := io.sortedColIdxFast.payload.idxData.msb
          when(isCheckingOccu) {
            when(transposeBufferValid) {
              isCheckingOccu := False
              when(io.sortedColIdxFast.valid && rowPrefetchEnStart) {
                goto(sRead)
              }.otherwise {
                goto(sIdle)
              }
            }
          }.otherwise {
            rdPropaCounter.increment()
            when(rdPropaCounter.willOverflow) {isCheckingOccu := True}
          }
        }
      }
    }

    rowMemRdAddr := rowMemRdStateMachine.rowMemRdCounter

    // copy row mem array_col times, each serving as a bank for one DPE (tensor core chain)
    for (c <- 0 until array_col) {
      val benesNet = BenesNet(num_ports=chain_len, bitwidth=88, dest_width=chain_len)
      val rowBuffParaRd = Vec(UInt(88 bits), chain_len).setName("rowBuffOut_cp" + c)
      val rowBuffWrVecSel = new Bundle {
        val vecId = Counter(chain_len)
        val foldBufSel = (TRANSRAM_FOLDING_FACTOR > 1) generate Counter(TRANSRAM_FOLDING_FACTOR)
      }
      val isTransRamRdValid = Reg(Bool(), init=False).setName("isTransRamRdValid_cp" + c)

      if (c == 0) {
        transposeBufferValid := True
      }

      // global write buffer signal
      when(io.matBLoad.fire) {
        when(rowBuffWrAddr(c).value + 1 === io.configRowBuffWrBound) {
          rowBuffWrAddr(c).clear()
          rowBuffWrVecSel.vecId.increment()
        }.otherwise {
          rowBuffWrAddr(c).increment()
        }
        if (TRANSRAM_FOLDING_FACTOR > 1) {
          when(rowBuffWrVecSel.vecId.willOverflow) {
            rowBuffWrVecSel.foldBufSel.increment()
          }
          when(rowBuffWrVecSel.foldBufSel.willOverflow) {
            rowBuffWrRsel(c).increment()
          }
        } else {
          when(rowBuffWrVecSel.vecId.willOverflow) {
            rowBuffWrRsel(c).increment()
          }
        }
      }

      // row buffer write logic
      for (vecId <- 0 until chain_len) {
        if (TRANSRAM_FOLDING_FACTOR > 1) {
          rowMem(c)(vecId).io.wraddress := rowBuffWrVecSel.foldBufSel.value @@ rowBuffWrAddr(c).value
        } else {
          rowMem(c)(vecId).io.wraddress := rowBuffWrAddr(c).value
        }
        rowMem(c)(vecId).io.wren :=
          io.matBLoad.valid & rowBuffWrVecSel.vecId.value === vecId & rowBuffWrRsel(c) === c
        rowMem(c)(vecId).io.data := io.matBLoad.payload

        // row buffer read logic
        rowMem(c)(vecId).io.rdaddress := rowMemRdAddr

        // row connection logic
        // pre-delay the row-input for cascade chain timing alignment
        chainTimeCorrectedRowData(c)(vecId) := BlockDelay(rowMem(c)(vecId).io.q, 2 * vecId, "MLAB")

        val rowConn = BfpBlockWithIdx(88, 0, 0, chain_len)
        rowConn.blkData := chainTimeCorrectedRowData(c)(vecId)
        rowConn.destId := Delay(io.sortedColIdxSlow.payload.destId, 5).resized
        benesNet.io.inputSeq(vecId) := rowConn
        rowBufferBlkOut(c).payload(vecId).blkData := benesNet.io.outputSeq(vecId).payload.blkData
      }
      rowBufferBlkOut(c).valid := Delay(rowMemRdStateMachine.rowMemRdValid, 4)

      // TODO: magic number here. why 2 cycles delay?
      when(Delay(rowMemRdStateMachine.rowMemRdCounter.willOverflow, 2)) {
        tccInnerBuffSelComp(c) := ~tccInnerBuffSelComp(c)
      }
    }
  }

  // data connection from row/col buffer to the tensor core chains
//  val delayedRowBufferBlkOut = Vec(Vec(Vec(UInt(88 bits), array_col), chain_len), array_row)
//  for(r <- 0 until array_row; tcId <- 0 until chain_len) {
//    delayedRowBufferBlkOut(r)(tcId) := DelayTree(
//      bufferArea.rowBufferBlkOut.payload(r)(tcId).blkData, array_col)
//  }
  val CASIN_DATIN_DELAY_DELTA = ROWMEM2TCC_TOTAL_DELAY - COLBUF2TCC_TOTAL_DELAY - 1

  for (c <- 0 until array_col) {
    val delayedLoadCascadeIn = Delay(bufferArea.casLoadBubbleInsert(c).io.datWithBubble.payload.blkData(79 downto 0),
      COL_BB_INSERT2TCC_DELAY + CASIN_DATIN_DELAY_DELTA)
    val delayedExpCascadeIn = Delay(bufferArea.casLoadBubbleInsert(c).io.datWithBubble.payload.blkData(87 downto 80),
      COL_BB_INSERT2TCC_DELAY + CASIN_DATIN_DELAY_DELTA)
    val delayedRowIdx = Delay(bufferArea.casLoadBubbleInsert(c).io.datWithBubble.payload.rIdx,
      COL_BB_INSERT2TCC_DELAY + CASIN_DATIN_DELAY_DELTA)
    val delayedCasInValid = Delay(bufferArea.casLoadBubbleInsert(c).io.datWithBubble.valid,
      COL_BB_INSERT2TCC_DELAY + CASIN_DATIN_DELAY_DELTA, init=False)

    tensorArray(c).io.dataIn.valid :=
      Delay(bufferArea.rowBufferBlkOut(c).valid, TRANS2TCC_DELAY, init=False) | matBEn4BubbleInsDelayed
    // row-wise broadcasting
    for (tcId <- 0 until chain_len) {
      tensorArray(c).io.dataIn.payload(tcId) :=
        Delay(bufferArea.rowBufferBlkOut(c).payload(tcId).blkData(79 downto 0), TRANS2TCC_DELAY)
      tensorArray(c).io.expIn(tcId) :=
        Delay(bufferArea.rowBufferBlkOut(c).payload(tcId).blkData(87 downto 80), TRANS2TCC_DELAY)
    }

    // reconstruct load cascade input
    val delayedCasInWithIdx = BfpBlockWithIdx(80, idx_width.r, 0, 0).fromUInt(delayedRowIdx @@ delayedLoadCascadeIn)
    tensorArray(c).io.loadCascadeIn.payload := delayedCasInWithIdx
    tensorArray(c).io.expCascadeIn := delayedExpCascadeIn
    tensorArray(c).io.loadCascadeIn.valid := delayedCasInValid
    // tensor core input iters: number of iterations to take matB sub columns
    //   it is the number of B columns for a tensor core chain row.
    //   it equals to the chain_loading_latency when the Dot Product
    //   hides the matA loading latency just fine.
    tensorArray(c).io.matABroadcastIters := U(NUM_MATB_VEC_PER_ROW, 16 bits)
    tensorArray(c).io.doubleBufferLoadSel :=
      Delay(tccInnerBufSelLoad(c) ## (~tccInnerBufSelLoad(c)), COLBUF2TCC_TOTAL_DELAY + 1 + CASIN_DATIN_DELAY_DELTA)
    tensorArray(c).io.doubleBufferCompSel := Delay(tccInnerBuffSelComp(c), TRANS2TCC_DELAY + 2)
  }

  // compute control path
  //row buffer ctrl
  val rowCtrlFsm = new StateMachine {
    val matBDataFeedCounter = Counter(NUM_MATB_VEC_PER_ROW)
    val isCurrSubvecMatmulFin = Reg(Bool(), init=False)
    val isFakeComputeIter = Reg(Bool(), init=False)
    // default
    io.matBLoad.ready := False
    matBLoadPipelineEn := False
    matBEn4BubbleIns := False
    io.calFin := False

    val sIdle: State = new State with EntryPoint {
      whenIsActive {
        matBDataFeedCounter.clear()
        isCurrSubvecMatmulFin := False
        io.matBLoad.ready := True
        when(bufferArea.isCurrSubgrpALoaded) {goto(sCompute)}
      }
    }

    val sCompute: State = new State {
      whenIsActive {
        when(~isFakeComputeIter) {
          matBLoadPipelineEn := True
          matBEn4BubbleIns := False
        }.otherwise {
          matBLoadPipelineEn := False
          matBEn4BubbleIns := True
        }
        isCurrSubvecMatmulFin := False
        when(matBLoadPipelineEn || matBEn4BubbleIns) {
          matBDataFeedCounter.increment()
        }
        // check data validity every mat B broadcast iteration
        when(matBDataFeedCounter.willOverflow) {
          matBDataFeedCounter.clear()
          when(bufferArea.isColBufferEmpty.andR) {
            goto(sCompFin)
          }.otherwise{
            isCurrSubvecMatmulFin := True
            // if compute cannot be covered by next grps of mat a load
            // hold to wait for next mat A load grp
            when(~bufferArea.isCurrSubgrpALoaded) {
              matBLoadPipelineEn := False
              matBEn4BubbleIns := False
              isFakeComputeIter := False
              goto(sWaitALoad)
            }.otherwise {
              isFakeComputeIter := bufferArea.isLastLoadVecEmpty
              matBLoadPipelineEn := ~bufferArea.isLastLoadVecEmpty
              matBEn4BubbleIns := bufferArea.isLastLoadVecEmpty
            }
          }
        }
      }
    }

    val sWaitALoad: State = new State {
      whenIsActive {
        matBLoadPipelineEn := False
        when(bufferArea.isCurrCasBufLoaded.orR) {
          isCurrSubvecMatmulFin := False
          isFakeComputeIter := bufferArea.isLastLoadVecEmpty
          when(bufferArea.isColBufferEmpty.andR) {
            goto(sCompFin)
          }.otherwise {
            goto(sCompute)
          }
        }
      }
    }

    val sCompFin: State = new State {
      whenIsActive{
        // keep sending mat B data until the last subgroup
        // finishes
        matBDataFeedCounter.increment()
        matBLoadPipelineEn := ~matBDataFeedCounter.willOverflow
        when(matBDataFeedCounter.willOverflow){
          isCurrSubvecMatmulFin := True
          io.calFin := True
          goto(sIdle)
        }
      }
    }
  }

  //col buffer ctrl
  val colCtrlFsm = new StateMachine {
    cascadeLoadStart := False
    bufferArea.isCurrSubgrpALoaded := False

    val isCalStartRecv = Reg(Bool(), init=False)
    val delayedMatMulFin = Bool()
//    val colBufferNotEmpty = bufferArea.colBuffer.last.io.almostFull
//    if (ROWMEM2TCC_TOTAL_DELAY > COLBUF2TCC_TOTAL_DELAY) {
//      delayedMatMulFin :=
//        Delay(rowCtrlFsm.isCurrSubvecMatmulFin, ROWMEM2TCC_TOTAL_DELAY - COLBUF2TCC_TOTAL_DELAY)
//    } else {
//      delayedMatMulFin := rowCtrlFsm.isCurrSubvecMatmulFin
//    }
    delayedMatMulFin := rowCtrlFsm.isCurrSubvecMatmulFin

    val sIdle: State = new State with EntryPoint {
      whenIsActive {
        bufferArea.rowPrefetchEnStart := False
        bufferArea.isCurrSubgrpALoaded := False
        when(~isCalStartRecv) {
          isCalStartRecv := calEnDelay.rise()
        }
        when(isCalStartRecv && colIdxFifoNotEmptyDelay) {
          cascadeLoadStart := True
          goto(sWaitIdx)
        }
      }
    }

    val sWaitIdx: State = new State {
      //load first mat A row from col mem here
      whenIsActive {
        bufferArea.rowPrefetchEnStart := True
        //TODO: consider which isCurrCasBufLoaded to connect here
        // to have a better STA result
        when(bufferArea.isCurrCasBufLoaded(0)) {
          bufferArea.isCurrSubgrpALoaded := True
          when(io.sortedColIdxSlow.valid) {
            cascadeLoadStart := True
            goto(sLoadAVec)
          } .otherwise {
            isCalStartRecv := False
            goto(sIdle)
          }
        }
      }
    }

    val sLoadAVec: State = new State {
      whenIsActive {
        bufferArea.isCurrSubgrpALoaded := bufferArea.isCurrCasBufLoaded.orR
        // check if finishing one mat A subvector load
        when(bufferArea.isColBufferEmpty.andR) {
          isCalStartRecv := False
          goto(sIdle)
        }.otherwise {
          when(bufferArea.isCurrCasBufLoaded.orR) {
            // check if need to wait computation
            when(delayedMatMulFin) {
              // check if need to send more mat a rows
              cascadeLoadStart := True
            }.otherwise {
              goto(sWaitComplete)
            }
          }
        }
      }
    }

    val sWaitComplete: State = new State {
      whenIsActive {
        when(delayedMatMulFin) {
          // check if need to send more mat A rows
          when(bufferArea.isColBufferEmpty.andR) {
            isCalStartRecv := False
            bufferArea.rowPrefetchEnStart := True
            goto(sIdle)
          }.otherwise {
            cascadeLoadStart := True
            goto(sLoadAVec)
          }
        }
      }
    }
  }

  //output control
  //output buffer path
  val outBfpConv = Array.fill(array_col, 3)(Flow(BfpBlockWithIdx(output_width, idx_width.r, 0, 0)))

  for (c <- 0 until array_col) {
    tensorArray(c).io.dataInLast :=
      Delay(bufferArea.isLastSubVecMultIter(c), ROWMEM2TCC_TOTAL_DELAY + 1) | matBEn4BubbleInsDelayed
  }

  for (c <- 0 until array_col) {
    for (b <- 0 until 3) {
      val srlRowOutDataMover = SrlDataMover(BfpBlockWithIdx(output_width, idx_width.r, 0, 0), chain_len)
      srlRowOutDataMover.setName("srlRowOutDataMover_pe" + c + "_c" + b)
      srlRowOutDataMover.io.enable := tensorArray(c).io.dataInLast

      for (cid <- 0 until chain_len) {
        srlRowOutDataMover.io.inFlow(cid).payload := tensorArray(c).io.res.payload(cid * 3 + b)
        srlRowOutDataMover.io.inFlow(cid).valid := tensorArray(c).io.res.valid
      }

      outBfpConv(c)(b) := srlRowOutDataMover.io.outFlow
    }
  }
  // TODO: fix 88 bit width conversion
  val outBuffer = Array.fill(n_out_chans)(
    new StreamOutAsymFifo(
      input_width = (output_width + idx_width.r) * 3 * array_col / n_out_chans,
      output_width = (output_width + idx_width.r) * n_words_outchan,
      depth=output_fifo_depth
    )
  )
  for (regIdx <- 0 until n_out_chans) {
    outBuffer(regIdx).io.push.valid := outBfpConv(regIdx * array_col / n_out_chans)(0).valid
    outBuffer(regIdx).io.push.payload := Vec(
      for {
        i <- regIdx * array_col / n_out_chans until (regIdx + 1) * array_col / n_out_chans;
        j <- 0 until 3
      } yield outBfpConv(i)(j).payload
    ).asBits.asUInt
    
    io.res(regIdx) << outBuffer(regIdx).io.pop.translateWith(outBuffer(regIdx).io.pop.payload.resize(256 bits))
  }

  // perf and debug counters
  val computeLatCounter = PerfCounter(32, colCtrlFsm.isActive(colCtrlFsm.sWaitIdx), io.calFin, io.clrCounters)
  io.computeLatCounter := computeLatCounter.value

  //temp perf counter for all col mem
//  val colMemRdCounters = Array.fill(array_col)(Counter(16 bits))
//  for (colIdx <- 0 until array_col) {
//    colMemRdCounters(colIdx)
//      .setName("debug_colMemRdCounter" + colIdx)
//      .dontSimplifyIt()
//      .addAttribute("preserve_for_debug")
//    when(~colMemRdCounters(colIdx).willOverflowIfInc) {
//      when(bufferArea.colBuffer(colIdx).io.push.fire) {
//        colMemRdCounters(colIdx).increment()
//      }
//    }
//  }

  //err detection
  io.err_info(0) := ~rowCtrlFsm.isActive(rowCtrlFsm.sIdle)
  io.err_info(1) := ~colCtrlFsm.isActive(colCtrlFsm.sIdle)

  if(debug_en) {
    val loadCounter = Counter(3 * chain_len, inc = tensorArray(0).io.loadCascadeIn.valid)
      .setName("debug_loadcounter")
      .dontSimplifyIt()
      .init(U(0))
    val inCounter = Counter(NUM_MATB_VEC_PER_ROW, inc = tensorArray(0).io.dataIn.valid)
      .setName("debug_incounter")
      .dontSimplifyIt()
      .init(U(0))
    val idxFastRdCounter = Counter(65536, inc = io.sortedColIdxFast.fire)
      .setName("debug_idx_fast_counter")
      .dontSimplifyIt()
      .init(U(0))
    val idxSlowRdCounter = Counter(65536, inc = io.sortedColIdxSlow.fire)
      .setName("debug_idx_slow_counter")
      .dontSimplifyIt()
      .init(U(0))
    val outPshCounter = Counter(65536, inc = outBfpConv(0)(0).valid)
      .setName("debug_out_counter")
      .dontSimplifyIt()
      .init(U(0))
    for (c <- bufferArea.colBuffer.indices) {
      val spInCounter = Counter(65536, inc = bufferArea.colBuffer(c).io.pop.fire)
        .setName("debug_sp_incounter_c" + c)
        .dontSimplifyIt()
        .init(U(0))
    }
    outBuffer.foreach(_.io.push.ready.dontSimplifyIt())
  }
}

object TensorCoreArrayGen extends App{
  val max_seq_len = 4480
  val idx_width = 12

  val gen = new DefaultConfig
  gen.defaultSpinalConfig.generate(new TensorCoreChainArray(
    array_col = 12,
    chain_len = 8,
    idx_width = IdxWidth(12, 9),
    col_buffer_depth = 128,
    row_buffer_depth = pow(2, log2Up(max_seq_len / 20)).toInt,
    out_buf_delay = 4,
    output_fifo_depth = 1024,
    output_width = 24,
    inout_pipe_delay = 4,
    debug_en = true
  )).printPruned()
}
