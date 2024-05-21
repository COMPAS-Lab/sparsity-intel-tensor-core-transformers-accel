package mvm

import spinal.core._
import spinal.lib._
import scala.math.pow

case class BarrelShifter(bitwidth: Int, num_cells: Int) extends Component {
  val io = new Bundle {
    val dataIn = Vec(slave Flow (UInt(bitwidth bits)), num_cells)
    val dataOut = Vec(master Flow (UInt(bitwidth bits)), num_cells)
    val shiftCtrl = slave Flow(UInt(num_cells bits))
  }

  assert(num_cells % 2 == 0)
  val numStages = log2Up(num_cells)
  val shiftRegs = Array.fill(numStages + 1, num_cells)(RegFlow(UInt(bitwidth bits)))
  val shiftCtrlReg = Array.fill(numStages)(Reg(UInt(num_cells bits), init = U(0)))

  for (s <- 1 until numStages + 1; i <- 0 until num_cells) {
    when(shiftCtrlReg(s-1)(i)) {
      shiftRegs(s)(i) << shiftRegs(s - 1)(i)
    }.otherwise {
      shiftRegs(s)(i) << shiftRegs(s - 1)((i + pow(2, s-1).intValue()) % num_cells)
    }
  }
  for ( i <- 0 until num_cells) {
    shiftRegs(0)(i) << io.dataIn(i)
    io.dataOut(i) << shiftRegs(numStages)(i)
  }


  // shift ctrl loading
  when(io.shiftCtrl.valid) {
    for (s <- 1 until numStages) {
      shiftCtrlReg(s) := shiftCtrlReg(s-1)
    }
    shiftCtrlReg(0) := io.shiftCtrl.payload
  }
}

object BarrelShifterGen {
  def main(args: Array[String]): Unit = {
    val gen = SpinalConfig(targetDirectory = "./src/generated")
    gen.generateVerilog(BarrelShifter(90, 8)).printPruned()
  }
}
