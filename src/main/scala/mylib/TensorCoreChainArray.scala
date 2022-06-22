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
  val matAColSubGrpLen = UInt (8 bits)
  // matBColsPerTccRow: number of iterations to take matB sub columns
  //   it is the number of B columns computed by a tensor core chain row.
  //   matBColsPerTccRow = matBCols / array_row
  //   it equals to the chain_loading_latency when the Dot Product
  //   hides the matA loading latency just fine.
  // TODO: may make this a static parameter
  val matBColsPerTccRow = UInt (8 bits)
  // Tensor Core Chain row buffer counter boundary:
  //   calculated as Ceil(matBCols / array_row) * Ceil(matACols / (chain_len * 10.0))
  val tccRowBufferCnterRange = UInt (8 bits)
  // Tensor Core Chain col buffer counter boundary:
  //   each mat A blk has the size of 3 x matACols:
  //   matABlksInColBuf = ((matARows / 3.0).ceil / array_col).ceil.toInt
  //   the number of iters to read each blk of mat A
  //   matABlkCols = (matACols / 10.0).ceil.toInt
  //   total number of counter to read mat A:
  //   tccColBufferCnterRange = matABlksInColBuf * matABlkCols * 3
  val tccColBufferCnterRange = UInt (8 bits)
}

class TensorCoreChainArray(array_col: Int, array_row: Int, chain_len: Int,
                           out_buf_delay: Int, //should be (matBCols / array_row).ceil.toInt - 3
                           col_buf_max_depth: Int, row_buf_max_depth: Int,
                           output_fifo_depth: Int, output_width: Int,
                           inout_pipe_delay: Int = 5) extends Component {
  val io = new Bundle {
    val matALoad = Vec(slave Flow (UInt(32 * 10 bits)), array_col)
    val matBLoad = Vec(Vec(slave Flow (UInt(32 * 10 bits)), chain_len), array_row)
    val calEn = in Bool()
    // config ports
    val configPorts =  in (TensorCoreChainArrayConfigPorts())
    val res_top = master Stream (UInt(output_width * 3 bits))
    val res_bot = master Stream (UInt(output_width * 3 bits))
    val res_id = in UInt(16 bits)
  }

  //adding pipes to the ctrl signals
  val calEnDelay = Delay(io.calEn, 2, init=False)
  val configDelay = Delay(io.configPorts, 2, init=TensorCoreChainArrayConfigPorts().getZero)

  val rowBufferRdCounter = DynaCounter(8, configDelay.tccRowBufferCnterRange + (chain_len-1) * 2)
  val colBufferRdCounter = DynaCounter(8, configDelay.tccColBufferCnterRange)

  val tensorLoadValid, tensorDataValid = Reg(Bool()) init False
  val matAColSubGrpLenReg = Reg(UInt(8 bits)) init U"8'd0"

  val tensorArray = Array.ofDim[TensorCoreChain](array_row, array_col)
  for (r <- 0 until array_row; c <- 0 until array_col) {
    // out buf delay = number of B columns in each tensor core chain row - 3
    tensorArray(r)(c) = new TensorCoreChain(chain_len, out_buf_delay = out_buf_delay,
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
    colConverters(c).io.dataIn <> io.matALoad(c)
    val colBufferWrCounter = DynaCounter(8, configDelay.tccColBufferCnterRange)
    colMem(c).io.wraddress := colBufferWrCounter.resize(colMem(c).io.wraddress.getWidth)
    colMem(c).io.data := colConverters(c).io.dataOut.payload
    //TODO: fix col buffer rd addr delay timing misalignment
    colMem(c).io.rdaddress := Delay(colBufferRdCounter.resize(colMem(c).io.rdaddress.getWidth), 2)
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
      val rowBufferWrCounter = DynaCounter(8, configDelay.tccRowBufferCnterRange)

      rowMem(r * chain_len + tcId).setName("rowMem_" + r + "_" + tcId)
      rowConverters(r)(tcId) = new FixedBfpConverter
      rowConverters(r)(tcId).io.dataIn <> io.matBLoad(r)(tcId)
      rowMem(r * chain_len + tcId).io.wraddress :=
        rowBufferWrCounter.resize(rowMem(r * chain_len + tcId).io.wraddress.getWidth)
      rowMem(r * chain_len + tcId).io.data := rowConverters(r)(tcId).io.dataOut.payload
      //TODO: utilize row buffer to delay the inputs according to its destination tensor core
      //   in each tensor core chain
      rowMemAddr(r)(tcId) = rowBufferRdCounter - U(2*tcId, rowBufferRdCounter.getWidth bits)
      //TODO: fix row mem rd addr delay timing misalignment
      rowMem(r * chain_len + tcId).io.rdaddress :=
        Delay(rowMemAddr(r)(tcId).resize(rowMem(r * chain_len + tcId).io.rdaddress.getWidth), 2)

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
  for (r <- 0 until array_row; c <- 0 until array_col) {
    val rowMemOut: Vec[UInt] = Vec(UInt(8*11 bits), chain_len)
    for (cl <- 0 until chain_len) (rowMemOut(cl) := rowMem(r * chain_len + cl).io.q)

    for (tcId <- 0 until chain_len) {
      when(rowMemAddr(r)(c) < io.configPorts.tccRowBufferCnterRange &&
            rowMemAddr(r)(c) >= 2*tcId) {
        tensorArray(r)(c).io.dataIn(tcId) := Delay(rowMemOut(tcId)(87 downto 8), inout_pipe_delay, init=U"80'd0")
        tensorArray(r)(c).io.expIn(tcId) := Delay(rowMemOut(tcId)(7 downto 0), inout_pipe_delay, init=U"8'd0")
      }.otherwise {
        tensorArray(r)(c).io.dataIn(tcId) := 0
        tensorArray(r)(c).io.expIn(tcId) := 0
      }
    }

    tensorArray(r)(c).io.loadCascadeIn := Delay(colMem(c).io.q(87 downto 8), inout_pipe_delay, init=U"80'd0")
    tensorArray(r)(c).io.expCascadeIn := Delay(colMem(c).io.q(7 downto 0), inout_pipe_delay, init=U"8'd0")
    tensorArray(r)(c).io.loadValid := Delay(tensorLoadValid, 1+2+inout_pipe_delay, init=False)
    tensorArray(r)(c).io.dataValid := Delay(tensorDataValid, 1+2+inout_pipe_delay, init=False)
    // tensor core input iters: number of iterations to take matB sub columns
    //   it is the number of B columns for a tensor core chain row.
    //   it equals to the chain_loading_latency when the Dot Product
    //   hides the matA loading latency just fine.
    tensorArray(r)(c).io.inputIters := configDelay.matBColsPerTccRow
    tensorArray(r)(c).io.matAColSubGrpLen := configDelay.matAColSubGrpLen
  }

  // compute control path
  val ctrlStateMachine = new StateMachine {
    val loadRdy, dataInIterReady, resOutValid = Bool()
    loadRdy := tensorArray(0)(0).io.loadReady
    dataInIterReady := tensorArray(0)(0).io.dataIterReady
    resOutValid := tensorArray(0)(0).io.outValid
    val loadFinish, dataInFinish = Reg(Bool()) init False

    val loadIterCounter, computeIterCounter =
      DynaCounter(matAColSubGrpLenReg.getWidth, matAColSubGrpLenReg)
    val resValidCounter = DynaCounter(matAColSubGrpLenReg.getWidth, matAColSubGrpLenReg)

    val sIdle: State = new State with EntryPoint {
      onEntry {
        matAColSubGrpLenReg := U"8'd0"
        colBufferRdCounter.clear()
        rowBufferRdCounter.clear()
        computeIterCounter.clear()
        resValidCounter.clear()
        tensorLoadValid := False
        tensorDataValid := False
        loadFinish := False
        dataInFinish := False
      }
      whenIsActive {
        when(calEnDelay) {
          matAColSubGrpLenReg := configDelay.matAColSubGrpLen
          goto(sPreLoad)
        }
      }
    }

    val sPreLoad: State = new State {
      onEntry {
        colBufferRdCounter.increment()
        tensorLoadValid := True
        loadIterCounter.clear()
      }
      whenIsActive {
        colBufferRdCounter.increment()
        when(loadRdy) {
          loadIterCounter.increment()
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

        when(loadFinish === False) {
          colBufferRdCounter.increment()
        } otherwise {
          colBufferRdCounter.clear()
          tensorLoadValid := False
        }
        when(colBufferRdCounter.willOverflow) {
          loadFinish := True
        }

        when(resOutValid)(resValidCounter.increment())
        when(loadRdy)(loadIterCounter.increment())
        when(dataInIterReady)(computeIterCounter.increment())
        when(computeIterCounter.willOverflow) {
          goto(sWriteRes)
        }
      }
    }

    val sWriteRes: State = new State {
      whenIsActive {
        when(resOutValid)(resValidCounter.increment())
        when(resValidCounter.willOverflow) {
          goto(sIdle)
        }
      }
    }
  }

  //output buffer path
  val outputBufferSelOut = Vec(Stream(UInt(output_width * 3 bits)), array_row * array_col)
  val outputBufferSelOutDelayedTop = Vec(Stream(UInt(output_width * 3 bits)), array_row*array_col/2)
  val outputBufferSelOutDelayedBot = Vec(Stream(UInt(output_width * 3 bits)), array_row*array_col/2)

  for (r <- 0 until array_row; c <- 0 until array_col) {
    val tcChainId = r * array_col + c
    outputBufferSelOut(tcChainId).payload := tensorArray(r)(c).io.res.payload.asBits.asUInt
    outputBufferSelOut(tcChainId).valid := tensorArray(r)(c).io.res.valid
    tensorArray(r)(c).io.res.ready := outputBufferSelOut(tcChainId).ready
    if (tcChainId < array_row * array_col / 2) {
      outputBufferSelOutDelayedTop(tcChainId) << StreamDelay(outputBufferSelOut(tcChainId), inout_pipe_delay)
    } else {
      outputBufferSelOutDelayedBot(tcChainId - array_row * array_col / 2) <<
                                                                 StreamDelay(outputBufferSelOut(tcChainId), inout_pipe_delay)
    }
  }

  outputBufferSelOutDelayedTop.foreach(_.ready := False)
  outputBufferSelOutDelayedBot.foreach(_.ready := False)



  io.res_top << outputBufferSelOutDelayedTop(io.res_id)
  io.res_bot << outputBufferSelOutDelayedBot(io.res_id)
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
