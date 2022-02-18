package mylib

import spinal.core._
import spinal.lib._

import config._
import intel_ips._
import util._

class TensorCoreChain(chain_len: Int, out_buf_delay: Int) extends Component {
  val io = new Bundle{
    val dataIn = in Vec(UInt(80 bits), chain_len)
    val loadCascadeIn = in UInt(80 bits)
    val expIn = in Vec(UInt(8 bits), chain_len)
    val expCascadeIn = in UInt(8 bits)
    //data valid and data in should be 1 clock earlier than
    //the first loading because of data load reg and load_buf_sel reg
    val dataValid = in Bool()
    val loadValid = in Bool()
    val loadReady = out Bool()
    val res = out Vec(UInt(24 bits), 3)
    val inputIters = in UInt(8 bits)
    val outValid = out Bool()
  }

  // helper function: connect data in ports
  def connect_data_in(tcIo: TensorCoreBaseInterface, dataIn: UInt): Unit = {
    if (dataIn.getWidth == 80) {
      tcIo.data_in_1 := dataIn(7 downto 0)
      tcIo.data_in_2 := dataIn(15 downto 8)
      tcIo.data_in_3 := dataIn(23 downto 16)
      tcIo.data_in_4 := dataIn(31 downto 24)
      tcIo.data_in_5 := dataIn(39 downto 32)
      tcIo.data_in_6 := dataIn(47 downto 40)
      tcIo.data_in_7 := dataIn(55 downto 48)
      tcIo.data_in_8 := dataIn(63 downto 56)
      tcIo.data_in_9 := dataIn(71 downto 64)
      tcIo.data_in_10 := dataIn(79 downto 72)
    }
  }

  val tcEntry = new tensor_core_entry
  val tcCoreChainElems = new Array[tensor_core](chain_len)
  val tcAccu = new tensor_core_accu

  // loading requires 3 extra cycles, align the valid signal
  // with the first compute core here
  val loadValidD3t = Delay(io.loadValid, 3)
  val loadCounter = Counter(chain_len*3)
  val loadBufCtrlReg = Reg(UInt(2 bits)) init U"2'b01"
  val loadBufCtrl = UInt(2 bits)
  when(loadValidD3t){
    loadCounter.increment()
  }

  when(loadCounter.willOverflow) {
    io.loadReady := True
    loadBufCtrlReg := loadBufCtrlReg.rotateLeft(1)
  } .otherwise {
    io.loadReady := False
  }
  loadBufCtrl := Mux(loadValidD3t, loadBufCtrlReg, U"2'b00")
  //TODO: may need to change this to a dynamic config counter
  val inputCounter = DynaCounter(8, io.inputIters)
  val loadBufSel = Reg(Bool()) init False
  when(io.dataValid) {
    inputCounter.increment()
  }

  when(inputCounter.willOverflow) {
    loadBufSel := !loadBufSel
  }

  //output buffer ctrl logic.
  val oBufferLoadValid = Delay(io.dataValid, 4+2*chain_len)
  //counting the output iterations for output valid
  val outValidCounter = DynaCounter(8, io.inputIters)

  when(oBufferLoadValid.rise()) (outValidCounter.increment())
  io.outValid := outValidCounter.willOverflowIfInc

  connect_data_in(tcEntry.io, io.loadCascadeIn)
  tcEntry.io.shared_exponent_data := io.expCascadeIn
  tcEntry.io.feed_sel <> U"2'd0"
  tcEntry.io.load_buf_sel <> loadBufSel
  tcEntry.io.load_bb_one <> True
  tcEntry.io.load_bb_two <> False
  tcEntry.io.side_in_1 <> U"8'd0"
  tcEntry.io.side_in_2 <> U"8'd0"

