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
    zeroData.blkData.clearAll()
    if(ridx_width > 0) {zeroData.rIdx.clearAll()}
    if(cidx_width > 0) {zeroData.cIdx.clearAll()}
    if(dest_id_width > 0) {zeroData.destId.clearAll()}
    zeroData.asInstanceOf[this.type]
  }

  def asUInt: UInt = {
    val res = UInt(this.getBitsWidth bits)
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

class CasLoadBubbleInsert(ridx_width: Int, chain_len: Int) extends Component {
  val io = new Bundle {
    val casLoadBufIn = slave Stream(BfpBlockWithIdx(88, ridx_width, 0, 0))
    val datWithBubble = master Flow(BfpBlockWithIdx(88, ridx_width, 0, 0))
    val casLoadEn, colSel = in Bool()
    val isVecTail = out Bool()
  }

  io.isVecTail.setAsReg()

  val outReg = Reg(BfpBlockWithIdx(88, ridx_width, 0, 0))
  outReg.blkData.init(0)
  outReg.rIdx.init(U(BigInt("1" * ridx_width, 2)))

  val cachedRidx = Reg(UInt(ridx_width bits), init=U(0))
  val isTailPadding = Reg(Bool(), False)
  val casLoadTailPaddingCtr = Counter(chain_len)
  val casLoad3FactorCtr = Counter(3)

  io.casLoadBufIn.ready := False
  io.datWithBubble.valid := Delay(io.casLoadEn, 1, init=False)

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

class TensorCoreChainArray(array_col: Int, array_row: Int, chain_len: Int, idx_width: IdxWidth,
                           col_buffer_depth: Int, row_buffer_depth: Int,
                           out_buf_delay: Int, //should be (matBCols / array_row).ceil.toInt - 3
                           output_fifo_depth: Int, output_width: Int,
                           inout_pipe_delay: Int = 5, num_matb_cols: Int = 128,
                           n_out_chans: Int = 2, n_words_outchan: Int = 2,
                           debug_en: Boolean = false) extends Component {
  val io = new Bundle {
    val matALoad = Vec(slave Stream (BfpBlockWithIdx(88, idx_width.r, 0, 0)), array_col)
    val matBLoad = Vec(slave Stream(UInt(88 bits)), array_row)
    val sortedColIdxSlow, sortedColIdxFast = slave Stream(IndexData(idx_width.c, array_col))
    // colIdxFifoNotEmpty is asserted when colIdxFifo has at least
    // half of the loading
    val calEn, colIdxFifoNotEmpty  = in Bool()
    val res = Vec(master Stream(UInt(256 bits)), n_out_chans)
    // config port
    val configRowBuffWrBound = in UInt(log2Up(row_buffer_depth) bits)
    val latCounter = out UInt(16 bits)
  }
  //parameters
  val NUM_MATB_VEC_PER_ROW: Int = ceil(num_matb_cols.toFloat / array_row.toFloat).toInt
  val TRANSRAM_FOLDING_FACTOR: Int = 2
  // TODO: fix parameters here
  val COLIDX2ROWMEM_DELAY = 2
  val ROWMEM2TRANSRAM_DELAY = 2
  // keeping MATB_EN_DELAY and TRANS2TCC_DELAY the same
  val MATB_EN_DELAY = 2
  val TRANSRAM_RD_II = log2Up(NUM_MATB_VEC_PER_ROW/TRANSRAM_FOLDING_FACTOR)
  val TRANS2TCC_DELAY = 2
  val ROWMEM2TCC_TOTAL_DELAY = MATB_EN_DELAY + TRANSRAM_RD_II + TRANS2TCC_DELAY
  val COL_BB_INSERT2TCC_DELAY = 2
  val COLBUF2TCC_TOTAL_DELAY = 1 + COL_BB_INSERT2TCC_DELAY
  // output parameters
  val OUT_BLK_SIZE = 18

  //adding pipes to the ctrl signals
  val calEnDelay = Delay(io.calEn, 3)
  val colIdxFifoNotEmptyDelay = Delay(io.colIdxFifoNotEmpty, 3)

  val tensorArray = Array.ofDim[TensorCoreChainBf12](array_row, array_col)
  for (r <- 0 until array_row; c <- 0 until array_col) {
    // out buf delay = number of B columns in each tensor core chain row - 3
    tensorArray(r)(c) = new TensorCoreChainBf12(
      chain_len,
      out_buf_delay = 4,
      output_width = output_width,
      ridx_width = idx_width.r
    )
    tensorArray(r)(c).setName("u_tc_core_r_" + r + "_c_" + c)
  }

  //signals between datapath and ctrl logic
  // start signal for mat a loading
  val cascadeLoadStart = Bool()
  val cascadeLoadEnLocal = Reg(Bits(array_col bits), init=B(0))
  //  tensor core chain inner double buffer switch signal
  val tccInnerBufSelLoad = Reg(Bits(array_col bits), init=B(0))
  val tccInnerBuffSelComp = Reg(Bits(array_row bits), init=B(0))
  // used to halt mat b broadcast when waiting for the mat a load
  val matBLoadPipelineEn, matBEn4BubbleIns = Reg(Bool(), init=False)
  val matBLoadPipelineEnDelayed = Delay(matBLoadPipelineEn, MATB_EN_DELAY, init=False)
  val matBEn4BubbleInsDelayed = BlockDelay(matBEn4BubbleIns, ROWMEM2TCC_TOTAL_DELAY + 1, "MLAB")
  //input buffers
  val bufferArea = new Area {
    // buffer and ctrl signal def
    val colBuffer = Array.fill(array_col)(new StreamOutFifo(88 + idx_width.r, col_buffer_depth, "M20K"))
    val rowMem = Array.fill(array_row, NUM_MATB_VEC_PER_ROW / TRANSRAM_FOLDING_FACTOR)(
      new spram_megafunc(88, row_buffer_depth * TRANSRAM_FOLDING_FACTOR, "M20K"))
    val isCurrSubgrpALoaded = Bool()
    val isColBufferEmpty = Vec(for(c <- colBuffer) yield ~c.io.pop.valid).andR

    // row buffer write and read
    val rowBuffWrAddr = Array.fill(array_row)(Counter(row_buffer_depth))
    val rowBufferBlkOut = Flow(Vec(Vec(BfpBlockWithIdx(88, 0, 0, 0), chain_len), array_row))

    // col buffer bubble insertion
    val casLoadBubbleInsert = Array.fill(array_col)(new CasLoadBubbleInsert(idx_width.r, chain_len))

    val isVecALast = Vec(for(c <- casLoadBubbleInsert) yield c.io.isVecTail).asBits
    val isLastSubVecMultIter, isCurrLoadVecEmpty = Reg(Bits(array_col bits), init=B(0).resized)
    val isCurrCasBufLoaded = Bits(array_col bits)
    val isLastLoadVecEmpty = Reg(Bool(), init=False)
    val colIdxFifoPopEn = Bool()

    //col cascade loading data and ctrl
    io.sortedColIdxSlow.ready := colIdxFifoPopEn
    for (c <- 0 until array_col) {
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

      // TODO: be careful of the routing length since ctrl_logic[0] is used here
      if (c == 0) {
        when(io.sortedColIdxSlow.payload.idxData.msb) {
          colIdxFifoPopEn := preArowCasLoadCounter.willOverflow
        }.otherwise {
          colIdxFifoPopEn := preArowPop3Fac.willOverflow
        }
        when(io.sortedColIdxSlow.fire) {
          when(preArowCasLoadCounter.willOverflow) {
            isCurrLoadVecEmpty.clearAll()
          }.otherwise {
            isCurrLoadVecEmpty := io.sortedColIdxSlow.payload.destId | isCurrLoadVecEmpty
          }
        }

        isLastLoadVecEmpty := ~ (io.sortedColIdxSlow.payload.destId | isCurrLoadVecEmpty).orR
      }
      // this is the col buffer pop ctrl
      isCurrCasBufLoaded(c) := preArowCasLoadCounter.willOverflow

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
      casLoadBubbleInsert(c).io.casLoadEn := Delay(cascadeLoadEnLocal(c), 1)
      casLoadBubbleInsert(c).io.colSel := Delay(io.sortedColIdxSlow.payload.destId(c), 1)

      colBuffer(c).io.push << io.matALoad(c).map(x => x.asUInt)
    }

    // row broadcast data and ctrl
    // row buff fetch fifo push ctrl
    //push vector tail before popping sortedColIdx, then skip the actual sortedColIdx popping

    // row mem reading ctrl
    val transposeBufferValid = Bool()
    val rowPrefetchEnStart = Reg(Bool())
    val rowMemRdAddr = UInt(log2Up(row_buffer_depth * TRANSRAM_FOLDING_FACTOR) bits)
    val isRowMemRdAddrTail = Delay(io.sortedColIdxFast.payload.idxData.msb, COLIDX2ROWMEM_DELAY + 2)

    val rowMemRdStateMachine = new StateMachine {
      //  + 1 because transposeBufferOccuCtrl to transposeBufferOccu has 1 extra delay
      val rdPropaCounter = Counter(COLIDX2ROWMEM_DELAY + 2 + 1)
      val rowBufferFetchFifoPopCounter =
        (TRANSRAM_FOLDING_FACTOR > 1) generate Counter(TRANSRAM_FOLDING_FACTOR)
      val rowMemRdCounter = Counter(chain_len)
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
            rowMemRdValid := ~io.sortedColIdxFast.payload.idxData.msb
            when(rowMemRdCounter.willOverflow || io.sortedColIdxFast.payload.idxData.msb) {
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

    if (TRANSRAM_FOLDING_FACTOR > 1) {
      rowMemRdAddr := Delay(
        rowMemRdStateMachine.rowBufferFetchFifoPopCounter.value @@
          io.sortedColIdxFast.payload.idxData(idx_width.c-2 downto 0).resize(log2Up(row_buffer_depth)),
        COLIDX2ROWMEM_DELAY)
    } else {
      rowMemRdAddr := Delay(
        io.sortedColIdxFast.payload.idxData(idx_width.c-2 downto 0).resize(log2Up(row_buffer_depth)),
        COLIDX2ROWMEM_DELAY)
    }

    for (r <- 0 until array_row) {
      val rowBuffParaRd =
        Vec(UInt(88 bits), NUM_MATB_VEC_PER_ROW / TRANSRAM_FOLDING_FACTOR).setName("rowBuffOut_" + r)
      val rowBuffWrVecSel = new Bundle {
        val vecId = Counter(NUM_MATB_VEC_PER_ROW / TRANSRAM_FOLDING_FACTOR)
        val foldBufSel = Counter(TRANSRAM_FOLDING_FACTOR)
      }
      val rowTransBuffWrCtrl =
        Reg(Bits(chain_len bits), init=B(chain_len bits, 0 -> true, default -> false))
          .setName("bufferArea_rowBuffWrCtrl_" + r)
      val rowTransBuffRdAddr = Counter(NUM_MATB_VEC_PER_ROW).setName("bufferArea_transposeBufRdAddr_" + r)
      val rowTransBuffFakeRdCtr = Counter(NUM_MATB_VEC_PER_ROW).setName("bufferArea_rowTransBuffFakeRdCtr_" + r)
      val transposeBufferOccu = Reg(UInt(2 bits), init=U(0))
      transposeBufferOccu.setName("bufferArea_transposeBufOccu_" + r)
      val transposeBufferWrDbufSel = Reg(UInt(1 bits), init=U(0))
      val transposeBufferWrAddr =
        UInt(1 + log2Up(TRANSRAM_FOLDING_FACTOR) bits).setName("bufferArea_transposeBufWrAddr_" + r)
      val isTransRamRdValid = Reg(Bool(), init=False).setName("isTransRamRdValid_" + r)
      val transposeBuffer = Array.fill(chain_len)(
        AsymBufferN2One(
          bitwidth = 88,
          num_in_words = NUM_MATB_VEC_PER_ROW / TRANSRAM_FOLDING_FACTOR,
          wr_depth = 2 * TRANSRAM_FOLDING_FACTOR,
          folding_factor = TRANSRAM_FOLDING_FACTOR,
          megfunc_type = "spram"
        )
      )

      if (r == 0) {
        transposeBufferValid := transposeBufferOccu < TRANSRAM_FOLDING_FACTOR
        rowBufferBlkOut.valid := Delay(isTransRamRdValid, TRANSRAM_RD_II)
      }

      // global write buffer signal
      when(io.matBLoad(r).fire) {
        when(rowBuffWrAddr(r).value + 1 === io.configRowBuffWrBound) {
          rowBuffWrAddr(r).clear()
          rowBuffWrVecSel.vecId.increment()
        }.otherwise {
          rowBuffWrAddr(r).increment()
        }
        when(rowBuffWrVecSel.vecId.willOverflow) {rowBuffWrVecSel.foldBufSel.increment()}
      }
      for (vecId <- 0 until NUM_MATB_VEC_PER_ROW / TRANSRAM_FOLDING_FACTOR) {
        // row buffer write logic
        rowMem(r)(vecId).io.wraddress := rowBuffWrVecSel.foldBufSel.value @@ rowBuffWrAddr(r).value
        rowMem(r)(vecId).io.wren := io.matBLoad(r).valid & rowBuffWrVecSel.vecId.value === vecId
        rowMem(r)(vecId).io.data := io.matBLoad(r).payload

        // row buffer read logic
        rowMem(r)(vecId).io.rdaddress := rowMemRdAddr
        rowBuffParaRd(vecId) := rowMem(r)(vecId).io.q
      }

      val transposeBufferOccuCtrl = rowTransBuffRdAddr.willOverflow ## transposeBufferWrDbufSel(0).edge()
      transposeBufferOccuCtrl.setName("bufferArea_transposeBufferOccuCtrl_" + r)
      val rowMemRdValidDelayed4TrBufWr = Delay(rowMemRdStateMachine.rowMemRdValid, COLIDX2ROWMEM_DELAY + 2)
      if (TRANSRAM_FOLDING_FACTOR > 1) {
        val transposeBufferWrFbufSel = Counter(TRANSRAM_FOLDING_FACTOR).setName("transposeBufWrFbufSel_" + r)
        transposeBufferWrAddr := transposeBufferWrDbufSel @@ transposeBufferWrFbufSel.value
        when(rowMemRdValidDelayed4TrBufWr) {
          transposeBufferWrFbufSel.increment()
          when(transposeBufferWrFbufSel.willOverflow) {
            rowTransBuffWrCtrl := rowTransBuffWrCtrl.rotateLeft(1)
            when(rowTransBuffWrCtrl.msb) {
              transposeBufferWrDbufSel := ~transposeBufferWrDbufSel
            }
          }
        }.elsewhen(isRowMemRdAddrTail) {
          transposeBufferWrFbufSel.clear()
          rowTransBuffWrCtrl := B(chain_len bits, 0 -> true, default -> false)
          // only flip WrDbufSel once, check both valid delayed and wr ctrl
          // to make sure only flip WrDbufSel once when the last Wr runs chain_len times and
          // meets a RowMemRdAddrTail in fancy
          when(rowMemRdValidDelayed4TrBufWr.fall() && ~rowTransBuffWrCtrl.lsb) {
            transposeBufferWrDbufSel := ~transposeBufferWrDbufSel
          }
        }
      } else {
        transposeBufferWrAddr := transposeBufferWrDbufSel
        when(rowMemRdValidDelayed4TrBufWr) {
          rowTransBuffWrCtrl := rowTransBuffWrCtrl.rotateLeft(1)
          when(rowTransBuffWrCtrl.msb) {
            transposeBufferWrDbufSel := ~transposeBufferWrDbufSel
          }
        }.elsewhen(isRowMemRdAddrTail) {
          when(rowMemRdValidDelayed4TrBufWr.fall()) {
            transposeBufferWrDbufSel := ~transposeBufferWrDbufSel
          }
          rowTransBuffWrCtrl := B(chain_len bits, 0 -> true, default -> false)
        }
      }

      switch(transposeBufferOccuCtrl) {
        is (B"2'b10") {
          when(transposeBufferOccu > 0) {transposeBufferOccu := transposeBufferOccu - 1}
        }
        is (B"2'b01") {
          when(transposeBufferOccu < 2){transposeBufferOccu := transposeBufferOccu + 1}
        }
      }

      // transpose buffer read: once fired run a full iteration
      when(isTransRamRdValid) {
        when(rowTransBuffRdAddr.willOverflow) {
          isTransRamRdValid := matBLoadPipelineEnDelayed & Delay(transposeBufferOccu > 0, 1)
        }
      }.otherwise {
        isTransRamRdValid := matBLoadPipelineEnDelayed & Delay(transposeBufferOccu > 0, 1)
      }
      when(isTransRamRdValid) {
        rowTransBuffRdAddr.increment()
      }
      when(Delay(matBEn4BubbleIns, MATB_EN_DELAY + 1, init=False)) {
        rowTransBuffFakeRdCtr.increment()
      }
      // TODO: magic number here. why 2 cycles delay?
      when(Delay(rowTransBuffRdAddr.willOverflow | rowTransBuffFakeRdCtr.willOverflow, 2)) {
        tccInnerBuffSelComp(r) := ~tccInnerBuffSelComp(r)
      }

      for (clenId <- 0 until chain_len) {
        transposeBuffer(clenId).io.dataIn := Delay(rowBuffParaRd, ROWMEM2TRANSRAM_DELAY)
        transposeBuffer(clenId).io.wrEn := Delay(rowTransBuffWrCtrl(clenId), ROWMEM2TRANSRAM_DELAY) &
            Delay(rowMemRdValidDelayed4TrBufWr, ROWMEM2TRANSRAM_DELAY)
        transposeBuffer(clenId).io.wrAddr := Delay(transposeBufferWrAddr, ROWMEM2TRANSRAM_DELAY)
        transposeBuffer(clenId).io.rdEn := isTransRamRdValid
        rowBufferBlkOut.payload(r)(clenId).blkData := transposeBuffer(chain_len-1 - clenId).io.dataOut
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

  // pre-delay the row-input for cascade chain timing alignment
  val chainTimeCorrectedDataIn = Vec(Vec(UInt(80 bits), chain_len), array_row)
  val chainTimeCorrectedExpIn = Vec(Vec(UInt(8 bits), chain_len), array_row)
  for (r <- 0 until array_row) {
    for (tcId <- 0 until chain_len) {
      chainTimeCorrectedDataIn(r)(tcId) :=
        BlockDelay(bufferArea.rowBufferBlkOut.payload(r)(tcId).blkData(79 downto 0), 2*tcId, "M20K")
      chainTimeCorrectedExpIn(r)(tcId) :=
        BlockDelay(bufferArea.rowBufferBlkOut.payload(r)(tcId).blkData(87 downto 80), 2*tcId, "M20K")
    }
  }

  for (c <- 0 until array_col) {
    val delayedLoadCascadeIn = Delay(bufferArea.casLoadBubbleInsert(c).io.datWithBubble.payload.blkData(79 downto 0),
      COL_BB_INSERT2TCC_DELAY + CASIN_DATIN_DELAY_DELTA)
    val delayedExpCascadeIn = Delay(bufferArea.casLoadBubbleInsert(c).io.datWithBubble.payload.blkData(87 downto 80),
      COL_BB_INSERT2TCC_DELAY + CASIN_DATIN_DELAY_DELTA)
    val delayedRowIdx = Delay(bufferArea.casLoadBubbleInsert(c).io.datWithBubble.payload.rIdx,
      COL_BB_INSERT2TCC_DELAY + CASIN_DATIN_DELAY_DELTA)
    val delayedCasInValid = Delay(bufferArea.casLoadBubbleInsert(c).io.datWithBubble.valid,
      COL_BB_INSERT2TCC_DELAY + CASIN_DATIN_DELAY_DELTA, init=False)

    for (r <- 0 until array_row) {
      tensorArray(r)(c).io.dataIn.valid :=
        Delay(bufferArea.rowBufferBlkOut.valid, TRANS2TCC_DELAY, init=False) | matBEn4BubbleInsDelayed
      // row-wise broadcasting
      for (tcId <- 0 until chain_len) {
        tensorArray(r)(c).io.dataIn.payload(tcId) := Delay(chainTimeCorrectedDataIn(r)(tcId), TRANS2TCC_DELAY)
        tensorArray(r)(c).io.expIn(tcId) := Delay(chainTimeCorrectedExpIn(r)(tcId), TRANS2TCC_DELAY)
      }

      // reconstruct load cascade input
      val delayedCasInWithIdx = BfpBlockWithIdx(80, idx_width.r, 0, 0).fromUInt(delayedRowIdx @@ delayedLoadCascadeIn)
      tensorArray(r)(c).io.loadCascadeIn.payload := delayedCasInWithIdx
      tensorArray(r)(c).io.expCascadeIn := delayedExpCascadeIn
      tensorArray(r)(c).io.loadCascadeIn.valid := delayedCasInValid
      // tensor core input iters: number of iterations to take matB sub columns
      //   it is the number of B columns for a tensor core chain row.
      //   it equals to the chain_loading_latency when the Dot Product
      //   hides the matA loading latency just fine.
      tensorArray(r)(c).io.matABroadcastIters := U(NUM_MATB_VEC_PER_ROW, 16 bits)
      tensorArray(r)(c).io.doubleBufferLoadSel :=
        Delay(tccInnerBufSelLoad(c) ## (~tccInnerBufSelLoad(c)), COLBUF2TCC_TOTAL_DELAY + 1 + CASIN_DATIN_DELAY_DELTA)
      tensorArray(r)(c).io.doubleBufferCompSel := Delay(tccInnerBuffSelComp(r), TRANS2TCC_DELAY + 2)
    }
  }

  // compute control path
  //row buffer ctrl
  val rowCtrlFsm = new StateMachine {
    val matBDataFeedCounter = Counter(NUM_MATB_VEC_PER_ROW)
    val isCurrSubvecMatmulFin = Reg(Bool(), init=False)
    val isFakeComputeIter = Reg(Bool(), init=False)
    // default
    io.matBLoad.foreach(_.ready := False)
    matBLoadPipelineEn := False
    matBEn4BubbleIns := False

    val sIdle: State = new State with EntryPoint {
      whenIsActive {
        matBDataFeedCounter.clear()
        isCurrSubvecMatmulFin := False
        io.matBLoad.foreach(_.ready := True)
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
          when(bufferArea.isColBufferEmpty) {
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
        when(bufferArea.isCurrSubgrpALoaded) {
          isCurrSubvecMatmulFin := False
          isFakeComputeIter := bufferArea.isLastLoadVecEmpty
          when(bufferArea.isColBufferEmpty) {
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
    val colBufferNotEmpty = bufferArea.colBuffer.last.io.almostFull
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
        when(isCalStartRecv && colIdxFifoNotEmptyDelay && colBufferNotEmpty) {
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
        bufferArea.isCurrSubgrpALoaded := bufferArea.isCurrCasBufLoaded.andR
        // check if finishing one mat A subvector load
        when(bufferArea.isColBufferEmpty) {
          isCalStartRecv := False
          goto(sIdle)
        }.otherwise {
          when(bufferArea.isCurrCasBufLoaded.andR) {
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
          when(bufferArea.isColBufferEmpty) {
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
  val outputBufferSelOut = Array.fill(array_row, array_col, 3)(UInt(output_width bits))
  val outputRidx = Array.fill(array_col)(UInt(idx_width.r bits))
  val outBfpConv = Array.fill(array_col, 3)(new FixedBfp12Converter(OUT_BLK_SIZE))

  for (c <- 0 until array_col) {
    outputRidx(c) :=
      BlockDelay(tensorArray.last(c).io.res.payload(0).rIdx, inout_pipe_delay + outBfpConv(0)(0).CONV_DELAY, "MLAB")
    for (r <- 0 until array_row) {
      tensorArray(r)(c).io.dataInLast :=
        Delay(bufferArea.isLastSubVecMultIter(c), ROWMEM2TCC_TOTAL_DELAY + 1) | matBEn4BubbleInsDelayed
    }
  }

  for (c <- 0 until array_col) {
    for (b <- 0 until 3) {
      for (r <- 0 until array_row) {
        outputBufferSelOut(r)(c)(b) := Delay(tensorArray(r)(c).io.res.payload(b).blkData, inout_pipe_delay)
      }

      val colOutGrp = Stream(Vec(UInt(output_width bits), array_row))
      colOutGrp.setName("colOutGrp_" + c + "_" + b)
      colOutGrp.valid :=
        Delay(tensorArray.last(c).io.res.valid & tensorArray.last(c).io.dataOutLast, inout_pipe_delay, init=False)
      colOutGrp.payload := Vec(for (r <- 0 until array_row) yield outputBufferSelOut(r)(c)(b))
      val outConvedDat = StreamWidthConv(colOutGrp, OUT_BLK_SIZE)
      outConvedDat.setName("outConvedDat_" + c + "_" + b)
      outBfpConv(c)(b).io.dataIn << outConvedDat.toFlow
    }
  }
  // TODO: fix 88 bit width conversion
  val outBuffer = Array.fill(n_out_chans)(
    new StreamOutAsymFifo(
      input_width = (outBfpConv(0)(0).io.dataOut.payload.getBitsWidth + idx_width.r) * 3 * array_col / n_out_chans,
      output_width = (outBfpConv(0)(0).io.dataOut.payload.getBitsWidth + idx_width.r) * n_words_outchan,
      depth=output_fifo_depth
    )
  )
  for (regIdx <- 0 until n_out_chans) {
    outBuffer(regIdx).io.push.valid := outBfpConv(regIdx * array_col / n_out_chans)(0).io.dataOut.valid
    outBuffer(regIdx).io.push.payload := Vec(
      for {
        i <- regIdx * array_col / n_out_chans until (regIdx + 1) * array_col / n_out_chans;
        j <- 0 until 3
      } yield outputRidx(i) @@ outBfpConv(i)(j).io.dataOut.payload
    ).asBits.asUInt
    
    io.res(regIdx) << outBuffer(regIdx).io.pop.translateWith(outBuffer(regIdx).io.pop.payload.resize(256 bits))
  }

  // perf and debug counters
  val perfCounter = Counter(16 bits)
  val perfCounterRun = Reg(Bool(), init=False)
  when(perfCounterRun) {
    perfCounter.increment()
    when(rowCtrlFsm.isActive(rowCtrlFsm.sCompFin)) {
      perfCounterRun := False
    }
  }.otherwise {
    when(colCtrlFsm.isActive(colCtrlFsm.sWaitIdx)) {
      perfCounter.clear()
      perfCounterRun := True
    }
  }
  io.latCounter := perfCounter.value

  if(debug_en) {
    val loadCounter = Counter(3 * chain_len, inc = tensorArray(0)(0).io.loadCascadeIn.valid)
      .setName("debug_loadcounter")
      .dontSimplifyIt()
      .init(U(0))
    val inCounter = Counter(NUM_MATB_VEC_PER_ROW, inc = tensorArray(0)(0).io.dataIn.valid)
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
    val outPshCounter = Counter(65536, inc = outBfpConv(0)(0).io.dataOut.valid)
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
    array_row = 6,
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
