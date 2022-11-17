package mylib

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

class InputShiftReg (input_bits: Int, num_outputs: Int) extends Component {
  val io = new Bundle {
    val pushIn = slave Stream(UInt(input_bits bits))
    val dataOut = Vec(master Stream(UInt(input_bits bits)), num_outputs)
  }

  val shiftRegs = Vec(RegInit(U(0, input_bits bits)), num_outputs)
  val isLoading = RegInit(False)
  val loadedNumRegs = Counter(num_outputs)

  when(isLoading) {
    when(io.pushIn.fire) {
      shiftRegs(0) := io.pushIn.payload
      for (i <- 1 until num_outputs) {
        shiftRegs(i) := shiftRegs(i-1)
      }
    }
  }

  for (i <- 0 until num_outputs) {
    io.dataOut(i).payload := shiftRegs(i)
  }

  //Control path
  io.dataOut.foreach(_.valid := False)
  when(isLoading) {
    when(io.pushIn.fire) (loadedNumRegs.increment())
    when(loadedNumRegs.willOverflow) (isLoading := False)
  } otherwise {
    loadedNumRegs.clear()
    io.dataOut.foreach(_.valid := True)
    when(io.dataOut(0).fire) {
      isLoading := True
    }
  }
  io.pushIn.ready := isLoading

}
