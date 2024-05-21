package intel_ips

import spinal.core._
import spinal.lib._

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

class StreamOutFifo(output_width: Int) extends Component {
  val io = new Bundle {
    val push = slave Stream(UInt(output_width*3 bits))
    val pop = master Stream(UInt(output_width*3 bits))
  }

  val core = new out_fifo(output_width)

  core.setName("FifoCore")
  core.io.data := io.push.payload
  core.io.wrreq := io.push.valid
  io.push.ready := ~core.io.full

  core.io.rdreq := io.pop.ready
  io.pop.valid := ~core.io.empty
  io.pop.payload := core.io.q
}