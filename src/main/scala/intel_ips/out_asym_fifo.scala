package intel_ips

import spinal.core._
import spinal.lib._

class out_asym_fifo(input_width: Int, output_width: Int, depth: Int, id: Int = 0) extends BlackBox {
  addGeneric("IDW", input_width)
  addGeneric("ODW", output_width)
  addGeneric("DEPTH", depth)
  addGeneric("ID", id)

  val io = new Bundle {
    val wr_data = in UInt(input_width bits)
    val wr_en, rd_en = in Bool()
    val clk, rst = in Bool()
    val rd_data = out UInt(output_width bits)
    val wr_ok, rd_ok = out Bool()
    val usedw = out UInt(log2Up(depth) bits)
  }

  noIoPrefix()
  mapClockDomain(clock = io.clk, reset = io.rst)

  addRTLPath(s"./src/main/sverilog/out_asym_fifo.sv")
}

class StreamOutAsymFifo(input_width: Int, output_width: Int) extends Component {
  val io = new Bundle {
    val push = slave Stream(UInt(input_width bits))
    val pop = master Stream(UInt(output_width bits))
  }

  val core = new out_asym_fifo(input_width, output_width, depth=64)

  core.setName("AsymFifoCore")
  core.io.wr_data := io.push.payload
  core.io.wr_en := io.push.valid
  io.push.ready := core.io.wr_ok

  io.pop.payload := core.io.rd_data
  io.pop.valid := core.io.rd_ok
  core.io.rd_en := io.pop.ready
}