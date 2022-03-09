package mylib

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

import config._
import intel_ips._
import util._

class TensorCoreChainArray(array_col: Int, array_row: Int, chain_len: Int,
                           col_buf_max_depth: Int, row_buf_max_depth: Int) extends Component {
  val io = new Bundle {
    val matALoad = Vec(slave Flow(UInt(32*10 bits)), array_col)
    val matBLoad = Vec(Vec(slave Flow(UInt(32*10 bits)), chain_len), array_row)
    val calEn = in Bool()
    val computeIters = in UInt(8 bits)
    val res = master Flow(Vec(Vec((UInt(32*3 bits)), array_col), array_row))
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
  for(r <- 0 until array_row; c <- 0 until array_col) {
    tensorArray(r)(c) = new TensorCoreChain(chain_len, out_buf_delay = (matBCols / array_row).ceil.toInt - 3)
  }

  val colMem = Array.fill(array_col)(
				Mem(UInt(8*11 bits), col_buf_max_depth) init (Array.fill(col_buf_max_depth)(U(0, 8*11 bits))))
  val rowMem = Array.fill(array_row)(
				Mem(UInt(8*11*chain_len bits), row_buf_max_depth) init (Array.fill(row_buf_max_depth)(U(0, 8*11*chain_len bits))))

  // row connection
  for(r <- 0 until array_row; c <- 0 until array_col) {
    val rowMemOut: Vec[UInt] = rowMem(r).readSync(rowBufferRdCounter.resize(rowMem(r).addressWidth))
                                .subdivideIn(chain_len slices)
    val colMemOut = colMem(c).readSync(colBufferRdCounter.resize(colMem(c).addressWidth))
    for (tcId <- 0 until chain_len) {
      tensorArray(r)(c).io.dataIn(tcId) := rowMemOut(tcId)(87 downto 8)
      tensorArray(r)(c).io.expIn(tcId) := rowMemOut(tcId)(7 downto 0)
    }
    tensorArray(r)(c).io.loadCascadeIn := colMemOut(87 downto 8)
    tensorArray(r)(c).io.expCascadeIn := colMemOut(7 downto 0)
    tensorArray(r)(c).io.loadValid := tensorLoadValid
    tensorArray(r)(c).io.dataValid := tensorDataValid
    tensorArray(r)(c).io.inputIters := U"8'd9"
    io.res.payload(r)(c) := tensorArray(r)(c).io.res.as(UInt(32*3 bits))
  }

  //bfp converters
  val colConverters = Array.fill(array_col)(bfp_converter_wrapper(10, 10, 32, 23, 8))
  val rowConverters = Array.ofDim[bfp_converter_wrapper](array_row, chain_len)

  //buffer load
  for(c <- 0 until array_col) {
    colConverters(c).io.in_vector_flatten <> io.matALoad(c)
    val colBufferWrCounter = Counter(matABlksInColBuf * matABlkCols * 3)
    when(colConverters(c).io.outBlk_flatten.fire) {
      colBufferWrCounter.increment()
      colMem(c)(colBufferWrCounter.resize(colMem(c).addressWidth)) :=
          colConverters(c).io.outBlk_flatten.payload
    } otherwise(colBufferWrCounter.clear())
  }
  for(r <- 0 until array_row) {
    val rowBufferWrCounter = Counter(matBColsPerRowBuffer)
    val blkDataWidth = 8*11
    val rowMemWrDataFlatten = UInt(blkDataWidth*chain_len bits)
    for(tcId <- 0 until chain_len) {
      rowConverters(r)(tcId) = bfp_converter_wrapper(10, 10, 32, 23, 8)
      rowConverters(r)(tcId).io.in_vector_flatten <> io.matBLoad(r)(tcId)
      rowMemWrDataFlatten((tcId+1)*blkDataWidth-1 downto tcId*blkDataWidth) :=
        rowConverters(r)(tcId).io.outBlk_flatten.payload
    }

    when(rowConverters(r)(0).io.outBlk_flatten.fire) {
      rowBufferWrCounter.increment()
      rowMem(r)(rowBufferWrCounter.resize(rowMem(r).addressWidth)) := rowMemWrDataFlatten
    } otherwise(rowBufferWrCounter.clear())
  }

  io.res.valid := False
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
      whenIsActive{
        when(io.calEn) {
          computeItersReg := io.computeIters
          goto(sPreLoad)
        }
      }
    }

    val sPreLoad: State = new State {
      onEntry{
		colBufferRdCounter.increment()
		tensorLoadValid := True
        loadIterCounter.clear()
      }
      whenIsActive{
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
		when (dataInFinish === False) {
		  rowBufferRdCounter.increment()
		} otherwise {
		  rowBufferRdCounter.clear()
		  tensorDataValid := False
		}
		when(rowBufferRdCounter.willOverflow) {
		  dataInFinish := True
		}
		
		when (loadFinish === False) {
		  colBufferRdCounter.increment()
		} otherwise {
		  colBufferRdCounter.clear()
		  tensorLoadValid := False
		}
        when(colBufferRdCounter.willOverflow) {
		  loadFinish := True
		}
		
        when(resOutValid) (resValidCounter.increment())
        when(loadRdy) (loadIterCounter.increment())
        when(dataInIterReady) (computeIterCounter.increment())
        when(computeIterCounter.willOverflow) {
          goto(sWriteRes)
        }
      }
    }

    val sWriteRes: State = new State {
      whenIsActive {
        when(resOutValid) (resValidCounter.increment())
        io.res.valid := resValidCounter.willOverflowIfInc
        when(resValidCounter.willOverflow) {
          goto(sIdle)
        }
      }
    }
  }
}

object TensorCoreArrayGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generate(new TensorCoreChainArray(
      array_col = 3,
      array_row = 2,
      chain_len = 3,
      col_buf_max_depth = 512,
      row_buf_max_depth = 512
    )).printPruned()
  }
}
