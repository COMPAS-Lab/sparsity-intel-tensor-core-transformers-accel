package mylib

import spinal.core._
import spinal.lib._

import config._
import intel_ips._
import intel_ips.TensorCoreType._

class TensorCoreChain(chain_len: Int, out_buf_delay: Int) extends Component {
  val io = new Bundle{
    val dataIn = in Vec(UInt(80 bits), chain_len)
    val loadCascadeIn = in UInt(80 bits)
    val expIn = in Vec(UInt(8 bits), chain_len)
    val expCascadeIn = in UInt(8 bits)
    //data valid and data in should be 1 clock earlier than
    //the first loading because of data load reg and load_buf_sel reg
    val data_valid = in Bool()
    val load_valid = in Bool()
    val load_ready = out Bool()
    val res = out Vec(UInt(24 bits), 3)
  }

  // helper function: connect data in ports
  def connect_data_in(tc: tensor_core, dataIn: UInt): Unit = {
    if (dataIn.getWidth == 80) {
      tc.io.data_in_1 := dataIn(7 downto 0)
      tc.io.data_in_2 := dataIn(15 downto 8)
      tc.io.data_in_3 := dataIn(23 downto 16)
      tc.io.data_in_4 := dataIn(31 downto 24)
      tc.io.data_in_5 := dataIn(39 downto 32)
      tc.io.data_in_6 := dataIn(47 downto 40)
      tc.io.data_in_7 := dataIn(55 downto 48)
      tc.io.data_in_8 := dataIn(63 downto 56)
      tc.io.data_in_9 := dataIn(71 downto 64)
      tc.io.data_in_10 := dataIn(79 downto 72)
    }
  }

  val tcEntry = new tensor_core
  val tcCoreChainElems = new Array[tensor_core](chain_len)
  val tcAccu = new tensor_core_accu_24

  val loadCounter = Counter((chain_len+1)*3)
  val loadBufCtrlReg = Reg(UInt(2 bits)) init U"2'b01"
  val loadBufCtrl = UInt(2 bits)
  when(io.load_valid){
    loadCounter.increment()
  }

  when(loadCounter.willOverflow) {
    io.load_ready := True
    loadBufCtrlReg := loadBufCtrlReg.rotateLeft(1)
  } .otherwise {
    io.load_ready := False
  }
  loadBufCtrl := Mux(io.load_valid, loadBufCtrlReg, U"2'b00")
  //TODO: may need to change this to a dynamic config counter
  val inputCounter = Counter((chain_len+1)*3)
  val loadBufSel = Reg(Bool()) init False
  when(io.data_valid) {
    inputCounter.increment()
  }

  when(inputCounter.willOverflow) {
    loadBufSel := !loadBufSel
  }

  //output buffer ctrl logic
  val oBufferLoadValid = Delay(io.data_valid, 4+2*chain_len)

  connect_data_in(tcEntry, io.loadCascadeIn)
  tcEntry.io.shared_exponent_data := io.expCascadeIn
  tcEntry.io.feed_sel <> U"2'd0"
  tcEntry.io.load_buf_sel <> loadBufSel
  tcEntry.io.load_bb_one <> loadBufCtrl(0)
  tcEntry.io.load_bb_two <> loadBufCtrl(1)
  tcEntry.io.cascade_weight_in <> U"88'd0"
  tcEntry.io.side_in_1 <> U"8'd0"
  tcEntry.io.side_in_2 <> U"8'd0"
  tcEntry.io.cascade_data_in_col_1 <> U"32'd0"
  tcEntry.io.cascade_data_in_col_2 <> U"32'd0"
  tcEntry.io.cascade_data_in_col_3 <> U"32'd0"
  tcEntry.io.acc_en <> False
  tcEntry.io.zero_en <> False

  tcCoreChainElems(0) = new tensor_core
  connect_data_in(tcCoreChainElems(0), io.dataIn(0))
  tcCoreChainElems(0).io.shared_exponent_data <> io.expIn(0)
  tcCoreChainElems(0).io.cascade_weight_in <> tcEntry.io.cascade_weight_out
  tcCoreChainElems(0).io.zero_en <> False
  tcCoreChainElems(0).io.acc_en <> False
  tcCoreChainElems(0).io.load_buf_sel <> loadBufSel
  tcCoreChainElems(0).io.load_bb_one <> loadBufCtrl(0)
  tcCoreChainElems(0).io.load_bb_two <> loadBufCtrl(1)
  tcCoreChainElems(0).io.side_in_1 <> U"8'd0"
  tcCoreChainElems(0).io.side_in_2 <> U"8'd0"
  tcCoreChainElems(0).io.cascade_data_in_col_1 <> U"32'd0"
  tcCoreChainElems(0).io.cascade_data_in_col_2 <> U"32'd0"
  tcCoreChainElems(0).io.cascade_data_in_col_3 <> U"32'd0"
  tcCoreChainElems(0).io.feed_sel <> U"2'd2"

  for (i <- 1 until chain_len) {
    tcCoreChainElems(i) = new tensor_core
    connect_data_in(tcCoreChainElems(i), Delay(io.dataIn(i), i*2))
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
    // TODO: take care of the feed sel: this is just a modification
    tcCoreChainElems(i).io.feed_sel := U"2'd2"
    tcCoreChainElems(i).io.side_in_1 <> U"8'd0"
    tcCoreChainElems(i).io.side_in_2 <> U"8'd0"
  }

  val oBuffer = Vec(Reg(UInt(24 bits)) init 0, 3)
  //output buffer writting control
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

  io.res(0) <> tcAccu.io.bf24_col_1
  io.res(1) <> tcAccu.io.bf24_col_2
  io.res(2) <> tcAccu.io.bf24_col_3

}

object TensorCoreChainGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generate(new TensorCoreChain(3, 3)).printPruned()
  }
}
