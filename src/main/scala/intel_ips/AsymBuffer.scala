package intel_ips

import spinal.core._
import spinal.lib._

case class AsymBufferN2One(bitwidth: Int,
                 num_in_words: Int,
                 wr_depth: Int, folding_factor: Int) extends Component {
  val io = new Bundle {
    val wrAddr = in UInt(log2Up(wr_depth) bits)
    val dataIn = in Vec(UInt(bitwidth bits), num_in_words)
    val rdAddr = in UInt(log2Up(num_in_words * wr_depth) bits)
    val dataOut = out UInt(bitwidth bits)
    val wrEn = in Bool()
  }

  val asymBufferCore = Array.fill(num_in_words)(new spram_megafunc(bitwidth, wr_depth))
  for (coreIdx <- asymBufferCore.indices) {
    asymBufferCore(coreIdx).io.data := io.dataIn(coreIdx)
    asymBufferCore(coreIdx).io.wren := io.wrEn
    asymBufferCore(coreIdx).io.wraddress := io.wrAddr
    asymBufferCore(coreIdx).io.rdaddress := io.rdAddr(log2Up(wr_depth)-1 downto 0)
  }
  io.dataOut := io.rdAddr(log2Up(num_in_words * wr_depth)-1 downto log2Up(wr_depth))
    .muxListDc(for (idx <- asymBufferCore.indices) yield (idx, asymBufferCore(idx).io.q))
}

class spram_megafunc(bitwidth: Int, depth: Int) extends BlackBox {
  val io = new Bundle {
    val clock = in Bool()
    val wren = in Bool()
    val rdaddress = in UInt(log2Up(depth) bits)
    val wraddress =  in UInt(log2Up(depth) bits)
    val data = in UInt(bitwidth bits)
    val q = out UInt(bitwidth bits)
  }

  // disable the prefix
  noIoPrefix()
  mapClockDomain(clock = io.clock)

  addGenerics(

  )
  addRTLPath("./src/main/sverilog/spram_megafunc.v")
}