package mylib

import config.DefaultConfig
import spinal.core._
import spinal.lib._
import intel_ips.out_asym_fifo

class transposer_core(dwidth: Int, num_inputs: Int, num_outputs: Int) extends BlackBox {
  val io = new Bundle {
    val clk, reset, next = in Bool()
    val next_out = out Bool()
    val X = in Vec(UInt(dwidth bits), num_inputs)
    val Y = out Vec(UInt(dwidth bits), num_outputs)
  }
  // disable the prefix
  noIoPrefix()
  // specify the tensor core main clock
  mapClockDomain(clock = io.clk, reset = io.reset, resetActiveLevel = HIGH)

  private def renameIoX(): Unit = {
    for (a_id <- 0 until num_inputs) {
      io.X(a_id).setName("x" + a_id.toString)
    }
    for (b_id <- 0 until num_outputs) {
      io.Y(b_id).setName("y" + b_id.toString)
    }
  }

  addPrePopTask(() => renameIoX())
  addRTLPath(s"./src/main/sverilog/transpose-8192.sv")
}

case class VecBTransposer(dwidth: Int, num_inputs: Int, chain_len: Int) extends Component {
  val io = new Bundle {
    val multiVecIn = slave Flow (UInt(dwidth * num_inputs bits))
    val singleVecOut = Vec(master Flow (UInt(dwidth * 20 bits)), chain_len)
  }

  val transposerCore = new transposer_core(dwidth, num_inputs, 32)
  transposerCore.io.X <> io.multiVecIn.payload.subdivideIn(dwidth bits)
  transposerCore.io.next := io.multiVecIn.valid

  val sRegSize: Int = ((20.0 * chain_len.toFloat / 32.toFloat).ceil * 32.0).toInt
  val shiftRegs = Reg(Bits(dwidth * sRegSize bits)) init 0

  val popCount = Counter(sRegSize)

  shiftRegs(num_inputs * dwidth - 1 downto 0) := transposerCore.io.Y.asBits
  for (i <- 1 until sRegSize) {
    shiftRegs((i+1) * dwidth - 1 downto i * dwidth) := shiftRegs(i * dwidth - 1 downto (i-1) * dwidth)
  }

  val resFromShiftRegs = shiftRegs(dwidth * 20 * chain_len - 1 downto 0).subdivideIn(dwidth * 20 bits)
  for (i <- 0 until chain_len) {
    io.singleVecOut(i).payload := resFromShiftRegs(i).asUInt
    io.singleVecOut(i).valid := popCount.willOverflow
  }

  // dummy ctrl logic
  when(io.multiVecIn.fire) {popCount.increment()}
}

object VecBTransposerGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.withoutEnumString().generate(
      VecBTransposer(16, 32, 10))
  }
}