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
                      dest_id_width: Int) extends Bundle {
  val blkData = UInt(dwidth bits)
  val rIdx = (ridx_width > 0) generate UInt(ridx_width bits)
  val cIdx = (cidx_width > 0) generate UInt(cidx_width bits)
  val destId = (dest_id_width > 0) generate Bits(dest_id_width bits)

  def fromUInt(src: UInt): Unit = {
    if (ridx_width > 0) {this.rIdx := src(src.getBitsWidth-1 downto src.getBitsWidth-ridx_width)}
    if (cidx_width > 0) {
      this.cIdx := src(src.getBitsWidth-ridx_width-1 downto src.getBitsWidth-ridx_width-cidx_width)
    }
    if (dest_id_width > 0) {
      this.cIdx := src(
        src.getBitsWidth-ridx_width-cidx_width-1 downto src.getBitsWidth-ridx_width-cidx_width-dest_id_width
      )
    }
    this.blkData := src(
      src.getBitsWidth-ridx_width-cidx_width-dest_id_width-1 downto 0
    )
  }

  override def getZero: this.type = {
    val zeroData = new BfpBlockWithIdx(dwidth, ridx_width, cidx_width, dest_id_width)
    zeroData.blkData.clearAll()
    if(ridx_width > 0) {zeroData.rIdx.clearAll()}
    if(cidx_width > 0) {zeroData.cIdx.clearAll()}
    if(dest_id_width > 0) {zeroData.destId.clearAll()}
    zeroData.asInstanceOf[this.type]
  }
}

class ColBlkGapRemover(num_ports: Int,
                    bitwidth: Int,
                    dest_width: Int,
                    tcchain_id: Int) extends Component {
  // gap remover translates the destination to the valid signal of the flow
  val io = new Bundle {
    val inputSeq = in Vec(BfpBlockWithIdx(bitwidth, 0, 0, dest_width), num_ports)
    val outputSeq = Vec(master Flow(BfpBlockWithIdx(bitwidth, 0, 0, 0)), num_ports)
    val en = in Bool()
  }
  assert(num_ports >= 4)

  private def rmRedundancy(ports: Vec[Flow[BfpBlockWithIdx]],
                           stg: Int,
                           shiftEn: Bool): Vec[Flow[BfpBlockWithIdx]] = {
    val resPorts = Vec(RegFlow(BfpBlockWithIdx(bitwidth, 0, 0, 0)), ports.size)
    if (ports.size == 2) {
      when(shiftEn) {
        switch(ports(0).valid ## ports(1).valid) {
          is(B"2'b00", B"2'b11", B"2'b10") {
            resPorts := ports
          }
          is(B"2'b01") {
            resPorts := Vec(ports(1), ports(0))
          }
        }
      }
    } else {
      val halfMoverLower = rmRedundancy(Vec(for(i <- 0 until ports.size / 2) yield ports(i)), stg - 1, shiftEn)
      val halfMoverUpper = rmRedundancy(Vec(for(i <- ports.size/2 until ports.size) yield ports(i)), stg-1, shiftEn)

      // selection candidates
      val srcPorts = Vec(Flow(BfpBlockWithIdx(bitwidth, 0, 0, 0)), ports.size)
      for (i <- 0 until ports.size/2) {
        srcPorts(i) << halfMoverUpper(i)
      }
      for (i <- ports.size/2 until ports.size) {
        srcPorts(i) << Flow(BfpBlockWithIdx(bitwidth, 0, 0, 0)).setIdle()
      }

      val moveSel = ~Vec(for (l <- halfMoverLower) yield l.valid).asBits
      for (outPortIdx <- resPorts.indices) {
        when(shiftEn) {
          val moveSelBuilder = WhenBuilder()
          for (nCand <- 0 to min(outPortIdx, ports.size / 2)) {
            val selEntry = (~B(0, ports.size / 2 bits) << U(nCand))(ports.size / 2 - 1 downto 0)
            moveSelBuilder.when(moveSel === selEntry) {
              resPorts(outPortIdx) := srcPorts(outPortIdx - nCand)
            }
          }
          if (outPortIdx < ports.size / 2) {
            moveSelBuilder.when(moveSel(outPortIdx downto 0) === B(0)) {
              resPorts(outPortIdx) := halfMoverLower(outPortIdx)
            }
          }
          moveSelBuilder.otherwise {
            resPorts(outPortIdx) << Flow(BfpBlockWithIdx(bitwidth, 0, 0, 0)).setIdle()
          }
        }
      }
    }
    resPorts
  }

  val actual_insize = pow(2, log2Up(num_ports)).toInt
  val inputFlows = Vec(Flow(BfpBlockWithIdx(bitwidth, 0, 0, 0)), actual_insize)

  for (i <- 0 until actual_insize) {
    if (i < num_ports) {
      inputFlows(i).payload.blkData := io.inputSeq(i).blkData
      inputFlows(i).valid := io.inputSeq(i).destId(tcchain_id) === True
    } else {
      inputFlows(i).setIdle()
    }
  }

  val outFlows = rmRedundancy(inputFlows, log2Up(actual_insize), io.en)
  for (i <- 0 until num_ports) {
    io.outputSeq(i) << outFlows(i)
  }
}

