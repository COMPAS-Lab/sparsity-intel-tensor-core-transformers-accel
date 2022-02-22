package mylib

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

import intel_ips._

class TensorCoreChainArray(array_col: Int, array_row: Int, chain_len: Int,
                           col_buf_max_depth: Int, row_buf_max_depth: Int) extends Component {
  val io = new Bundle {
    val calEn = in Bool()
  }

  val matACols: Int = 320
  val matARows: Int = 768
  val matBCols: Int = 768

  val matBColsPerRowBuffer = (matBCols / array_row).ceil.toInt
  val rowBufferRdCounter = Counter(matBColsPerRowBuffer)
  // each mat A blk has the size of 3 x matACols
  val matABlksInColBuf = ((matARows / 3.0).ceil / array_col).ceil.toInt
  // how many iters to read each blk of matA
  val matABlkCols = (matACols / (10.0 * chain_len)).ceil.toInt
  // total number of counter to read mat A
  val colBufferRdCounter = Counter(matABlksInColBuf * matABlkCols * 3)

  val colRdEn, rowRdEn, tensorLoadValid, tensorDataValid = Bool()


  val tensorArray = Array.ofDim[TensorCoreChain](array_row, array_col)
  for(r <- 0 until array_row; c <- 0 until array_col) {
    tensorArray(r)(c) = new TensorCoreChain(chain_len, out_buf_delay = matBColsPerRowBuffer)
  }

  val colMem = Array.fill(array_col)(Mem(UInt(8*10 bits), col_buf_max_depth))
  val rowMem = Array.fill(array_row)(Mem(UInt(8*10*chain_len bits), row_buf_max_depth))

  // row connection
  for(r <- 0 until array_row; c <- 0 until array_col) {
    val rowMemOut: Vec[UInt] = rowMem(r).readSync(rowBufferRdCounter).subdivideIn(chain_len)
    for (tcId <- 0 until chain_len) {
      tensorArray(r)(c).io.dataIn(tcId) := rowMemOut(tcId).resize(96)
      tensorArray(r)(c).io.expIn(tcId) := 0
    }
    tensorArray(r)(c).io.loadCascadeIn := colMem(c).readSync(colBufferRdCounter)
    tensorArray(r)(c).io.expCascadeIn := 0
    tensorArray(r)(c).io.load_valid := tensorLoadValid
    tensorArray(r)(c).io.data_valid := tensorDataValid
  }

  // control path
  val ctrlFsm = new StateMachine{
    val firstMatALoadCounter = Counter((chain_len+1)*3)
    val nextALoadDelayCounter = Counter(chain_len)
    val sIdle: State = new State with EntryPoint{
      whenIsActive{
        when (io.calEn) {goto(sLoading)}
      }
    }

    val sLoading: State = new State {
      onEntry{
        rowBufferRdCounter.clear()
        colBufferRdCounter.clear()
        firstMatALoadCounter.clear()
        nextALoadDelayCounter.clear()
      }
      whenIsActive{
        //todo: check the tensorLoadValid timing requirement here
        colRdEn := True
        tensorLoadValid := True
        colBufferRdCounter.increment()
        firstMatALoadCounter.increment()
        when (firstMatALoadCounter.willOverflow) (goto(sCompute))
      }
    }

    val sCompute: State = new State {
      onEntry{
        nextALoadDelayCounter.clear()
      }
      whenIsActive{
        nextALoadDelayCounter.increment()
        rowBufferRdCounter.increment()
        colBufferRdCounter.increment()
        rowRdEn := True
        colRdEn := True
        tensorLoadValid := False
        when(nextALoadDelayCounter.willOverflow) {goto(sComputeLoad)}
      }
    }

    val sComputeLoad: State = new State {
      onEntry{
        firstMatALoadCounter.clear()
        colRdEn := False
        tensorLoadValid := False
      }
      whenIsActive{
        rowRdEn := True
        rowBufferRdCounter.increment()
        colRdEn := False
        tensorLoadValid := False
        firstMatALoadCounter.increment()
        when(rowBufferRdCounter.willOverflow) {goto(sIdle)}
          .elsewhen(firstMatALoadCounter.willOverflow) {goto(sCompute)}
      }
    }
  }
}
