package mvm

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import config._
import intel_ips._
import util._
import scala.math.{min, pow}

case class TensorCoreChainArrayConfigPorts() extends Bundle {
  // matAColSubGrpLen: iterations to load the matrix A columns (or 3-row sub-blocks)
  // matAColSubGrpLen = matACols / (chain len x 10)
  val matAColSubGrpLen = UInt (16 bits)
  // matBColsPerTccRow: number of iterations to take matB sub columns
  //   it is the number of B columns computed by a tensor core chain row.
  //   matBColsPerTccRow = matBCols / array_row
  //   it equals to the chain_loading_latency when the Dot Product
  //   hides the matA loading latency just fine.
  // TODO: may make this a static parameter
  val matBColsPerTccRow = UInt (16 bits)
  // Tensor Core Chain row buffer counter boundary:
  //   calculated as Ceil(matBCols / array_row) * Ceil(matACols / (chain_len * 10.0))
  val tccRowBufferCnterRange = UInt (16 bits)
  // Tensor Core Chain col buffer counter boundary:
  //   each mat A blk has the size of 3 x matACols:
  //   matABlksInColBuf = ((matARows / 3.0).ceil / array_col).ceil.toInt
  //   the number of iters to read each blk of mat A
  //   matABlkCols = (matACols / 10.0).ceil.toInt
  //   total number of counter to read mat A:
  //   tccColBufferCnterRange = matABlksInColBuf * matABlkCols * 3
  val tccColBufferCnterRange = UInt (16 bits)
  val tccRowBufferId = UInt(log2Up(128) bits)
}

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
  val io = new Bundle {
    val inputSeq = in Vec(BfpBlockWithIdx(bitwidth, 0, 0, dest_width), num_ports)
    val outputSeq = Vec(master Flow(BfpBlockWithIdx(bitwidth, 0, 0, 0)), num_ports)
  }
  assert(num_ports >= 4)

  private def rmRedundancy(ports: Vec[Flow[BfpBlockWithIdx]], stg: Int): Vec[Flow[BfpBlockWithIdx]] = {
    val resPorts = Vec(RegFlow(BfpBlockWithIdx(bitwidth, 0, 0, 0)), ports.size)
    if (ports.size == 2) {
      switch(ports(0).valid ## ports(1).valid) {
        is (B"2'b00", B"2'b11", B"2'b10") {
          resPorts := ports
        }
        is (B"2'b01") {
          resPorts := Vec(ports(1), ports(0))
        }
      }
    } else {
      val halfMoverLower = rmRedundancy(Vec(for(i <- 0 until ports.size / 2) yield ports(i)), stg - 1)
      val halfMoverUpper = rmRedundancy(Vec(for(i <- ports.size/2 until ports.size) yield ports(i)), stg-1)

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
        val moveSelBuilder = WhenBuilder()
        for (nCand <- 0 to min(outPortIdx, ports.size/2)) {
          val selEntry = (~B(0, ports.size/2 bits) << U(nCand))(ports.size/2-1 downto 0)
          moveSelBuilder.when(moveSel === selEntry) {
            resPorts(outPortIdx) := srcPorts(outPortIdx - nCand)
          }
        }
        if (outPortIdx < ports.size/2) {
          moveSelBuilder.when(moveSel(outPortIdx downto 0) === B(0)) {
            resPorts(outPortIdx) := halfMoverLower(outPortIdx)
          }
        }
        moveSelBuilder.otherwise {
          resPorts(outPortIdx) << Flow(BfpBlockWithIdx(bitwidth, 0, 0, 0)).setIdle()
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

  val outFlows = rmRedundancy(inputFlows, log2Up(actual_insize))
  for (i <- 0 until num_ports) {
    io.outputSeq(i) << outFlows(i)
  }
}

class TensorCoreChainArray(array_col: Int, array_row: Int, chain_len: Int, idx_width: Int,
                           col_buffer_depth: Int, row_buffer_depth: Int,
                           out_buf_delay: Int, //should be (matBCols / array_row).ceil.toInt - 3
                           output_fifo_depth: Int, output_width: Int,
                           idx_placeholder: BigInt, inout_pipe_delay: Int = 5) extends Component {
  val io = new Bundle {
    val matALoad = Vec(slave Stream (BfpBlockWithIdx(88, idx_width, 0, 0)), array_col)
    val matBLoad = Vec(slave Stream(UInt(88 bits)), array_row)
    val sortedColIdx = slave Stream(IndexData(idx_width, array_col))
    val calEn = in Bool()
    val res = Vec(master Stream (UInt(output_width * 3 bits)), array_row)
    // config ports
    val configPorts =  in (TensorCoreChainArrayConfigPorts())
  }
  //parameters
  val idxdata_idx_width = io.sortedColIdx.payload.idxData.getWidth
  val idxdata_dest_width = io.sortedColIdx.payload.destId.getWidth
  val NUM_MATB_VEC_PER_ROW = 128 / array_row

  //adding pipes to the ctrl signals
  val calEnDelay = Delay(io.calEn, 6)
  val configDelay = Delay(io.configPorts, 6)

  val rowBufferRdCounter = Array.fill(array_row){
    DynaCounter(16, configDelay.tccRowBufferCnterRange + (chain_len-1) * 2)
  }
  val colBufferRdCounter = Array.fill(array_col){
    DynaCounter(16, configDelay.tccColBufferCnterRange)
  }

  val tensorLoadValid = Reg(Bits(array_col bits)) init 0
  val tensorDataValid = Reg(Bits(array_row bits)) init 0

  val tensorArray = Array.ofDim[TensorCoreChainBf12](array_row, array_col)
  for (r <- 0 until array_row; c <- 0 until array_col) {
    // out buf delay = number of B columns in each tensor core chain row - 3
    tensorArray(r)(c) = new TensorCoreChainBf12(chain_len, out_buf_delay = out_buf_delay,
                                              out_fifo_depth = output_fifo_depth, output_width = output_width)
    tensorArray(r)(c).setName("u_tc_core_r_" + r + "_c_" + c)
  }

  //input buffers
  val bufferArea = new Area {
    val colBuffer = Array.fill(array_col)(StreamFifo(BfpBlockWithIdx(88, idx_width, 0, 0), col_buffer_depth))
    val rowMem = Array.fill(array_row, NUM_MATB_VEC_PER_ROW)(Mem(UInt(88 bits), row_buffer_depth))

    io.sortedColIdx.ready := True
    //col buffer write and read
    for (c <- 0 until array_col) {
      colBuffer(c).io.push << io.matALoad(c)
      colBuffer(c).io.pop.ready := tensorLoadValid(c)
    }

    // row buffer write and read
    val rowBufferWriteAddr = Counter(row_buffer_depth)
    val rowBufferBlkOut = Vec(
      Vec(BfpBlockWithIdx(88, 0, 0, idxdata_dest_width), chain_len), array_row)
    for (r <- 0 until array_row) {
      val rowBuffParaRd = Vec(UInt(88 bits), NUM_MATB_VEC_PER_ROW)
      val rowBuffWrCtrl = Reg(Bits(chain_len bits), init=B(0))
      val rowBuffParaOut = Vec(UInt(88 bits), chain_len)
      val rowTransBuffRdAddr = Reg(UInt(log2Up(NUM_MATB_VEC_PER_ROW * 2) bits), init=U(0))
      val transposeBuffer = Array.fill(chain_len)(
        AsymBuffer(
          bitwidth = 88,
          num_in_words = NUM_MATB_VEC_PER_ROW,
          num_out_words = 1,
          wr_depth = 2)
      )
      io.matBLoad(r).ready := True

      val transposeBufferWrAddr = Reg(UInt(1 bits), init=U(0))

      for (vecId <- 0 until NUM_MATB_VEC_PER_ROW) {
        // row buffer write logic
        rowMem(r)(vecId).write(
          address = rowBufferWriteAddr,
          enable = io.configPorts.tccRowBufferId === (r * NUM_MATB_VEC_PER_ROW + vecId),
          data = io.matBLoad(r).payload
        )

        // row buffer read logic
        rowBuffParaRd(vecId) := rowMem(r)(vecId).readSync(
          address = io.sortedColIdx.payload.idxData,
          enable = io.sortedColIdx.fire
        )
      }

      when(io.sortedColIdx.fire) {
        rowBuffWrCtrl := rowBuffWrCtrl.rotateLeft(1)
        transposeBufferWrAddr := ~transposeBufferWrAddr
        rowTransBuffRdAddr := (rowTransBuffRdAddr + 1)(rowTransBuffRdAddr.getWidth-1 downto 0)
      }

      for (transBufId <- transposeBuffer.indices) {
        transposeBuffer(transBufId).io.dataIn := rowBuffParaRd
        transposeBuffer(transBufId).io.wrEn := rowBuffWrCtrl(transBufId)
        transposeBuffer(transBufId).io.wrAddr := transposeBufferWrAddr
        rowBuffParaOut(transBufId) := transposeBuffer(transBufId).io.dataOut.as(UInt(88 bits))
        transposeBuffer(transBufId).io.rdAddr := rowTransBuffRdAddr
      }

      // buffer read path
      val bufferedIdx = History(
         io.sortedColIdx.payload,
         length = chain_len + 1,
         when = io.sortedColIdx.fire,
         init = IndexData(idxdata_idx_width, idxdata_dest_width, idx_placeholder)
       )
      for (clenId <- 0 until chain_len) {
        rowBufferBlkOut(r)(clenId).blkData := transposeBuffer(clenId).io.dataOut.as(UInt(88 bits))
        rowBufferBlkOut(r)(clenId).destId := bufferedIdx(clenId).destId
      }
    }
  }

  // data connection from row/col buffer to the tensor core chains
  for (c <- 0 until array_col) {
    val delayedLoadCascadeIn = DelayTree(
      bufferArea.colBuffer(c).io.pop.payload.blkData(87 downto 8), log2Up(array_row))
    val delayedExpCascadeIn = DelayTree(
      bufferArea.colBuffer(c).io.pop.payload.blkData(7 downto 0), log2Up(array_row))
    val delayedRowIdx = DelayTree(
      bufferArea.colBuffer(c).io.pop.rIdx, log2Up(array_row))

    for (r <- 0 until array_row) {
      // dummy row data shuffle control logic
      val dataShuffleCtrlBits = RegFlow(UInt(log2Up(chain_len) bits))
      val numAccptBlks = Reg(UInt(log2Up(chain_len) bits), init=U(0))
      val dataShuffler = GeneralBarrelShifter(BfpBlockWithIdx(88, 0, 0, 0), chain_len)

      val skipper = new ColBlkGapRemover(
        num_ports = chain_len,
        bitwidth = 88,
        dest_width = idxdata_dest_width,
        tcchain_id = c)

      dataShuffler.io.shiftCtrl << dataShuffleCtrlBits
      for (tcId <- 0 until chain_len) {
        // datapath from row buffer out to skipper:
        skipper.io.inputSeq(tcId) <> bufferArea.rowBufferBlkOut(r)(tcId)

        // TODO: check timing of the delayed row address
        dataShuffler.io.dataIn(tcId) << skipper.io.outputSeq(tcId)

        tensorArray(r)(c).io.dataIn.payload(tcId) := dataShuffler.io.dataOut(tcId).payload.blkData(87 downto 8)
        tensorArray(r)(c).io.expIn(tcId) := dataShuffler.io.dataOut(tcId).payload.blkData(7 downto 0)
      }

      numAccptBlks := (numAccptBlks + CountOne(Vec(for (elem <- skipper.io.outputSeq) yield elem.valid)))(log2Up(chain_len)-1 downto 0)
      dataShuffleCtrlBits.valid := skipper.io.outputSeq(0).valid
      dataShuffleCtrlBits.payload := numAccptBlks
      tensorArray(r)(c).io.loadCascadeIn.payload := delayedLoadCascadeIn(r)
      tensorArray(r)(c).io.expCascadeIn := delayedExpCascadeIn(r)
      tensorArray(r)(c).io.loadCascadeIn.valid := Delay(tensorLoadValid(c), 1 + 2 + inout_pipe_delay)
      tensorArray(r)(c).io.dataIn.valid := Delay(tensorDataValid(r), 1 + 2 + inout_pipe_delay)
      // tensor core input iters: number of iterations to take matB sub columns
      //   it is the number of B columns for a tensor core chain row.
      //   it equals to the chain_loading_latency when the Dot Product
      //   hides the matA loading latency just fine.
      tensorArray(r)(c).io.matABroadcastIters := U(NUM_MATB_VEC_PER_ROW, 16 bits)
      tensorArray(r)(c).io.matAColSubGrpLen := configDelay.matAColSubGrpLen
    }
  }

  // compute control path
  //row buffer ctrl
  for (r <- 0 until array_row) {
    val rowCtrlFsm = new StateMachine {
      val loadRdy, dataInIterReady, resOutValid = Bool()
      loadRdy := tensorArray(r)(0).io.loadReady
      dataInIterReady := tensorArray(r)(0).io.dataIterReady
      resOutValid := tensorArray(r)(0).io.outValid
      val dataInFinish = Reg(Bool()) init False
      val computeIterCounter =
        DynaCounter(configDelay.matAColSubGrpLen.getWidth, configDelay.matAColSubGrpLen-1)
      val resValidCounter =
        DynaCounter(configDelay.matAColSubGrpLen.getWidth, configDelay.matAColSubGrpLen-1)

      loadRdy.setName("row_loadRdy_" + r)
      dataInIterReady.setName("row_dataInIterReady_" + r)
      resOutValid.setName("row_resOutValid_" + r)
      computeIterCounter.setName("row_computeIterCounter_" + r)
      resValidCounter.setName("row_resValidCounter_" + r)

      val sIdle: State = new State with EntryPoint {
        whenIsActive {
          rowBufferRdCounter(r).clear()
          computeIterCounter.clear()
          resValidCounter.clear()
          tensorDataValid(r) := False
          dataInFinish := False
          when(calEnDelay) {
            goto(sPreLoad)
          }
        }
      }

      val sPreLoad: State = new State {
        whenIsActive {
          when(loadRdy) {
            goto(sCompute)
          }
        }
      }

      val sCompute: State = new State {
        onEntry {
          tensorDataValid(r) := True
          rowBufferRdCounter(r).increment()
        }
        whenIsActive {
          when(dataInFinish === False) {
            rowBufferRdCounter(r).increment()
          } otherwise {
            rowBufferRdCounter(r).clear()
            tensorDataValid(r) := False
          }
          when(rowBufferRdCounter(r).willOverflow) {
            dataInFinish := True
          }
          when(dataInIterReady)(computeIterCounter.increment())
          when(Delay(computeIterCounter.willOverflow, 1)) {
            goto(sWriteRes)
          }
        }
      }

      val sWriteRes: State = new State {
        whenIsActive {
          when(resOutValid)(resValidCounter.increment())
          when(Delay(resValidCounter.willOverflow, 1)) {
            goto(sIdle)
          }
        }
      }
    }
  }
  //col buffer ctrl
  for (c <- 0 until array_col) {
    val colCtrlFsm = new StateMachine {
      val loadRdy, dataInIterReady, resOutValid = Bool()
      loadRdy := tensorArray(0)(c).io.loadReady
      dataInIterReady := tensorArray(0)(c).io.dataIterReady
      resOutValid := tensorArray(0)(c).io.outValid
      val loadFinish = Reg(Bool()) init False

      val loadIterCounter, computeIterCounter = {
        DynaCounter(configDelay.matAColSubGrpLen.getWidth, configDelay.matAColSubGrpLen-1)
      }
      val resValidCounter =
        DynaCounter(configDelay.matAColSubGrpLen.getWidth, configDelay.matAColSubGrpLen-1)

      loadRdy.setName("col_loadRdy_" + c)
      dataInIterReady.setName("col_dataInIterReady_" + c)
      resOutValid.setName("col_resOutValid_" + c)
      computeIterCounter.setName("col_computeIterCounter_" + c)
      loadIterCounter.setName("col_loadIterCounter_" + c)
      resValidCounter.setName("col_resValidCounter_" + c)

      val sIdle: State = new State with EntryPoint {
        whenIsActive {
          colBufferRdCounter(c).clear()
          computeIterCounter.clear()
          resValidCounter.clear()
          tensorLoadValid(c) := False
          loadFinish := False
          when(calEnDelay) {
            goto(sPreLoad)
          }
        }
      }

      val sPreLoad: State = new State {
        onEntry {
          colBufferRdCounter(c).increment()
          tensorLoadValid(c) := True
          loadIterCounter.clear()
        }
        whenIsActive {
          colBufferRdCounter(c).increment()
          when(loadRdy) {
            loadIterCounter.increment()
            goto(sCompute)
          }
        }
      }

      val sCompute: State = new State {
        whenIsActive {
          when(loadFinish === False) {
            colBufferRdCounter(c).increment()
          } otherwise {
            colBufferRdCounter(c).clear()
            tensorLoadValid(c) := False
          }
          when(colBufferRdCounter(c).willOverflow) {
            loadFinish := True
          }

          when(resOutValid)(resValidCounter.increment())
          when(loadRdy)(loadIterCounter.increment())
          when(dataInIterReady)(computeIterCounter.increment())
          when(Delay(computeIterCounter.willOverflow, 1)) {
            goto(sWriteRes)
          }
        }
      }

      val sWriteRes: State = new State {
        whenIsActive {
          when(resOutValid)(resValidCounter.increment())
          when(Delay(resValidCounter.willOverflow, 1)) {
            goto(sIdle)
          }
        }
      }
    }
  }

  //output buffer path
  val outputBufferSelOut =
    Vec(Vec(Flow(UInt(output_width * 3 bits)), array_col), array_row)

  for (r <- 0 until array_row; c <- 0 until array_col) {
    val tcChainId = r * array_col + c
    outputBufferSelOut(r)(c).payload := tensorArray(r)(c).io.res.payload.asBits.asUInt
    outputBufferSelOut(r)(c).valid := tensorArray(r)(c).io.res.valid
    tensorArray(r)(c).io.res.ready := True
  }

  // TODO: verify function of shift regs
  // val outShiftRegs = new Array[OutputShiftReg](array_row)
  // val outResDelayUnblocked = Vec(Flow (UInt(output_width * 3 bits)), array_row)
  // val outBuffer = new Array[StreamFifo[UInt]](array_row)
  val outBuffer = new Array[StreamOutAsymFifo](array_row)
  for (regIdx <- 0 until array_row) {
    // outShiftRegs(regIdx) = new OutputShiftReg(output_width * 3, array_col)
    
    // for (col <- 0 until array_col) {
      //temperarly break the back pressure from output shift register to
      // check timing
      // outShiftRegs(regIdx).io.resIn(col) << Delay(outputBufferSelOut(regIdx)(col), 4)
      // outShiftRegs(regIdx).io.resIn(col).valid := Delay(outputBufferSelOut(regIdx)(col).valid, 4)
      // outShiftRegs(regIdx).io.resIn(col).payload := Delay(outputBufferSelOut(regIdx)(col).payload, 4)
    // }

    // outResDelayUnblocked(regIdx) << outShiftRegs(regIdx).io.popOut
    // outBuffer(regIdx) = StreamFifo(UInt(outResDelayUnblocked(regIdx).payload.getWidth bits), 64)
    // outBuffer(regIdx).io.push.payload := Delay(outResDelayUnblocked(regIdx).payload, 4,
    //   init=outResDelayUnblocked(regIdx).payload.getZero)
    // outBuffer(regIdx).io.push.valid := Delay(outResDelayUnblocked(regIdx).valid, 4, init=False)

    outBuffer(regIdx) = new StreamOutAsymFifo(output_width * 3 * array_col, output_width * 3)
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