  tcCoreChainElems(0) = new tensor_core
  connect_data_in(tcCoreChainElems(0).io, io.dataIn(0))
  tcCoreChainElems(0).io.shared_exponent_data <> io.expIn(0)
  tcCoreChainElems(0).io.cascade_weight_in <> tcEntry.io.cascade_weight_out
  tcCoreChainElems(0).io.zero_en <> False
  tcCoreChainElems(0).io.acc_en <> False
  tcCoreChainElems(0).io.load_buf_sel <> loadBufSel
  tcCoreChainElems(0).io.load_bb_one <> loadBufCtrl(0)
  tcCoreChainElems(0).io.load_bb_two <> loadBufCtrl(1)
  tcCoreChainElems(0).io.side_in_1 <> U"8'd0"
  tcCoreChainElems(0).io.side_in_2 <> U"8'd0"
  tcCoreChainElems(0).io.cascade_data_in_col_1 <> tcEntry.io.cascade_data_out_col_1
  tcCoreChainElems(0).io.cascade_data_in_col_2 <> tcEntry.io.cascade_data_out_col_2
  tcCoreChainElems(0).io.cascade_data_in_col_3 <> tcEntry.io.cascade_data_out_col_3
  tcCoreChainElems(0).io.feed_sel <> U"2'd1"

  for (i <- 1 until chain_len) {
    tcCoreChainElems(i) = new tensor_core
    // TODO: suspecious parameter i*2
    connect_data_in(tcCoreChainElems(i).io, Delay(io.dataIn(i), i*2))
    tcCoreChainElems(i).io.shared_exponent_data <> Delay(io.expIn(i), i)
    tcCoreChainElems(i).io.cascade_data_in_col_1 <> tcCoreChainElems(i-1).io.cascade_data_out_col_1
    tcCoreChainElems(i).io.cascade_data_in_col_2 <> tcCoreChainElems(i-1).io.cascade_data_out_col_2
    tcCoreChainElems(i).io.cascade_data_in_col_3 <> tcCoreChainElems(i-1).io.cascade_data_out_col_3
    tcCoreChainElems(i).io.cascade_weight_in <> tcCoreChainElems(i-1).io.cascade_weight_out
    tcCoreChainElems(i).io.zero_en <> False
    tcCoreChainElems(i).io.acc_en <> False
    tcCoreChainElems(i).io.load_buf_sel <> loadBufSel
    tcCoreChainElems(i).io.load_bb_one <> loadBufCtrl(0)
    tcCoreChainElems(i).io.load_bb_two <> loadBufCtrl(1)
    tcCoreChainElems(i).io.feed_sel := U"2'd1"
    tcCoreChainElems(i).io.side_in_1 <> U"8'd0"
    tcCoreChainElems(i).io.side_in_2 <> U"8'd0"
  }

  val oBuffer = Vec(Reg(UInt(24 bits)) init 0, 3)
  //output buffer writing control
  when (oBufferLoadValid) {
    oBuffer(0) := tcAccu.io.bf24_col_1
    oBuffer(1) := tcAccu.io.bf24_col_2
    oBuffer(2) := tcAccu.io.bf24_col_3
  } otherwise (oBuffer := Vec(U"24'd0", 3))

  tcAccu.io.bf24_a1 := Delay(oBuffer(0), out_buf_delay-1)
  tcAccu.io.bf24_a2 := Delay(oBuffer(1), out_buf_delay-1)
  tcAccu.io.bf24_a3 := Delay(oBuffer(2), out_buf_delay-1)
  tcAccu.io.cascade_data_in_col_1 <> tcCoreChainElems(chain_len-1).io.cascade_data_out_col_1
  tcAccu.io.cascade_data_in_col_2 <> tcCoreChainElems(chain_len-1).io.cascade_data_out_col_2
  tcAccu.io.cascade_data_in_col_3 <> tcCoreChainElems(chain_len-1).io.cascade_data_out_col_3
  tcAccu.io.zero_en := False
  tcAccu.io.acc_en := False

  io.res <> oBuffer

}

object TensorCoreChainGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generate(new TensorCoreChain(3, 3)).printPruned()
  }
}
