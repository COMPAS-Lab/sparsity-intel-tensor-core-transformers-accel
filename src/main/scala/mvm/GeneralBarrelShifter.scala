package mvm

import spinal.core._
import spinal.lib._
import scala.math.pow

case class GeneralBarrelShifter[T <: Data](dataType: HardType[T], num_input_cells: Int) extends Component {
  val io = new Bundle {
    val dataIn = Vec(slave Flow (dataType), num_input_cells)
    val dataOut = Vec(master Flow (dataType), num_input_cells)
    val shiftCtrl = slave Flow(UInt(log2Up(num_input_cells) bits))
    val shiftEn = in Bool()
  }

  assert(num_input_cells % 2 == 0)
  val numStages = log2Up(num_input_cells)
  val shiftRegs = Array.fill(numStages + 1, num_input_cells)(Reg(Flow(dataType)))
  val shiftCtrlReg = Array.fill(numStages)(Reg(UInt(log2Up(num_input_cells) bits), init = U(0)))

  for (s <- 1 until numStages + 1; i <- 0 until num_input_cells) {
    shiftRegs(s)(i).init(Flow(dataType).getZero)
    when(io.shiftEn) {
      when(shiftCtrlReg(s - 1)(s - 1)) {
        val stageRotAmt: Int = if (s < numStages) pow(2, s - 1).intValue() else num_input_cells / 2
        shiftRegs(s)(i) << shiftRegs(s - 1)((i + stageRotAmt) % num_input_cells)
      }.otherwise {
        shiftRegs(s)(i) << shiftRegs(s - 1)(i)
      }
    }
  }
  for ( i <- 0 until num_input_cells) {
    when(io.shiftEn) {
      shiftRegs(0)(i).init(Flow(dataType).getZero)
      shiftRegs(0)(i) << io.dataIn(i)
    }
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

object GeneralBarrelShifterGen {
  def main(args: Array[String]): Unit = {
    val gen = SpinalConfig(targetDirectory = "./src/generated")
    gen.generateVerilog(GeneralBarrelShifter(UInt(88 bits), 12)).printPruned()
  }
}
