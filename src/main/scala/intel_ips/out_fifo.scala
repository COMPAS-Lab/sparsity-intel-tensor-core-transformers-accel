package intel_ips

import spinal.core._

class out_fifo(output_width: Int) extends BlackBox {
  val io = new Bundle {
    val clock = in Bool()
    val wrreq, rdreq = in Bool()
    val full, empty = out Bool()
    val data = in UInt(output_width*3 bits)
    val q = out UInt(output_width*3 bits)
  }

  // disable the prefix
  noIoPrefix()
  // specify the tensor core main clock
  mapClockDomain(clock = io.clock)
}