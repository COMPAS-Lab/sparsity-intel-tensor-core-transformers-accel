package intel_ips

import spinal.core._
import spinal.lib._

class tc_clk_pll extends BlackBox {
  val io = new Bundle {
    val rst, refclk = in Bool()
    val locked, outclk_0 = out Bool()
  }

  noIoPrefix()
}
