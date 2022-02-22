package intel_ips

import spinal.core._

class addfp32 extends BlackBox {
  val io = new Bundle {
    val clk = in Bool()
    val enable = in Bool()
    val rst =  in Bool()
    val a = in Bits(32 bits)
    val b = in Bits(32 bits)
    val res = out Bits(32 bits)
  }

  // disable the prefix
  noIoPrefix()
  // specify the tensor core main clock
  mapClockDomain(clock = io.clk, reset = io.rst, enable = io.enable)

  addRTLPath("./src/main/sverilog/addfp32.v")
}