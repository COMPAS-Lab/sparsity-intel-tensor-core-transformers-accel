package mylib

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import config._
import intel_ips._
import util._

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
}

class TensorCoreChainRow(array_col: Int, array_row_id: Int, chain_len: Int,
                         out_buf_delay: Int, //should be (matBCols / array_row).ceil.toInt - 3
                         output_fifo_depth: Int, output_width: Int,
                         inout_pipe_delay: Int = 5) extends  Component {
  val io = new Bundle {
    val matBLoad = Vec(slave Stream (UInt(32 * 10 bits)), chain_len)
    val cascadeDataIn = in Vec(UInt(80 bits), array_col)
    val cascadeExpIn = in Vec(UInt(8 bits), array_col)
    val tensorLoadValid = in Vec(Bool(), array_col)
    val calEn = in Bool()
    val loadRdy, dataInIterReady, resOutValid = out Vec(Bool(), array_col)
    // config ports
    val configPorts = in(TensorCoreChainArrayConfigPorts())
    val res = Vec(master Flow (UInt(output_width * 3 bits)), array_col)
  }

  val rowMem = Array.fill(chain_len)(new in_buffer)
  val rowMemAddr = Array.ofDim[UInt](chain_len)
  val rowConverters = Array.ofDim[FixedBfpConverter](chain_len)
  val rowBufferRdCounter = DynaCounter(16, io.configPorts.tccRowBufferCnterRange + (chain_len - 1) * 2)
  val tensorRow = Array.ofDim[TensorCoreChainBf12](array_col)
  val tensorDataValid = Reg(Bool()) init False

  for (tcId <- 0 until chain_len) {
    val rowBufferWrCounter =
      DynaCounter(io.configPorts.tccColBufferCnterRange.getWidth, io.configPorts.tccRowBufferCnterRange)
    rowBufferWrCounter.setName("rowMemWrCounter_" + array_row_id + "_" + tcId)

    rowMem(tcId).setName("rowMem_" + array_row_id + "_" + tcId)
    rowConverters(tcId) = new FixedBfpConverter
    rowConverters(tcId).io.dataIn <> io.matBLoad(tcId).asFlow
    io.matBLoad(tcId).ready := True
    rowMem(tcId).io.wraddress :=
      rowBufferWrCounter.resize(rowMem(tcId).io.wraddress.getWidth)
    rowMem(tcId).io.data := rowConverters(tcId).io.dataOut.payload
    //TODO: utilize row buffer to delay the inputs according to its destination tensor core
    //   in each tensor core chain
    //TODO: check timing of delayed row address compute
    rowMemAddr(tcId) = Delay(rowBufferRdCounter - U(2 * tcId, rowBufferRdCounter.getWidth bits), 2)
    //TODO: fix row mem rd addr delay timing misalignment
    rowMem(tcId).io.rdaddress := rowMemAddr(tcId).resize(rowMem(tcId).io.rdaddress.getWidth)

    when(rowConverters(tcId).io.dataOut.fire) {
      rowBufferWrCounter.increment()
      rowMem(tcId).io.wren := True
    } otherwise {
      rowBufferWrCounter.clear()
      rowMem(tcId).io.wren := False
    }
  }

  for (c <- 0 until array_col) {
    tensorRow(c) = new TensorCoreChainBf12(chain_len, out_buf_delay = out_buf_delay,
      out_fifo_depth = output_fifo_depth, output_width = output_width)
    tensorRow(c).setName("u_tc_core_r_" + array_row_id + "_c_" + c)

    val rowMemOut: Vec[UInt] = Vec(UInt(8 * 11 bits), chain_len)
    for (cl <- 0 until chain_len) (rowMemOut(cl) := rowMem(cl).io.q)

    for (tcId <- 0 until chain_len) {
      // TODO: check timing of the delayed row address
      tensorRow(c).io.dataIn(tcId).valid :=
        (rowMemAddr(tcId) < io.configPorts.tccRowBufferCnterRange && rowMemAddr(tcId) >= 2 * tcId)
      tensorRow(c).io.dataIn(tcId).payload := Delay(rowMemOut(tcId)(87 downto 8), inout_pipe_delay, init = U"80'd0")
      tensorRow(c).io.expIn(tcId) := Delay(rowMemOut(tcId)(7 downto 0), inout_pipe_delay, init = U"8'd0")
    }

    tensorRow(c).io.loadCascadeIn := io.cascadeDataIn(c)
    tensorRow(c).io.expCascadeIn := io.cascadeExpIn(c)
    tensorRow(c).io.loadValid := Delay(io.tensorLoadValid(c), 1 + 2 + inout_pipe_delay, init = False)
    tensorRow(c).io.dataValid := Delay(tensorDataValid, 1 + 2 + inout_pipe_delay, init = False)
    // tensor core input iters: number of iterations to take matB sub columns
    //   it is the number of B columns for a tensor core chain row.
    //   it equals to the chain_loading_latency when the Dot Product
    //   hides the matA loading latency just fine.
    tensorRow(c).io.inputIters := io.configPorts.matBColsPerTccRow
    tensorRow(c).io.matAColSubGrpLen := io.configPorts.matAColSubGrpLen
    // output ports
    io.res(c).payload := tensorRow(c).io.res.payload.asBits.asUInt
    io.res(c).valid := tensorRow(c).io.res.valid
    tensorRow(c).io.res.ready := True
    io.loadRdy(c) := tensorRow(c).io.loadReady
    io.dataInIterReady(c) := tensorRow(c).io.dataIterReady
    io.resOutValid(c) := tensorRow(c).io.outValid
  }

  // compute control path
  //row buffer ctrl
  val rowCtrlFsm = new StateMachine {
    val loadRdy, dataInIterReady, resOutValid = Bool()
    loadRdy := tensorRow(0).io.loadReady
    dataInIterReady := tensorRow(0).io.dataIterReady
    resOutValid := tensorRow(0).io.outValid
    val dataInFinish = Reg(Bool()) init False
    val computeIterCounter =
      DynaCounter(io.configPorts.matAColSubGrpLen.getWidth, io.configPorts.matAColSubGrpLen - 1)
    val resValidCounter =
      DynaCounter(io.configPorts.matAColSubGrpLen.getWidth, io.configPorts.matAColSubGrpLen - 1)

    loadRdy.setName("row_loadRdy_" + array_row_id)
    dataInIterReady.setName("row_dataInIterReady_" + array_row_id)
    resOutValid.setName("row_resOutValid_" + array_row_id)
    computeIterCounter.setName("row_computeIterCounter_" + array_row_id)
    resValidCounter.setName("row_resValidCounter_" + array_row_id)

    val sIdle: State = new State with EntryPoint {
      whenIsActive {
        rowBufferRdCounter.clear()
        computeIterCounter.clear()
        resValidCounter.clear()
        tensorDataValid := False
        dataInFinish := False
        when(io.calEn) {
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
        tensorDataValid := True
        rowBufferRdCounter.increment()
      }
      whenIsActive {
        when(dataInFinish === False) {
          rowBufferRdCounter.increment()
        } otherwise {
          rowBufferRdCounter.clear()
          tensorDataValid := False
        }
        when(rowBufferRdCounter.willOverflow) {
          dataInFinish := True
        }
        when(dataInIterReady)(computeIterCounter.increment())
        when(Delay(computeIterCounter.willOverflow, 1, init = False)) {
          goto(sWriteRes)
        }
      }
    }

    val sWriteRes: State = new State {
      whenIsActive {
        when(resOutValid)(resValidCounter.increment())
        when(Delay(resValidCounter.willOverflow, 1, init = False)) {
          goto(sIdle)
        }
      }
    }
  }
}

class TensorCoreChainArray(array_col: Int, array_row: Int, chain_len: Int,
                           out_buf_delay: Int, //should be (matBCols / array_row).ceil.toInt - 3
                           col_buf_max_depth: Int, row_buf_max_depth: Int,
                           output_fifo_depth: Int, output_width: Int,
                           inout_pipe_delay: Int = 5) extends Component {
  val io = new Bundle {
    val matALoad = Vec(slave Stream (UInt(32 * 10 bits)), array_col)
    val matBLoad = Vec(Vec(slave Stream (UInt(32 * 10 bits)), chain_len), array_row)
    val calEn = in Bool()
    // config ports
    val configPorts =  in (TensorCoreChainArrayConfigPorts())
    val res = Vec(master Stream (UInt(output_width * 3 bits)), array_row)
  }

  //adding pipes to the ctrl signals
  val calEnDelay = Delay(io.calEn, 4, init=False)
  val configDelay = Delay(io.configPorts, 4, init=TensorCoreChainArrayConfigPorts().getZero)

  val colBufferRdCounter = Array.fill(array_col){
    DynaCounter(16, configDelay.tccColBufferCnterRange)
  }
  val tensorLoadValid = Reg(Bits(array_col bits)) init 0
  val tensorArray = Array.ofDim[TensorCoreChainRow](array_row)

  //input buffers
  val colMem = Array.fill(array_col)(new in_buffer)
  //bfp converters
  val colConverters = Array.fill(array_col)(new FixedBfpConverter())

  for (r <- 0 until array_row) {
    // out buf delay = number of B columns in each tensor core chain row - 3
    tensorArray(r) = new TensorCoreChainRow(array_col, r, chain_len,
      out_buf_delay, output_fifo_depth, output_width, inout_pipe_delay)
    tensorArray(r).io.configPorts <> configDelay
    tensorArray(r).io.calEn := calEnDelay
    tensorArray(r).io.matBLoad <> io.matBLoad(r)
    for (c <- 0 until array_col) {


    }
  }

  //buffer write and read
  for (c <- 0 until array_col) {
    val delayedLoadCascadeIn = DelayTree(colMem(c).io.q(87 downto 8), log2Up(array_row))
    val delayedExpCascadeIn = DelayTree(colMem(c).io.q(7 downto 0), log2Up(array_row))
    val delayedTensorLoadValid = DelayTree(tensorLoadValid(c).asUInt, log2Up(array_row))

    colConverters(c).io.dataIn <> io.matALoad(c).asFlow
    io.matALoad(c).ready := True
    val colBufferWrCounter = DynaCounter(16, configDelay.tccColBufferCnterRange)
    colMem(c).io.wraddress := colBufferWrCounter.resize(colMem(c).io.wraddress.getWidth)
    colMem(c).io.data := colConverters(c).io.dataOut.payload
    //TODO: fix col buffer rd addr delay timing misalignment
    colMem(c).io.rdaddress := Delay(colBufferRdCounter(c).resize(colMem(c).io.rdaddress.getWidth), 2)
    colMem(c).setName("colMem_" + c)

    when(colConverters(c).io.dataOut.fire) {
      colBufferWrCounter.increment()
      colMem(c).io.wren := True
    } otherwise {
      colBufferWrCounter.clear()
      colMem(c).io.wren := False
    }

    for (r <- 0 until array_row) {
      tensorArray(r).io.cascadeDataIn(c) := delayedLoadCascadeIn(r)
      tensorArray(r).io.cascadeExpIn(c) := delayedExpCascadeIn(r)
      tensorArray(r).io.tensorLoadValid(c) := delayedTensorLoadValid(r).asBool
    }
  }

  //col buffer ctrl
  for (c <- 0 until array_col) {
    val colCtrlFsm = new StateMachine {
      val loadRdy, dataInIterReady, resOutValid = Bool()
      loadRdy := tensorArray(0).io.loadRdy(c)
      dataInIterReady := tensorArray(0).io.dataInIterReady(c)
      resOutValid := tensorArray(0).io.resOutValid(c)
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
          when(Delay(computeIterCounter.willOverflow, 1, init=False)) {
            goto(sWriteRes)
          }
        }
      }

      val sWriteRes: State = new State {
        whenIsActive {
          when(resOutValid)(resValidCounter.increment())
          when(Delay(resValidCounter.willOverflow, 1, init=False)) {
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
    outputBufferSelOut(r)(c).payload := tensorArray(r).io.res(c).payload.asBits.asUInt
    outputBufferSelOut(r)(c).valid := tensorArray(r).io.res(c).valid
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
      Delay(List.tabulate(array_col)(i => outputBufferSelOut(regIdx)(i).payload).reduce((a, b) => a @@ b), inout_pipe_delay)
    
    io.res(regIdx) << outBuffer(regIdx).io.pop
  }
}

object TensorCoreArrayGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generate(new TensorCoreChainArray(
      array_col = 12,
      array_row = 9,
      chain_len = 34,
      out_buf_delay = 102-3,
      col_buf_max_depth = 128,
      row_buf_max_depth = 128,
      output_fifo_depth = 128,
      output_width = 24
    )).printPruned()
  }
}
