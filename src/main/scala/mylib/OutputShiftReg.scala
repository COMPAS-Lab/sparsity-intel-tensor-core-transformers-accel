package mylib

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

class OutputShiftReg (input_bits: Int, num_inputs: Int) extends Component {
  val io = new Bundle {
    val resIn = Vec(slave Flow(UInt(input_bits bits)), num_inputs)
    val popOut = master Flow(UInt(input_bits bits))
  }

  val shiftRegs = Vec(RegInit(U(0, input_bits bits)), num_inputs)
  val isShifting = RegInit(False)
  val loadedRegs = RegInit(U(0, num_inputs bits))

  when(isShifting) {
    io.popOut.valid := True
    loadedRegs.clearAll()
    for (i <- 1 until num_inputs) {
      when(io.popOut.fire) (shiftRegs(i) := shiftRegs(i-1))
    }
  } otherwise {
    io.popOut.valid := False
    for (i <- 0 until num_inputs) {
      when(io.resIn(i).fire && ~loadedRegs(i)) {
        shiftRegs(i) := io.resIn(i).payload
        loadedRegs(i) := True
      }
    }
  }

  //Control path
  val outCounter = Counter(num_inputs)
  when(isShifting) {
    when(io.popOut.fire) (outCounter.increment())
    when(outCounter.willOverflow) (isShifting := False)
  } otherwise {
    outCounter.clear()
    when(loadedRegs.andR) {
      isShifting := True
    }
  }

  io.popOut.payload := shiftRegs(num_inputs-1)
}
