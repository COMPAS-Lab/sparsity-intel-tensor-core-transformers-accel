package mylib

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import config._
import intel_ips._
import util._

class TensorCoreChainArray(array_col: Int, array_row: Int, chain_len: Int,
                           col_buf_max_depth: Int, row_buf_max_depth: Int, output_width: Int) extends Component {
  val io = new Bundle {
    val matALoad = Vec(slave Flow (UInt(32 * 10 bits)), array_col)
    val matBLoad = Vec(Vec(slave Flow (UInt(32 * 10 bits)), chain_len), array_row)
    val calEn = in Bool()
    val computeIters = in UInt (8 bits)
    val res = master Stream (UInt(output_width * 3 * array_col * array_row bits))
  }

  val matACols = 90.0
  val matARows = 9.0
  val matBCols = 18.0

  val matBColsPerRowBuffer = (matBCols / array_row).ceil.toInt * (matACols / (chain_len * 10.0)).ceil.toInt
  val rowBufferRdCounter = Counter(matBColsPerRowBuffer)
  // each mat A blk has the size of 3 x matACols
  val matABlksInColBuf = ((matARows / 3.0).ceil / array_col).ceil.toInt
  // how many iters to read each blk of mat A
  val matABlkCols = (matACols / 10.0).ceil.toInt
  // total number of counter to read mat A
  val colBufferRdCounter = Counter(matABlksInColBuf * matABlkCols * 3)

  val tensorLoadValid, tensorDataValid = Reg(Bool()) init False
  val computeItersReg = Reg(UInt(8 bits)) init U"8'd0"

  val tensorArray = Array.ofDim[TensorCoreChain](array_row, array_col)
  for (r <- 0 until array_row; c <- 0 until array_col) {
    tensorArray(r)(c) = new TensorCoreChain(chain_len, out_buf_delay = (matBCols / array_row).ceil.toInt - 3,
      output_width = output_width)
  }

  //adding pipes to the ctrl signals
  val calEnDelay = Delay(io.calEn, 2) init False
  val computeItersDelay = Delay(io.computeIters, 2) init U"8'd0"

  val tcArrayRes = Flow(Vec((UInt(output_width * 3 bits)), array_col * array_row))

  //input buffers
  val colMem = Array.fill(array_col)(
    Mem(UInt(8 * 11 bits), col_buf_max_depth) init (Array.fill(col_buf_max_depth)(U(0, 8 * 11 bits))))
  val rowMem = Array.fill(array_row * chain_len)(
    Mem(UInt(8 * 11 bits), col_buf_max_depth) init (Array.fill(col_buf_max_depth)(U(0, 8 * 11 bits))))
  //bfp converters
  val colConverters = Array.fill(array_col)(new FixedBfpConverter())
  val rowConverters = Array.ofDim[FixedBfpConverter](array_row, chain_len)

  //buffer load
  for (c <- 0 until array_col) {
    colConverters(c).io.dataIn <> io.matALoad(c)
    val colBufferWrCounter = Counter(matABlksInColBuf * matABlkCols * 3)
    when(colConverters(c).io.dataOut.fire) {
      colBufferWrCounter.increment()
      colMem(c)(colBufferWrCounter.resize(colMem(c).addressWidth)) :=
        colConverters(c).io.dataOut.payload
    } otherwise (colBufferWrCounter.clear())
  }
  for (r <- 0 until array_row) {
    for (tcId <- 0 until chain_len) {
      val rowBufferWrCounter = Counter(matBColsPerRowBuffer)

      rowConverters(r)(tcId) = new FixedBfpConverter
      rowConverters(r)(tcId).io.dataIn <> io.matBLoad(r)(tcId)

      when(rowConverters(r)(tcId).io.dataOut.fire) {
        rowBufferWrCounter.increment()
        rowMem(r * chain_len + tcId)(rowBufferWrCounter.resize(rowMem(r * chain_len + tcId).addressWidth)) :=
          rowConverters(r)(tcId).io.dataOut.payload
      } otherwise (rowBufferWrCounter.clear())
    }
  }

  // row connection
  for (r <- 0 until array_row; c <- 0 until array_col) {
    val rowMemOut: Vec[UInt] = Vec(
      for (cl <- 0 until chain_len)
        yield rowMem(r * chain_len + cl).readSync(rowBufferRdCounter.resize(rowMem(r * chain_len + cl).addressWidth))
    )
    val colMemOut = colMem(c).readSync(colBufferRdCounter.resize(colMem(c).addressWidth))
    for (tcId <- 0 until chain_len) {
      tensorArray(r)(c).io.dataIn(tcId) := Mux(tensorDataValid, rowMemOut(tcId)(87 downto 8), U"80'd0")
      tensorArray(r)(c).io.expIn(tcId) := Mux(tensorDataValid, rowMemOut(tcId)(7 downto 0), U"8'd0")
    }
    tensorArray(r)(c).io.loadCascadeIn := Mux(tensorLoadValid, colMemOut(87 downto 8), U"80'd0")
    tensorArray(r)(c).io.expCascadeIn := Mux(tensorLoadValid, colMemOut(7 downto 0), U"8'd0")
    tensorArray(r)(c).io.loadValid := tensorLoadValid
    tensorArray(r)(c).io.dataValid := tensorDataValid
    tensorArray(r)(c).io.inputIters := U"8'd9"
    tcArrayRes.payload(r * array_col + c) := tensorArray(r)(c).io.res.as(UInt(output_width * 3 bits))
  }

  tcArrayRes.valid := False
  // compute control path
  val ctrlStateMachine = new StateMachine {
    val loadRdy, dataInIterReady, resOutValid = Bool()
    loadRdy := tensorArray(0)(0).io.loadReady
    dataInIterReady := tensorArray(0)(0).io.dataIterReady
    resOutValid := tensorArray(0)(0).io.outValid
    val loadFinish, dataInFinish = Reg(Bool()) init False

    val loadIterCounter, computeIterCounter =
      DynaCounter(computeItersReg.getWidth, computeItersReg)
    val resValidCounter = DynaCounter(computeItersReg.getWidth, computeItersReg)

    val sIdle: State = new State with EntryPoint {
      onEntry {
        computeItersReg := U"8'd0"
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
          computeItersReg := computeItersReg
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
        tcArrayRes.valid := resValidCounter.willOverflowIfInc
        when(resValidCounter.willOverflow) {
          goto(sIdle)
        }
      }
    }
  }

  //output buffer path
  val outputBuffer = StreamFifo(UInt(tcArrayRes.payload.getBitsWidth bits), 128)
  val bufferIf = Stream(UInt(tcArrayRes.payload.getBitsWidth bits))

  outputBuffer.io.push << bufferIf
  outputBuffer.io.pop >> io.res

  bufferIf.valid := (tcArrayRes.valid && bufferIf.ready)
  bufferIf.payload := tcArrayRes.payload.as(UInt(output_width * 3 * array_row * array_col bits))

}

object TensorCoreArrayGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generate(new TensorCoreChainArray(
      array_col = 3,
      array_row = 2,
      chain_len = 3,
      col_buf_max_depth = 128,
      row_buf_max_depth = 128,
      output_width = 24
    )).printPruned()
  }
}
