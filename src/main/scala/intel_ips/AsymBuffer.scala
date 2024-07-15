package intel_ips

import spinal.core._

case class AsymBuffer(bitwidth: Int,
                 num_in_words: Int,
                 num_out_words: Int,
                 wr_depth: Int) extends Component {
  val io = new Bundle {
    val wrAddr = in UInt(log2Up(wr_depth) bits)
    val dataIn = in Vec(UInt(bitwidth bits), num_in_words)
    val rdAddr = in UInt(log2Up(num_in_words * wr_depth / num_out_words) bits)
    val dataOut = out Vec(UInt(bitwidth bits), num_out_words)
    val wrEn = in Bool()
  }

  val asymBufferCore = new asym_buffer
  asymBufferCore.io.wren := io.wrEn
  asymBufferCore.io.data := io.dataIn.as(UInt(bitwidth * num_in_words bits))
  asymBufferCore.io.wraddress := io.wrAddr
  asymBufferCore.io.rdaddress := io.rdAddr
  io.dataOut := asymBufferCore.io.q.subdivideIn(bitwidth bits)
}

class asym_buffer extends BlackBox {
  val io = new Bundle {
    val clock = in Bool()
    val wren = in Bool()
    val rdaddress = in UInt(6 bits)
    val wraddress =  in UInt(1 bits)
    val data = in UInt(2816 bits)
    val q = out UInt(88 bits)
  }

  // disable the prefix
  noIoPrefix()
  mapClockDomain(clock = io.clock)
  addRTLPath("./src/main/sverilog/asym_buffer.v")
}