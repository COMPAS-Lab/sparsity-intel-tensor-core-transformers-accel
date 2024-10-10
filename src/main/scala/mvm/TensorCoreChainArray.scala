package mvm

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import config._
import intel_ips._
import util._
import scala.math.{min, pow, ceil}

case class BfpBlockWithIdx(dwidth: Int,
                           ridx_width: Int,
                           cidx_width: Int,
                           dest_id_width: Int,
                           idx_placeholder: BigInt = 0) extends Bundle {
  val blkData = UInt(dwidth bits)
  val rIdx = (ridx_width > 0) generate UInt(ridx_width bits)
  val cIdx = (cidx_width > 0) generate UInt(cidx_width bits)
  val destId = (dest_id_width > 0) generate Bits(dest_id_width bits)

  assert(
    assertion = ((ridx_width + cidx_width) > 0 && idx_placeholder != 0) ||
                  ((ridx_width + cidx_width) == 0),
    message = "BfpBlockWithIdx contains idx but idx placeholder is not set"
  )

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
    if (ridx_width > 0) {this.rIdx := U(idx_placeholder)}
    if (cidx_width > 0) {this.cIdx := U(idx_placeholder)}
    if (dest_id_width > 0) {this.destId.clearAll()}
    this.blkData.clearAll()
  }

  override def getZero: this.type = {
    val zeroData = new BfpBlockWithIdx(dwidth, ridx_width, cidx_width, dest_id_width, idx_placeholder)
    zeroData.blkData.clearAll()
    if(ridx_width > 0) {zeroData.rIdx.clearAll()}
    if(cidx_width > 0) {zeroData.cIdx.clearAll()}
    if(dest_id_width > 0) {zeroData.destId.clearAll()}
    zeroData.asInstanceOf[this.type]
  }

  def asUInt: UInt = {
    val res = UInt(dwidth + ridx_width + cidx_width + dest_id_width bits)
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
}

class CasLoadBubbleInsert(idx_width: Int, idx_placeholder: BigInt) extends Component {
  val io = new Bundle {
    val casLoadBufIn = slave Stream(BfpBlockWithIdx(88, idx_width, 0, 0, idx_placeholder))
    val datWithBubble = master Flow(BfpBlockWithIdx(88, idx_width, 0, 0, idx_placeholder))
    val casLoadEn = in Bool()
    val colSel = in Bool()
  }

  val outReg = Reg(BfpBlockWithIdx(88, idx_width, 0, 0, idx_placeholder))
  outReg.blkData.init(0)
  outReg.rIdx.init(U(idx_placeholder))

  io.casLoadBufIn.ready := False
  when(io.casLoadEn) {
    io.datWithBubble.valid := Delay(io.casLoadBufIn.fire, 1)
    when(io.colSel) {
      io.casLoadBufIn.ready := True
      outReg := io.casLoadBufIn.payload
    }.otherwise {
      outReg.fromUInt(io.casLoadBufIn.payload.rIdx @@ U(0, outReg.blkData.getWidth bits))
    }
  }.otherwise {
    io.datWithBubble.valid := False
    outReg.setDefault()
  }

  io.datWithBubble.payload := outReg
}

