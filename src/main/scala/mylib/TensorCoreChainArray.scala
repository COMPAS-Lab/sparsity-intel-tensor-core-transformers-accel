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
    val res_id = in UInt(16 bits)
  }

  //adding pipes to the ctrl signals
  val calEnDelay = Delay(io.calEn, 4, init=False)
  val configDelay = Delay(io.configPorts, 4, init=TensorCoreChainArrayConfigPorts().getZero)

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
  val colMem = Array.fill(array_col)(new in_buffer)
  val rowMem = Array.fill(array_row * chain_len)(new in_buffer)
  //bfp converters
  val colConverters = Array.fill(array_col)(new FixedBfpConverter())
  val rowConverters = Array.ofDim[FixedBfpConverter](array_row, chain_len)

  //buffer write and read
  for (c <- 0 until array_col) {
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
  }

  val rowMemAddr = Array.ofDim[UInt](array_row, chain_len)
  for (r <- 0 until array_row) {
    for (tcId <- 0 until chain_len) {
      val rowBufferWrCounter =
          DynaCounter(io.configPorts.tccColBufferCnterRange.getWidth, configDelay.tccRowBufferCnterRange)
      rowBufferWrCounter.setName("rowMemWrCounter_" + r + "_" + tcId)
      
      rowMem(r * chain_len + tcId).setName("rowMem_" + r + "_" + tcId)
      rowConverters(r)(tcId) = new FixedBfpConverter
      rowConverters(r)(tcId).io.dataIn <> io.matBLoad(r)(tcId).asFlow
      io.matBLoad(r)(tcId).ready := True
      rowMem(r * chain_len + tcId).io.wraddress :=
        rowBufferWrCounter.resize(rowMem(r * chain_len + tcId).io.wraddress.getWidth)
      rowMem(r * chain_len + tcId).io.data := rowConverters(r)(tcId).io.dataOut.payload
      //TODO: utilize row buffer to delay the inputs according to its destination tensor core
      //   in each tensor core chain
      //TODO: check timing of delayed row address compute
      rowMemAddr(r)(tcId) = Delay(rowBufferRdCounter(r) - U(2*tcId, rowBufferRdCounter(r).getWidth bits), 2)
      //TODO: fix row mem rd addr delay timing misalignment
      rowMem(r * chain_len + tcId).io.rdaddress :=
        rowMemAddr(r)(tcId).resize(rowMem(r * chain_len + tcId).io.rdaddress.getWidth)

      when(rowConverters(r)(tcId).io.dataOut.fire) {
        rowBufferWrCounter.increment()
        rowMem(r * chain_len + tcId).io.wren := True
      } otherwise {
        rowBufferWrCounter.clear()
        rowMem(r * chain_len + tcId).io.wren := False
      }
    }
  }

  // data connection from row/col buffer to the tensor core chains
  for (c <- 0 until array_col) {
    val delayedLoadCascadeIn = DelayTree(colMem(c).io.q(87 downto 8), log2Up(array_row))
    val delayedExpCascadeIn = DelayTree(colMem(c).io.q(7 downto 0), log2Up(array_row))
    for (r <- 0 until array_row) {
      val rowMemOut: Vec[UInt] = Vec(UInt(8 * 11 bits), chain_len)
      for (cl <- 0 until chain_len) (rowMemOut(cl) := rowMem(r * chain_len + cl).io.q)

      for (tcId <- 0 until chain_len) {
        // TODO: check timing of the delayed row address
        tensorArray(r)(c).io.dataIn(tcId).valid :=
          (rowMemAddr(r)(tcId) < io.configPorts.tccRowBufferCnterRange && rowMemAddr(r)(tcId) >= 2 * tcId)
        tensorArray(r)(c).io.dataIn(tcId).payload := Delay(rowMemOut(tcId)(87 downto 8), inout_pipe_delay, init = U"80'd0")
        tensorArray(r)(c).io.expIn(tcId) := Delay(rowMemOut(tcId)(7 downto 0), inout_pipe_delay, init = U"8'd0")
      }

      tensorArray(r)(c).io.loadCascadeIn := delayedLoadCascadeIn(r)
      tensorArray(r)(c).io.expCascadeIn := delayedExpCascadeIn(r)
      tensorArray(r)(c).io.loadValid := Delay(tensorLoadValid(c), 1 + 2 + inout_pipe_delay, init = False)
      tensorArray(r)(c).io.dataValid := Delay(tensorDataValid(r), 1 + 2 + inout_pipe_delay, init = False)
      // tensor core input iters: number of iterations to take matB sub columns
      //   it is the number of B columns for a tensor core chain row.
      //   it equals to the chain_loading_latency when the Dot Product
      //   hides the matA loading latency just fine.
      tensorArray(r)(c).io.inputIters := configDelay.matBColsPerTccRow
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
    Vec(Vec(Stream(UInt(output_width * 3 bits)), array_col), array_row)

  for (r <- 0 until array_row; c <- 0 until array_col) {
    val tcChainId = r * array_col + c
    outputBufferSelOut(r)(c).payload := tensorArray(r)(c).io.res.payload.asBits.asUInt
    outputBufferSelOut(r)(c).valid := tensorArray(r)(c).io.res.valid
    tensorArray(r)(c).io.res.ready := outputBufferSelOut(r)(c).ready
  }

  // TODO: verify function of shift regs
  val outShiftRegs = new Array[OutputShiftReg](array_row)
  val outResDelayUnblocked = Vec(Flow (UInt(output_width * 3 bits)), array_row)
  val outBuffer = new Array[StreamFifo[UInt]](array_row)
  for (regIdx <- 0 until array_row) {
    outShiftRegs(regIdx) = new OutputShiftReg(output_width * 3, array_col)
    
    for (col <- 0 until array_col) {
      outShiftRegs(regIdx).io.resIn(col) << StreamDelay(outputBufferSelOut(regIdx)(col), 3)
    }

    outResDelayUnblocked(regIdx) << outShiftRegs(regIdx).io.popOut.toFlow
    outBuffer(regIdx) = StreamFifo(UInt(outResDelayUnblocked(regIdx).payload.getWidth bits), 64)
    outBuffer(regIdx).io.push.payload := Delay(outResDelayUnblocked(regIdx).payload, 4,
      init=outResDelayUnblocked(regIdx).payload.getZero)
    outBuffer(regIdx).io.push.valid := Delay(outResDelayUnblocked(regIdx).valid, 4, init=False)

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