class TensorCoreChainArray(array_col: Int, array_row: Int, chain_len: Int, idx_width: Int,
                           col_buffer_depth: Int, row_buffer_depth: Int,
                           out_buf_delay: Int, //should be (matBCols / array_row).ceil.toInt - 3
                           output_fifo_depth: Int, output_width: Int,
                           idx_placeholder: BigInt, inout_pipe_delay: Int = 5,
                           num_matb_cols: Int = 128) extends Component {
  val io = new Bundle {
    val matALoad = Vec(slave Stream (BfpBlockWithIdx(88, idx_width, 0, 0)), array_col)
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
      idx_width = idx_width
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
  val matBLoadPipelineEnDelayed = Delay(matBLoadPipelineEn, 5, init=False)
  // reset for the mat b broadcast subvector cell finish flag
  val clearMatmulCellFinFlags = Bool()

  //input buffers
  val bufferArea = new Area {
    // buffer and ctrl signal def
    val colBuffer = Array.fill(array_col)(StreamFifo(BfpBlockWithIdx(88, idx_width, 0, 0), col_buffer_depth))
    val rowMem = Array.fill(array_row, NUM_MATB_VEC_PER_ROW / TRANSRAM_FOLDING_FACTOR)(
      Mem(UInt(88 bits), row_buffer_depth * TRANSRAM_FOLDING_FACTOR))
    val colBufferOutReg = Vec(Reg(BfpBlockWithIdx(88, idx_width, 0, 0)), array_col)
    val isCurrSubgrpALoaded = Reg(Bool(), init=False)
    val isColBufferEmpty = Vec(for(c <- colBuffer) yield c.io.pop.valid).orR

    // row buffer write and read
    val rowBufferWriteAddr = Array.fill(array_row)(Counter(row_buffer_depth * TRANSRAM_FOLDING_FACTOR))
    val rowBufferBlkOut = Flow(Vec(
      Vec(BfpBlockWithIdx(88, 0, 0, IDXDATA_DEST_WIDTH), chain_len), array_row))

    val isVecALast = Vec(for(cReg <- colBufferOutReg) yield cReg.rIdx === U(idx_placeholder))
    val isLastSubVecMultIter = Reg(Bits(array_col bits), init=B(0).resized)
    val isCurrCasBufLoaded = Bits(array_col bits)
    val isMatmulCellFinished =
      Vec(Reg(Bits(chain_len bits), init=B(0).resized), array_col)
    val isCurrSubvecMatmulFinished = Bits(array_col bits)

    //col cascade loading data and ctrl
    for (c <- 0 until array_col) {
      val cascadeLoadCounter = Counter(chain_len+1)
      //casLoadAmt: 0 -> current 1 -> last
      val lastCasLoadAmt = Reg(UInt(log2Up(chain_len+1) bits))
      val aRowBuffLoad3colFactor = Counter(3)

      isCurrSubvecMatmulFinished(c) := CountOne(isMatmulCellFinished(c)) === lastCasLoadAmt
      isCurrCasBufLoaded(c) :=
        (~colBuffer(c).io.pop.valid) | isVecALast(c) | (cascadeLoadCounter === U(chain_len))

      when(cascadeLoadEnLocal(c)) {
        when(isCurrCasBufLoaded(c)) {
          when(cascadeLoadStart && colBuffer(c).io.pop.valid) {
            cascadeLoadCounter.clear()
            lastCasLoadAmt := cascadeLoadCounter
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
          lastCasLoadAmt := cascadeLoadCounter
          isLastSubVecMultIter(c) := isVecALast(c)
          cascadeLoadEnLocal(c) := True
        }
      }

      colBufferOutReg(c).init(colBufferOutReg(c).getZero)
      when(cascadeLoadEnLocal(c)) {
        colBufferOutReg(c) := colBuffer(c).io.pop.payload
      }
      colBuffer(c).io.push << io.matALoad(c)
      colBuffer(c).io.pop.ready := cascadeLoadEnLocal(c)
    }

    // row broadcast data and ctrl
    rowBufferBlkOut.valid := Delay(matBLoadPipelineEnDelayed, MAT_B_FETCH_II)
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
          address = io.sortedColIdx.payload.idxData.resized,
          enable = matBLoadPipelineEnDelayed
        )
      }

      when(matBLoadPipelineEnDelayed) {
        rowBuffWrCtrl := rowBuffWrCtrl.rotateLeft(1)
        transposeBufferWrAddr.increment()
        rowTransBuffRdAddr.increment()
      }

      for (transBufId <- transposeBuffer.indices) {
        transposeBuffer(transBufId).io.dataIn := rowBuffParaRd
        transposeBuffer(transBufId).io.wrEn := Mux(matBLoadPipelineEnDelayed, rowBuffWrCtrl(transBufId), False)
        transposeBuffer(transBufId).io.wrAddr := transposeBufferWrAddr
        transposeBuffer(transBufId).io.rdAddr := rowTransBuffRdAddr
      }

      // buffer read path
      val bufferedIdx = History(
         io.sortedColIdx.payload,
         length = MAT_B_FETCH_II,
         when = matBLoadPipelineEnDelayed,
         init = IndexData(IDXDATA_IDX_WIDTH, IDXDATA_DEST_WIDTH, idx_placeholder)
      )
      for (clenId <- 0 until chain_len) {
        rowBufferBlkOut.payload(r)(clenId).blkData := transposeBuffer(clenId).io.dataOut
        rowBufferBlkOut.payload(r)(clenId).destId := bufferedIdx(clenId).destId
      }
    }
  }

  //TODO: fix skipper and rotator delay here
  val skipShuffDelay = 2 * log2Up(chain_len)
  val tcchainDatInValid = Delay(bufferArea.rowBufferBlkOut.valid, skipShuffDelay, init=False)
  // data connection from row/col buffer to the tensor core chains
  for (c <- 0 until array_col) {
    val delayedLoadCascadeIn = DelayTree(
      bufferArea.colBuffer(c).io.pop.payload.blkData(87 downto 8), log2Up(array_row))
    val delayedExpCascadeIn = DelayTree(
      bufferArea.colBuffer(c).io.pop.payload.blkData(7 downto 0), log2Up(array_row))
    val delayedRowIdx = DelayTree(
      bufferArea.colBuffer(c).io.pop.rIdx, log2Up(array_row))

    when(switchArowLoadBuff) {
      tccInnerBufSelLoad(c) := ~tccInnerBufSelLoad(c)
    }
    tccInnerBuffSelComp(c) := ~tccInnerBufSelLoad(c)

    for (r <- 0 until array_row) {
      // dummy row data shuffle control logic
      val dataShuffleCtrlBits = RegFlow(UInt(log2Up(chain_len) bits))
      val numAccptBlks = Reg(UInt(log2Up(chain_len) bits), init=U(0))
      val dataShufflerOutReg = Vec(Reg(BfpBlockWithIdx(88, 0, 0, 0)), chain_len)
      dataShufflerOutReg.foreach(_.init(BfpBlockWithIdx(88, 0, 0, 0).getZero))

      val distributor = ClosNet(chain_len, 88, array_col, c)

      if(r == 0) {
        for (cell <- 0 until chain_len) {
          when(clearMatmulCellFinFlags & bufferArea.isCurrSubvecMatmulFinished(c)) {
            bufferArea.isMatmulCellFinished(c)(cell) := False
          }.elsewhen(distributor.io.outputSeq(cell).valid) {
            bufferArea.isMatmulCellFinished(c)(cell) := True
          }
        }
      }
      distributor.io.en := matBLoadPipelineEnDelayed

      // TODO: this is a unused valid signal inside tcc,
      //  not sure how to use this
      tensorArray(r)(c).io.dataIn.valid := True
      for (tcId <- 0 until chain_len) {
        // datapath from row buffer out to skipper:
        distributor.io.inputSeq(tcId) <> bufferArea.rowBufferBlkOut.payload(r)(tcId)

        // TODO: check timing of the delayed row address
        when(distributor.io.outputSeq(tcId).valid & matBLoadPipelineEnDelayed) {
          dataShufflerOutReg(tcId) := distributor.io.outputSeq(tcId).payload
        } otherwise {
          dataShufflerOutReg(tcId).clearAll()
        }

        tensorArray(r)(c).io.dataIn.payload(tcId) := dataShufflerOutReg(tcId).blkData(87 downto 8)
        tensorArray(r)(c).io.expIn(tcId) := dataShufflerOutReg(tcId).blkData(7 downto 0)
      }

      // reconstruct load cascade input
      val delayedCasInWithIdx = BfpBlockWithIdx(80, idx_width, 0, 0)
      delayedCasInWithIdx.fromUInt((delayedRowIdx(r) ## delayedLoadCascadeIn(r)).asUInt)
      numAccptBlks := (numAccptBlks + CountOne(Vec(for (elem <- distributor.io.outputSeq) yield elem.valid))).resized
      dataShuffleCtrlBits.valid := distributor.io.outputSeq(0).valid
      dataShuffleCtrlBits.payload := numAccptBlks
      tensorArray(r)(c).io.loadCascadeIn.payload := delayedCasInWithIdx
      tensorArray(r)(c).io.expCascadeIn := delayedExpCascadeIn(r)
      tensorArray(r)(c).io.loadCascadeIn.valid := Delay(cascadeLoadEnLocal(c), 1 + 2 + inout_pipe_delay)
      // tensor core input iters: number of iterations to take matB sub columns
      //   it is the number of B columns for a tensor core chain row.
      //   it equals to the chain_loading_latency when the Dot Product
      //   hides the matA loading latency just fine.
      tensorArray(r)(c).io.matABroadcastIters := U(NUM_MATB_VEC_PER_ROW, 16 bits)
      tensorArray(r)(c).io.doubleBufferLoadSel := (tccInnerBufSelLoad(c) ## (~tccInnerBufSelLoad(c))).asBits
      tensorArray(r)(c).io.doubleBufferCompSel := tccInnerBuffSelComp(c)
    }
  }

  // compute control path
  //row buffer ctrl
  val rowCtrlFsm = new StateMachine {
    val matBFetchCounter = Counter(chain_len)
    val matBDataFeedCounter = Counter(NUM_MATB_VEC_PER_ROW)
//    val tcchainDelayCounter = Counter(2*(chain_len-1)+4+3-1-1)
    // default
    io.matBLoad.foreach(_.ready := False)
    io.sortedColIdx.ready := False
    matBLoadPipelineEn := False
    clearMatmulCellFinFlags := False

    val sIdle: State = new State with EntryPoint {
      whenIsActive {
        matBFetchCounter.clear()
        matBDataFeedCounter.clear()
        matBLoadPipelineEn := False
        io.matBLoad.foreach(_.ready := True)
        io.sortedColIdx.ready := False
        when(bufferArea.isCurrSubgrpALoaded) {goto(sPreload)}
      }
    }

    val sPreload: State = new State {
      whenIsActive {
        io.sortedColIdx.ready := True
        matBLoadPipelineEn := True
        when(io.sortedColIdx.fire) {matBFetchCounter.increment()}
        when(matBFetchCounter.willOverflow) {
          goto(sCompute)
        }
      }
    }

    val sCompute: State = new State {
      whenIsActive {
        matBLoadPipelineEn := True
        matBDataFeedCounter.increment()
        io.sortedColIdx.ready := True
        when(bufferArea.rowBufferBlkOut.valid) {matBFetchCounter.increment()}
        // check data validity every mat B broadcast iteration
        when(matBDataFeedCounter.willOverflow) {
          matBDataFeedCounter.clear()
          // if curr compute iter has finished tc chain
          when(bufferArea.isCurrSubvecMatmulFinished.orR) {
            // if there is still mat b to broadcast
            clearMatmulCellFinFlags := True
            when(tcchainDatInValid) {
              // if compute cannot be covered by next grps of mat a load
              // hold to wait for next mat A load grp
              when(~bufferArea.isCurrSubgrpALoaded) {
                goto(sWaitALoad)
                io.sortedColIdx.ready := False
                matBLoadPipelineEn := False
              }
            }.otherwise{
              goto(sCompFin)
            }
          }
        }
      }
    }

    val sWaitALoad: State = new State {
      whenIsActive {
        io.sortedColIdx.ready := False
        matBLoadPipelineEn := False
        when(bufferArea.isCurrSubgrpALoaded) {goto(sCompute)}
      }
    }

    val sCompFin: State = new State {
      whenIsActive{
         // keep sending mat B data until the last subgroup
         // finishes
         io.sortedColIdx.ready := False
         matBDataFeedCounter.increment()
         matBLoadPipelineEn := ~matBDataFeedCounter.willOverflow
         when(matBDataFeedCounter.willOverflow){
           goto(sIdle)
         }
      }
    }
  }

  //col buffer ctrl
  val colCtrlFsm = new StateMachine {
    val currSubGrpALoadFin = Bool()

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
        when(bufferArea.isVecALast.andR) {
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
          when(bufferArea.isCurrSubvecMatmulFinished.orR) {
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
        when(bufferArea.isCurrSubvecMatmulFinished.orR) {
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
  val outBufferWr = Delay(isLastOutGrp, 2*(chain_len-1)+4+3-1-1, init=False)
  when(isLastOutGrp) {
    outBufferWrCounter.increment()
    when(outBufferWrCounter.willOverflow) {
      isLastOutGrp :=
        bufferArea.isCurrSubvecMatmulFinished.andR & bufferArea.isLastSubVecMultIter.andR
    }
  }.otherwise {
    isLastOutGrp :=
      bufferArea.isCurrSubvecMatmulFinished.andR & bufferArea.isLastSubVecMultIter.andR
  }

  //output buffer path
  val outputBufferSelOut =
    Vec(Vec(Flow(UInt((output_width + idx_width) * 3 bits)), array_col), array_row)

  for (r <- 0 until array_row; c <- 0 until array_col) {
    tensorArray(r)(c).io.dataInLast := isLastOutGrp
    outputBufferSelOut(r)(c).payload := tensorArray(r)(c).io.res.payload.asBits.asUInt
    outputBufferSelOut(r)(c).valid := tensorArray(r)(c).io.res.valid & outBufferWr
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
    outBuffer(regIdx).io.push.valid := Delay(outputBufferSelOut(regIdx)(0).valid, inout_pipe_delay)
    outBuffer(regIdx).io.push.payload := 
      Delay(
        List.tabulate(array_col)(i => outputBufferSelOut(regIdx)(i).payload).reduce((a, b) => a @@ b),
        inout_pipe_delay
      )
    
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