class TensorCoreChainArray(array_col: Int, array_row: Int, chain_len: Int, idx_width: Int,
                           col_buffer_depth: Int, row_buffer_depth: Int,
                           out_buf_delay: Int, //should be (matBCols / array_row).ceil.toInt - 3
                           output_fifo_depth: Int, output_width: Int,
                           idx_placeholder: BigInt, inout_pipe_delay: Int = 5,
                           num_matb_cols: Int = 128) extends Component {
  val io = new Bundle {
    val matALoad = Vec(slave Stream (BfpBlockWithIdx(88, idx_width, 0, 0, idx_placeholder)), array_col)
    val matBLoad = Vec(slave Stream(UInt(88 bits)), array_row)
    val sortedColIdx = slave Stream(IndexData(idx_width, array_col))
    // colIdxFifoNotEmpty is asserted when colIdxFifo has at least
    // half of the loading
    val calEn, colIdxFifoNotEmpty  = in Bool()
    val res = Vec(master Stream (UInt((output_width + idx_width) * 3 bits)), array_row)
    // config ports
    val tccRowBufferId = in UInt(log2Up(num_matb_cols) bits)
  }
  //parameters
  val IDXDATA_IDX_WIDTH: Int = io.sortedColIdx.payload.idxData.getWidth
  val IDXDATA_DEST_WIDTH: Int = io.sortedColIdx.payload.destId.getWidth
  val NUM_MATB_VEC_PER_ROW: Int = ceil(num_matb_cols.toFloat / array_row.toFloat).toInt
  val TRANSRAM_FOLDING_FACTOR: Int = 2
  // TODO: fix parameters here
  val MAT_B_FETCH_II = chain_len + 1

  //adding pipes to the ctrl signals
  val calEnDelay = Delay(io.calEn, 3)
  val colIdxFifoNotEmptyDelay = Delay(io.colIdxFifoNotEmpty, 3)

  val tensorArray = Array.ofDim[TensorCoreChainBf12](array_row, array_col)
  for (r <- 0 until array_row; c <- 0 until array_col) {
    // out buf delay = number of B columns in each tensor core chain row - 3
    tensorArray(r)(c) = new TensorCoreChainBf12(
      chain_len,
      out_buf_delay = out_buf_delay,
      output_width = output_width,
      idx_width = idx_width,
      idx_placeholder = idx_placeholder
    )
    tensorArray(r)(c).setName("u_tc_core_r_" + r + "_c_" + c)
  }

  //signals between datapath and ctrl logic
  // start signal for mat a loading
  val cascadeLoadStart = Bool()
  val cascadeLoadEnLocal = Reg(Bits(array_col bits), init=B(0))
  //  tensor core chain inner double buffer switch signal
  val switchArowLoadBuff = Bool()
  val tccInnerBufSelLoad = Reg(Bits(array_col bits), init=B(0))
  val tccInnerBuffSelComp = Bits(array_col bits)
  // used to halt mat b broadcast when waiting for the mat a load
  val matBLoadPipelineEn = Bool()
  val matBLoadPipelineEnDelayed = Delay(matBLoadPipelineEn, 5)

  //input buffers
  val bufferArea = new Area {
    // buffer and ctrl signal def
    // colBuffer data format: BfpBlockWithIdx(88, idx_width, 0, 0, idx_placeholder)
    val colBuffer = Array.fill(array_col)(new StreamOutFifo(88 + idx_width, col_buffer_depth, "M20K"))
    val rowMem = Array.fill(array_row, NUM_MATB_VEC_PER_ROW / TRANSRAM_FOLDING_FACTOR)(
      Mem(UInt(88 bits), row_buffer_depth * TRANSRAM_FOLDING_FACTOR))
    val isCurrSubgrpALoaded = Reg(Bool(), init=False)
    val isColBufferEmpty = Vec(for(c <- colBuffer) yield c.io.pop.valid).orR

    // row buffer write and read
    val rowBufferWriteAddr = Array.fill(array_row)(Counter(row_buffer_depth * TRANSRAM_FOLDING_FACTOR))
    val rowBufferBlkOut = Flow(Vec(Vec(BfpBlockWithIdx(88, 0, 0, 0), chain_len), array_row))
    val rowBufferFetchFifo = new StreamOutFifo(idx_width, chain_len * 2, "M20K")

    // col buffer bubble insertion
    val casLoadBubbleInsert = Array.fill(array_col)(new CasLoadBubbleInsert(idx_width, idx_placeholder))

    val isVecALast = Vec(for(c <- casLoadBubbleInsert) yield c.io.datWithBubble.payload.rIdx === U(idx_placeholder))
    val isLastSubVecMultIter = Reg(Bits(array_col bits), init=B(0).resized)
    val isCurrCasBufLoaded = Bits(array_col bits)

    //col cascade loading data and ctrl
    io.sortedColIdx.ready := cascadeLoadEnLocal(0)
    for (c <- 0 until array_col) {
      val cascadeLoadCounter = Counter(chain_len+1)
      val aRowBuffLoad3colFactor = Counter(3)

      isCurrCasBufLoaded(c) :=
        (~colBuffer(c).io.pop.valid) | isVecALast(c) | (cascadeLoadCounter === U(chain_len))

      when(cascadeLoadEnLocal(c)) {
        when(isCurrCasBufLoaded(c)) {
          when(cascadeLoadStart && colBuffer(c).io.pop.valid) {
            cascadeLoadCounter.clear()
            isLastSubVecMultIter(c) := isVecALast(c)
            cascadeLoadEnLocal(c) := True
          }.otherwise {
            cascadeLoadEnLocal(c) := False
          }
        }.otherwise {
          aRowBuffLoad3colFactor.increment()
          when(aRowBuffLoad3colFactor.willOverflow) {
            cascadeLoadCounter.increment()
          }
        }
      }.otherwise {
        // don't reset/set cascadeLoadCounter/lastCasloadAmt as the
        // row controller needs to check isCurrCasBufLoaded to know
        // if safe to start next iter
        when(cascadeLoadStart && colBuffer(c).io.pop.valid) {
          cascadeLoadCounter.clear()
          isLastSubVecMultIter(c) := isVecALast(c)
          cascadeLoadEnLocal(c) := True
        }
      }

      casLoadBubbleInsert(c).io.casLoadBufIn <<
        colBuffer(c).io.pop.map(x => BfpBlockWithIdx(88, idx_width, 0, 0, idx_placeholder).fromUInt(x))
      casLoadBubbleInsert(c).io.casLoadEn := cascadeLoadEnLocal(c)
      casLoadBubbleInsert(c).io.colSel := Delay(io.sortedColIdx.payload.destId(c), 2)

      colBuffer(c).io.push << io.matALoad(c).map(x => x.asUInt)
    }

    // row broadcast data and ctrl
    rowBufferBlkOut.valid := Delay(matBLoadPipelineEnDelayed, MAT_B_FETCH_II)
    rowBufferFetchFifo.io.push.payload := io.sortedColIdx.payload.idxData
    rowBufferFetchFifo.io.push.valid := io.sortedColIdx.valid
    rowBufferFetchFifo.io.pop.ready := matBLoadPipelineEnDelayed
    for (r <- 0 until array_row) {
      val rowBuffParaRd = Vec(UInt(88 bits), NUM_MATB_VEC_PER_ROW / TRANSRAM_FOLDING_FACTOR)
      val rowBuffWrCtrl =
        Reg(Bits(chain_len bits), init=B(chain_len bits, 0 -> true, default -> false))
      val rowTransBuffRdAddr = Counter(NUM_MATB_VEC_PER_ROW * 2)
      val transposeBufferWrAddr = Counter(2 * TRANSRAM_FOLDING_FACTOR)
      val transposeBuffer = Array.fill(chain_len)(
        AsymBufferN2One(
          bitwidth = 88,
          num_in_words = NUM_MATB_VEC_PER_ROW / TRANSRAM_FOLDING_FACTOR,
          wr_depth = 2 * TRANSRAM_FOLDING_FACTOR,
          folding_factor = TRANSRAM_FOLDING_FACTOR,
          megfunc_type = "spram"
        )
      )

      // global write buffer signal
      when(io.matBLoad(r).fire) {
        rowBufferWriteAddr(r).increment()
      }
      for (vecId <- 0 until NUM_MATB_VEC_PER_ROW / TRANSRAM_FOLDING_FACTOR) {
        // row buffer write logic
        rowMem(r)(vecId).write(
          address = rowBufferWriteAddr(r),
          enable =
            io.tccRowBufferId.resize(log2Up(NUM_MATB_VEC_PER_ROW / TRANSRAM_FOLDING_FACTOR * array_row)) ===
              (r * NUM_MATB_VEC_PER_ROW / TRANSRAM_FOLDING_FACTOR + vecId),
          data = io.matBLoad(r).payload
        )

        // row buffer read logic

        rowBuffParaRd(vecId) := rowMem(r)(vecId).readSync(
          address = Delay(rowBufferFetchFifo.io.pop.payload, 2),
          enable = Delay(rowBufferFetchFifo.io.pop.fire, 2)
        )
      }

      when(matBLoadPipelineEnDelayed) {
        rowBuffWrCtrl := rowBuffWrCtrl.rotateLeft(1)
        transposeBufferWrAddr.increment()
        rowTransBuffRdAddr.increment()
      }

      for (transBufId <- transposeBuffer.indices) {
        transposeBuffer(transBufId).io.dataIn := rowBuffParaRd
        transposeBuffer(transBufId).io.wrEn := Delay(rowBuffWrCtrl(transBufId), 2)
        transposeBuffer(transBufId).io.wrAddr := Delay(transposeBufferWrAddr.value, 2)
        transposeBuffer(transBufId).io.rdAddr := Delay(rowTransBuffRdAddr.value, 2)
        transposeBuffer(transBufId).io.rdEn := True
      }

      for (clenId <- 0 until chain_len) {
        rowBufferBlkOut.payload(r)(clenId).blkData := transposeBuffer(clenId).io.dataOut
      }
    }
  }

  //TODO: fix skipper and rotator delay here
  val skipShuffDelay = 2 * log2Up(chain_len)
  val tcchainDatInValid = Delay(bufferArea.rowBufferBlkOut.valid, skipShuffDelay)
  // data connection from row/col buffer to the tensor core chains
//  val delayedRowBufferBlkOut = Vec(Vec(Vec(UInt(88 bits), array_col), chain_len), array_row)
//  for(r <- 0 until array_row; tcId <- 0 until chain_len) {
//    delayedRowBufferBlkOut(r)(tcId) := DelayTree(
//      bufferArea.rowBufferBlkOut.payload(r)(tcId).blkData, array_col)
//  }
  for (c <- 0 until array_col) {
    // TODO: add output checker here
//    val delayedLoadCascadeIn = DelayTree(
//      bufferArea.casLoadBubbleInsert(c).io.datWithBubble.payload.blkData(87 downto 8), array_row)
//    val delayedExpCascadeIn = DelayTree(
//      bufferArea.casLoadBubbleInsert(c).io.datWithBubble.payload.blkData(7 downto 0), array_row)
//    val delayedRowIdx = DelayTree(
//      bufferArea.casLoadBubbleInsert(c).io.datWithBubble.payload.rIdx, array_row)

    val delayedLoadCascadeIn =
      Delay(bufferArea.casLoadBubbleInsert(c).io.datWithBubble.payload.blkData(87 downto 8), 3)
    val delayedExpCascadeIn =
      Delay(bufferArea.casLoadBubbleInsert(c).io.datWithBubble.payload.blkData(7 downto 0), 3)
    val delayedRowIdx =
      Delay(bufferArea.casLoadBubbleInsert(c).io.datWithBubble.payload.rIdx, 2)

    when(switchArowLoadBuff) {
      tccInnerBufSelLoad(c) := ~tccInnerBufSelLoad(c)
    }
    tccInnerBuffSelComp(c) := ~tccInnerBufSelLoad(c)

    for (r <- 0 until array_row) {
      // TODO: this is a unused valid signal inside tcc,
      //  not sure how to use this
      tensorArray(r)(c).io.dataIn.valid := Delay(bufferArea.rowBufferBlkOut.valid, 4)
      // row-wise broadcasting
      for (tcId <- 0 until chain_len) {
//        tensorArray(r)(c).io.dataIn.payload(tcId) := delayedRowBufferBlkOut(r)(tcId)(c)(87 downto 8)
//        tensorArray(r)(c).io.expIn(tcId) := delayedRowBufferBlkOut(r)(tcId)(c)(7 downto 0)
        tensorArray(r)(c).io.dataIn.payload(tcId) :=
          Delay(bufferArea.rowBufferBlkOut.payload(r)(tcId).blkData(87 downto 8), 4)
        tensorArray(r)(c).io.expIn(tcId) :=
          Delay(bufferArea.rowBufferBlkOut.payload(r)(tcId).blkData(7 downto 0), 4)
      }

      // reconstruct load cascade input
      val delayedCasInWithIdx =
        BfpBlockWithIdx(80, idx_width, 0, 0, idx_placeholder).fromUInt(delayedRowIdx @@ delayedLoadCascadeIn)
      tensorArray(r)(c).io.loadCascadeIn.payload := delayedCasInWithIdx
      tensorArray(r)(c).io.expCascadeIn := delayedExpCascadeIn
      tensorArray(r)(c).io.loadCascadeIn.valid := bufferArea.casLoadBubbleInsert(c).io.datWithBubble.valid
      // tensor core input iters: number of iterations to take matB sub columns
      //   it is the number of B columns for a tensor core chain row.
      //   it equals to the chain_loading_latency when the Dot Product
      //   hides the matA loading latency just fine.
      tensorArray(r)(c).io.matABroadcastIters := U(NUM_MATB_VEC_PER_ROW, 16 bits)
      tensorArray(r)(c).io.doubleBufferLoadSel := Delay(tccInnerBufSelLoad(c) ## (~tccInnerBufSelLoad(c)), 2)
      tensorArray(r)(c).io.doubleBufferCompSel := Delay(tccInnerBuffSelComp(c), 2)
    }
  }

  // compute control path
  //row buffer ctrl
  val rowCtrlFsm = new StateMachine {
    val matBFetchCounter = Counter(chain_len)
    val matBDataFeedCounter = Counter(NUM_MATB_VEC_PER_ROW)
//    val tcchainDelayCounter = Counter(2*(chain_len-1)+4+3-1-1)
    val isCurrSubvecMatmulFin = Reg(Bool(), init=False)

    // default
    io.matBLoad.foreach(_.ready := False)
    matBLoadPipelineEn := False

    val sIdle: State = new State with EntryPoint {
      whenIsActive {
        matBFetchCounter.clear()
        matBDataFeedCounter.clear()
        matBLoadPipelineEn := False
        io.matBLoad.foreach(_.ready := True)
        bufferArea.rowBufferFetchFifo.io.pop.ready := False
        isCurrSubvecMatmulFin := False
        when(bufferArea.isCurrSubgrpALoaded) {goto(sPreload)}
      }
    }

    val sPreload: State = new State {
      whenIsActive {
        bufferArea.rowBufferFetchFifo.io.pop.ready := True
        matBLoadPipelineEn := True
        when(bufferArea.rowBufferFetchFifo.io.pop.fire) {matBFetchCounter.increment()}
        when(matBFetchCounter.willOverflow) {
          goto(sCompute)
        }
      }
    }

    val sCompute: State = new State {
      whenIsActive {
        matBLoadPipelineEn := True
        matBDataFeedCounter.increment()
        bufferArea.rowBufferFetchFifo.io.pop.ready := True
        when(bufferArea.rowBufferBlkOut.valid) {matBFetchCounter.increment()}
        isCurrSubvecMatmulFin := False
        // check data validity every mat B broadcast iteration
        when(matBDataFeedCounter.willOverflow) {
          isCurrSubvecMatmulFin := True
          matBDataFeedCounter.clear()
          when(tcchainDatInValid) {
            // if compute cannot be covered by next grps of mat a load
            // hold to wait for next mat A load grp
            when(~bufferArea.isCurrSubgrpALoaded) {
              goto(sWaitALoad)
              bufferArea.rowBufferFetchFifo.io.pop.ready := False
              matBLoadPipelineEn := False
            }
          }.otherwise{
            goto(sCompFin)
          }
        }
      }
    }

    val sWaitALoad: State = new State {
      whenIsActive {
        bufferArea.rowBufferFetchFifo.io.pop.ready := False
        matBLoadPipelineEn := False
        when(bufferArea.isCurrSubgrpALoaded) {
          isCurrSubvecMatmulFin := False
          goto(sCompute)
        }
      }
    }

    val sCompFin: State = new State {
      whenIsActive{
        // keep sending mat B data until the last subgroup
        // finishes
        bufferArea.rowBufferFetchFifo.io.pop.ready := False
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
    val currSubGrpALoadFin = Bool()
    val isCurrSubvecMatmulFin =
      rowCtrlFsm.isCurrSubvecMatmulFin | rowCtrlFsm.matBDataFeedCounter.willOverflow

    currSubGrpALoadFin := False
    cascadeLoadStart := False
    switchArowLoadBuff := False

    val sIdle: State = new State with EntryPoint {
      whenIsActive {
        bufferArea.isCurrSubgrpALoaded := False
        when(calEnDelay && colIdxFifoNotEmptyDelay) {goto(sWaitIdx)}
      }
    }

    val sWaitIdx: State = new State {
      //load first mat A row from col mem here
      whenIsActive {
        cascadeLoadStart := True
        when(bufferArea.isCurrCasBufLoaded.andR) {
          bufferArea.isCurrSubgrpALoaded := True
          when(io.sortedColIdx.valid) {
            switchArowLoadBuff := True
            goto(sLoadAVec)
          } .otherwise {
            goto(sIdle)
          }
          currSubGrpALoadFin := True
        }
      }
    }

    val sLoadAVec: State = new State {
      onEntry {
        bufferArea.isCurrSubgrpALoaded := False
        switchArowLoadBuff := False
      }
      whenIsActive {
        cascadeLoadStart := True
        bufferArea.isCurrSubgrpALoaded := False
        // check if finishing one mat A subvector load
        when(bufferArea.isCurrCasBufLoaded.andR) {
          bufferArea.isCurrSubgrpALoaded := True
          switchArowLoadBuff := True
          // check if need to wait computation
          when(isCurrSubvecMatmulFin) {
            // check if need to send more mat a rows
            when(bufferArea.isColBufferEmpty) {
              cascadeLoadStart := False
              goto(sIdle)
            }
          }.otherwise {
            cascadeLoadStart := False
            goto(sWaitComplete)
          }
        }
      }
    }

    val sWaitComplete: State = new State {
      whenIsActive {
        when(isCurrSubvecMatmulFin) {
          // check if need to send more mat A rows
          when(bufferArea.isColBufferEmpty) {
            cascadeLoadStart := False
            goto(sIdle)
          }
        }.otherwise {
          goto(sLoadAVec)
        }
      }
    }
  }

  //output control
  val isLastOutGrp = Reg(Bool(), init=False)
  val outBufferWrCounter = Counter(NUM_MATB_VEC_PER_ROW)
  val outBufferWr = Delay(isLastOutGrp, 2*(chain_len-1)+4+3-1-1)
  when(isLastOutGrp) {
    outBufferWrCounter.increment()
    when(outBufferWrCounter.willOverflow) {
      isLastOutGrp :=
        rowCtrlFsm.isCurrSubvecMatmulFin & bufferArea.isLastSubVecMultIter.andR
    }
  }.otherwise {
    isLastOutGrp :=
      rowCtrlFsm.isCurrSubvecMatmulFin & bufferArea.isLastSubVecMultIter.andR
  }

  //output buffer path
  val outputBufferSelOut =
    Vec(Vec(Flow(UInt((output_width + idx_width) * 3 bits)), array_col), array_row)

  for (r <- 0 until array_row; c <- 0 until array_col) {
    tensorArray(r)(c).io.dataInLast := isLastOutGrp
    outputBufferSelOut(r)(c).payload := Delay(tensorArray(r)(c).io.res.payload.asBits.asUInt, inout_pipe_delay)
    outputBufferSelOut(r)(c).valid := Delay(tensorArray(r)(c).io.res.valid & outBufferWr, inout_pipe_delay)
  }

  // TODO: verify function of shift regs
  val outBuffer = Array.fill(array_row)(
    new StreamOutAsymFifo(
      input_width = (output_width+idx_width) * 3 * array_col,
      output_width = (output_width+idx_width) * 3,
      depth=output_fifo_depth
    )
  )
  for (regIdx <- 0 until array_row) {
    outBuffer(regIdx).io.push.valid := outputBufferSelOut(regIdx)(0).valid
    outBuffer(regIdx).io.push.payload :=
      List.tabulate(array_col)(i => outputBufferSelOut(regIdx)(i).payload).reduce((a, b) => a @@ b)
    
    io.res(regIdx) << outBuffer(regIdx).io.pop
  }
}

object TensorCoreArrayGen extends App{
  val gen = new DefaultConfig
  gen.defaultSpinalConfig.generate(new TensorCoreChainArray(
    array_col = 12,
    array_row = 4,
    chain_len = 12,
    idx_width = 9,
    col_buffer_depth = 1024,
    row_buffer_depth = 512,
    out_buf_delay = 4,
    output_fifo_depth = 32,
    output_width = 24,
    idx_placeholder = BigInt("111111111", 2),
    inout_pipe_delay = 4
  )).printPruned()
}
