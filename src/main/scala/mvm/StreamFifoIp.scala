package mvm

import intel_ips.scfifo
import spinal.core._
import spinal.lib._

class StreamFifoIp[T <: Data](val dataType: HardType[T],
                              val depth: Int,
                              val ram_type: String,
                              val afull_thres: Int = -1) extends Component {
  val io = new Bundle {
    val push = slave Stream(dataType)
    val pop = master Stream(dataType)
    val almostFull = out Bool()
  }

  val fifo_dwidth = dataType.getBitsWidth

  val core = new scfifo(fifo_dwidth, depth, ram_type, afull_thres = afull_thres)

  core.setName("FifoCore")
  core.io.data := io.push.payload.asBits
  core.io.wrreq := io.push.valid
  io.push.ready := ~core.io.full

  core.io.rdreq := io.pop.ready
  io.pop.valid := ~core.io.empty
  io.pop.payload.assignFromBits(core.io.q)
  io.almostFull := core.io.almost_full

  core.io.aclr.clear()
}