package mvm

import intel_ips.scfifo
import spinal.core._
import spinal.lib._

class StreamOutFifo(output_width: Int,
                    depth: Int,
                    ram_type: String) extends Component {
  val io = new Bundle {
    val push = slave Stream(UInt(output_width bits))
    val pop = master Stream(UInt(output_width bits))
    val almostFull = out Bool()
  }

  val core = new scfifo(output_width, depth, ram_type, afull_thres = (depth / 5 * 4).toInt)

  core.setName("FifoCore")
  core.io.data := io.push.payload
  core.io.wrreq := io.push.valid
  io.push.ready := ~core.io.full

  core.io.rdreq := io.pop.ready
  io.pop.valid := ~core.io.empty
  io.pop.payload := core.io.q
  io.almostFull := core.io.almost_full

  core.io.aclr.clear()
  core.io.sclr.clear()

}