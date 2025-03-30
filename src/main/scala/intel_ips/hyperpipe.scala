package intel_ips

import spinal.core._
import spinal.lib._

class hyperpipe(width: Int, n_stg: Int) extends BlackBox {
  addGeneric("WIDTH", width)
  addGeneric("CYCLES", n_stg)

  val io = new Bundle {
    val clk = in Bool()
    val din = in Bits(width bits)
    val dout = out Bits(width bits)
  }

  noIoPrefix()
  mapClockDomain(clock = io.clk)

  addRTLPath(s"./src/main/sverilog/hyperpipe.sv")
}

object hyperpipe {
  def apply[T <: Data](that: T, cycleCount: Int): T = {
    require(cycleCount >= 0,"Negative cycleCount is not allowed in hyper delay")

    val res: T = cloneOf(that)
    val hyperpipeCore = new hyperpipe(that.getBitsWidth, cycleCount)
    hyperpipeCore.io.din := that.asBits
    res.assignFromBits(hyperpipeCore.io.dout)
    res
  }
}