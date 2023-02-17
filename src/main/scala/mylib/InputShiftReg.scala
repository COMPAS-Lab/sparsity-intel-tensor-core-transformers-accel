package mylib

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

class InputShiftReg (input_bits: Int, num_outputs: Int) extends Component {
  val io = new Bundle {
    val pushIn = slave Stream(UInt(input_bits bits))
    val dataOut = Vec(master Stream(UInt(input_bits bits)), num_outputs)
  }

  val shiftRegs = Vec(Reg(UInt(input_bits bits)), num_outputs)
  val shiftValid = Vec(Reg(Bool()), num_outputs)
  val regVaildCnterArray = List.tabulate(num_outputs)(i => Counter(num_outputs-i))

  for(i <- 1 until num_outputs) {
    when(regVaildCnterArray(i).willOverflowIfInc) {
      io.dataOut(i).valid := True
      when(io.dataOut(i).fire) {
        regVaildCnterArray(i).clear()
        shiftValid(i).clear()
      }
    }.otherwise {
      io.dataOut(i).valid := False
      when(shiftValid(i-1)) {
        shiftRegs(i) := shiftRegs(i - 1)
        shiftValid(i) := shiftValid(i - 1)
        regVaildCnterArray(i).increment()
      }
    }
  }

  when(regVaildCnterArray(0).willOverflowIfInc) {
    io.dataOut(0).valid := True
    io.pushIn.ready := False
    when(io.dataOut(0).fire) {
      io.pushIn.ready := True
      regVaildCnterArray(0).clear()
      shiftValid(0) := io.pushIn.valid
      shiftRegs(0) := Mux(io.pushIn.valid, io.pushIn.payload, U(0, input_bits bits))
    }
  }.otherwise {
    io.dataOut(0).valid := False
    io.pushIn.ready := True
    when(io.pushIn.valid) {
      regVaildCnterArray(0).increment()
      shiftRegs(0) := io.pushIn.payload
      shiftValid(0) := True
    }
  }

  for (i <- 0 until num_outputs) {
    io.dataOut(i).payload := shiftRegs(i)
  }
}
