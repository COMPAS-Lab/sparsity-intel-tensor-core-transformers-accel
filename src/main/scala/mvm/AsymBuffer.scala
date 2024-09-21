package mvm

import spinal.core._
import spinal.lib._
import intel_ips.spram_megafunc

case class AsymBufferN2One(bitwidth: Int,
                           num_in_words: Int,
                           wr_depth: Int,
                           folding_factor: Int,
                           megfunc_type: String = "spram") extends Component {
  val io = new Bundle {
    val wrAddr = in UInt(log2Up(wr_depth) bits)
    val dataIn = in Vec(UInt(bitwidth bits), num_in_words)
    val rdAddr = in UInt(log2Up(num_in_words * wr_depth) bits)
    val dataOut = out UInt(bitwidth bits)
    val wrEn = in Bool()
  }

  val asymBufferCore = Array.fill(num_in_words)(new spram_megafunc(bitwidth, wr_depth, "MLAB"))
  for (coreIdx <- asymBufferCore.indices) {
    asymBufferCore(coreIdx).io.data := io.dataIn(coreIdx)
    asymBufferCore(coreIdx).io.wren := io.wrEn
    asymBufferCore(coreIdx).io.wraddress := io.wrAddr
    asymBufferCore(coreIdx).io.rdaddress := io.rdAddr(log2Up(wr_depth) - 1 downto 0)
  }
  io.dataOut := io.rdAddr(log2Up(num_in_words * wr_depth) - 1 downto log2Up(wr_depth))
    .muxListDc(for (idx <- asymBufferCore.indices) yield (idx, asymBufferCore(idx).io.q))

//  if (megfunc_type == "spram") {
//    val asymBufferCore = Array.fill(num_in_words)(new spram_megafunc(bitwidth, wr_depth))
//    for (coreIdx <- asymBufferCore.indices) {
//      asymBufferCore(coreIdx).io.data := io.dataIn(coreIdx)
//      asymBufferCore(coreIdx).io.wren := io.wrEn
//      asymBufferCore(coreIdx).io.wraddress := io.wrAddr
//      asymBufferCore(coreIdx).io.rdaddress := io.rdAddr(log2Up(wr_depth) - 1 downto 0)
//    }
//    io.dataOut := io.rdAddr(log2Up(num_in_words * wr_depth) - 1 downto log2Up(wr_depth))
//      .muxListDc(for (idx <- asymBufferCore.indices) yield (idx, asymBufferCore(idx).io.q))
//  } else if (megfunc_type == "qpram") {
//    val num_qprams: Int = num_in_words / 2
//    val num_sprams: Int = num_in_words - num_qprams * 2
//
//    val asymBufferCoreQprams = Array.fill(num_qprams)(new qpram_megafunc(bitwidth, wr_depth*2))
//    val bufferCoreOuts = Vec(UInt(bitwidth bits), num_in_words)
//    for (qpIdx <- asymBufferCoreQprams.indices) {
//      asymBufferCoreQprams(qpIdx).io.data_a := io.dataIn(qpIdx * 2)
//      asymBufferCoreQprams(qpIdx).io.data_b := io.dataIn(qpIdx * 2 + 1)
//      asymBufferCoreQprams(qpIdx).io.wren_a := io.wrEn
//      asymBufferCoreQprams(qpIdx).io.wren_b := io.wrEn
//      asymBufferCoreQprams(qpIdx).io.write_address_a := U"1'b0" @@ io.wrAddr
//      asymBufferCoreQprams(qpIdx).io.write_address_b := U"1'b1" @@ io.wrAddr
//      asymBufferCoreQprams(qpIdx).io.read_address_a := U"1'b0" @@ io.rdAddr(log2Up(wr_depth) - 1 downto 0)
//      asymBufferCoreQprams(qpIdx).io.read_address_b := U"1'b1" @@ io.rdAddr(log2Up(wr_depth) - 1 downto 0)
//      bufferCoreOuts(qpIdx * 2) := asymBufferCoreQprams(qpIdx).io.q_a
//      bufferCoreOuts(qpIdx * 2 + 1) := asymBufferCoreQprams(qpIdx).io.q_b
//    }
//
//    if (num_sprams > 0) {
//      val asymBufferCoreSpram = new spram_megafunc(bitwidth, wr_depth)
//      asymBufferCoreSpram.io.data := io.dataIn.last
//      asymBufferCoreSpram.io.wren := io.wrEn
//      asymBufferCoreSpram.io.wraddress := io.wrAddr
//      asymBufferCoreSpram.io.rdaddress := io.rdAddr(log2Up(wr_depth) - 1 downto 0)
//      bufferCoreOuts.last := asymBufferCoreSpram.io.q
//    }
//
//    io.dataOut := io.rdAddr(log2Up(num_in_words * wr_depth) - 1 downto log2Up(wr_depth))
//      .muxListDc(for (idx <- bufferCoreOuts.indices) yield (idx, bufferCoreOuts(idx)))
//  }
}