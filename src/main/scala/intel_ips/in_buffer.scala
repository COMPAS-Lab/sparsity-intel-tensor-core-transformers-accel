package intel_ips

import spinal.core._

class in_buffer extends BlackBox {
  val io = new Bundle {
    val clock = in Bool()
    val wren = in Bool()
    val rdaddress, wraddress =  in UInt(7 bits)
    val data = in UInt(88 bits)
    val q = out UInt(88 bits)
  }

  // disable the prefix
  noIoPrefix()
  // specify the tensor core main clock
  mapClockDomain(clock = io.clock)
}