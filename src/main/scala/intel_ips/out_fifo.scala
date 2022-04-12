package intel_ips

import spinal.core._

class out_fifo extends BlackBox {
  val io = new Bundle {
    val clock = in Bool()
    val wrreq, rdreq = in Bool()
    val full, empty = out Bool()
    val data = in UInt(432 bits)
    val q = out UInt(432 bits)
  }

  // disable the prefix
  noIoPrefix()
  // specify the tensor core main clock
  mapClockDomain(clock = io.clock)
}