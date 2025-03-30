package mvm

import spinal.core._
import spinal.lib._
import intel_ips.spram_megafunc
import scala.collection.mutable.ArrayBuffer

case class AsymBufferN2One(bitwidth: Int,
                           num_in_words: Int,
                           wr_depth: Int,
                           folding_factor: Int,
                           megfunc_type: String = "MLAB") extends Component {
  val io = new Bundle {
    val wrAddr = in UInt(log2Up(wr_depth) bits)
    val dataIn = in Vec(UInt(bitwidth bits), num_in_words)
    val dataOut = out UInt(bitwidth bits)
    val wrEn, rdEn = in Bool()
  }

  val asymBufferCore = Array.fill(num_in_words)(new spram_megafunc(bitwidth, wr_depth, megfunc_type))
  val rdSel = Counter(num_in_words)
  val asymBufferRd = Counter(wr_depth)

  when(io.rdEn) {rdSel.increment()}
  when(rdSel === (num_in_words - log2Up(num_in_words) + 1) && rdSel.willIncrement) {
    asymBufferRd.increment()
  }

  for (coreIdx <- asymBufferCore.indices) {
    asymBufferCore(coreIdx).io.data := io.dataIn(coreIdx)
    asymBufferCore(coreIdx).io.wren := io.wrEn
    asymBufferCore(coreIdx).io.wraddress := io.wrAddr
    asymBufferCore(coreIdx).io.rdaddress := asymBufferRd.value
  }

  val rdEnDelayed = History(io.rdEn, log2Up(asymBufferCore.length) + 1)
  val selAddrBuffer = History(rdSel.value, log2Up(asymBufferCore.length))
  val inputVec = Vec(for(buf <- asymBufferCore) yield (buf.io.q))


  def stage(elements: Vec[UInt], level: Int): UInt = {
    if (elements.length == 1) return elements.head
    val logicCount = (elements.length + 1) / 2
    val stageLogic = Vec(UInt(elements.head.getWidth bits), logicCount)

    for (i <- 0 until logicCount) {
      val muxSelRes = Reg(UInt(elements.head.getWidth bits), init=U(0))
      when(rdEnDelayed(level)) {
        if (i * 2 + 1 < elements.length)
          muxSelRes := Mux(selAddrBuffer(level)(level), elements(i * 2 + 1), elements(i * 2))
        else
          muxSelRes := elements(i * 2)
      }

      stageLogic(i) := muxSelRes
    }
    stage(stageLogic, level + 1)
  }

  val muxRes: UInt = stage(inputVec, 0)

  io.dataOut := muxRes
}