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
  val tcStartPoint = new tensor_core_start
  val tcCoreChainElems = new Array[tensor_core](chain_len-1)
  val tcAccu = new tensor_core_accu
  
  // loading requires 3 extra cycles, align the valid signal
  // with the first compute core here
  val loadValidD3t = Delay(io.loadValid, 3, init=False)
  // 2 cycle delay valid signal for loading selection
  val loadValidD2t = Delay(io.loadValid, 2, init=False)
  val loadCounter, loadSelCounter = Counter(chain_len*3)
  val loadBufCtrlReg = Reg(UInt(2 bits)) init U"2'b01"
  val loadBufCtrl = UInt(2 bits)
  when(loadValidD3t) {loadCounter.increment()}
  when(loadValidD2t) {loadSelCounter.increment()}


  when(loadSelCounter.willOverflow) {
    loadBufCtrlReg := loadBufCtrlReg.rotateLeft(1)
  }
  loadBufCtrl := Mux(loadValidD2t, loadBufCtrlReg, U"2'b00")
  io.loadReady := loadCounter.willOverflow
  
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
  // delayed output valid: 4c of dot lat,3c of accu lat and 2*(chain_len-1)
  // of input delay on the last stage of the chain
  val oBufferLoadValid = Delay(io.dataValid, 2*(chain_len-1)+4+3-1, init=False)
  //counting the output iterations for output valid
  val outValidCounter = DynaCounter(8, io.inputIters)

  when(oBufferLoadValid) (outValidCounter.increment())
  io.outValid := outValidCounter.willOverflow

  connect_data_in(tcEntry.io, io.loadCascadeIn)
  tcEntry.io.shared_exponent_data := io.expCascadeIn
  tcEntry.io.feed_sel <> U"2'd0"
  tcEntry.io.load_buf_sel <> loadBufSel
  tcEntry.io.load_bb_one <> True
  tcEntry.io.load_bb_two <> False
  tcEntry.io.side_in_1 <> U"8'd0"
  tcEntry.io.side_in_2 <> U"8'd0"

  connect_data_in(tcStartPoint.io, io.dataIn(0))
  tcStartPoint.io.shared_exponent_data <> io.expIn(0)
  tcStartPoint.io.cascade_weight_in <> tcEntry.io.cascade_weight_out
  tcStartPoint.io.load_buf_sel <> loadBufSel
  tcStartPoint.io.load_bb_one <> loadBufCtrl(0)
  tcStartPoint.io.load_bb_two <> loadBufCtrl(1)
  tcStartPoint.io.side_in_1 <> U"8'h0"
  tcStartPoint.io.side_in_2 <> U"8'h0"
  tcStartPoint.io.feed_sel <> U"2'd1"

  for (i <- 0 until chain_len-1) {
    tcCoreChainElems(i) = new tensor_core
    // TODO: suspecious parameter i*2
	val delayedDataIn = Delay(io.dataIn(i+1), 2*(i+1), init=U(0, io.dataIn(i+1).getWidth bits))
    connect_data_in(tcCoreChainElems(i).io, delayedDataIn)
	val delayedExpIn = Delay(io.expIn(i+1), 2*(i+1), init=U(0, io.expIn(i+1).getWidth bits))
    tcCoreChainElems(i).io.shared_exponent_data <> delayedExpIn
	if (i == 0) {
		tcCoreChainElems(i).io.cascade_data_in_col_1 <> tcStartPoint.io.cascade_data_out_col_1
		tcCoreChainElems(i).io.cascade_data_in_col_2 <> tcStartPoint.io.cascade_data_out_col_2
		tcCoreChainElems(i).io.cascade_data_in_col_3 <> tcStartPoint.io.cascade_data_out_col_3
		tcCoreChainElems(i).io.cascade_weight_in <> tcStartPoint.io.cascade_weight_out
	} else {
		tcCoreChainElems(i).io.cascade_data_in_col_1 <> tcCoreChainElems(i-1).io.cascade_data_out_col_1
		tcCoreChainElems(i).io.cascade_data_in_col_2 <> tcCoreChainElems(i-1).io.cascade_data_out_col_2
		tcCoreChainElems(i).io.cascade_data_in_col_3 <> tcCoreChainElems(i-1).io.cascade_data_out_col_3
		tcCoreChainElems(i).io.cascade_weight_in <> tcCoreChainElems(i-1).io.cascade_weight_out
	}
    tcCoreChainElems(i).io.zero_en <> False
    tcCoreChainElems(i).io.acc_en <> False
    tcCoreChainElems(i).io.load_buf_sel <> loadBufSel
    tcCoreChainElems(i).io.load_bb_one <> loadBufCtrl(0)
    tcCoreChainElems(i).io.load_bb_two <> loadBufCtrl(1)
    tcCoreChainElems(i).io.feed_sel := U"2'd1"
    tcCoreChainElems(i).io.side_in_1 <> U"8'd0"
    tcCoreChainElems(i).io.side_in_2 <> U"8'd0"
  }
  
  tcAccu.io.bf24_a1 := Delay(tcAccu.io.bf24_col_1, out_buf_delay, init=U(0, 24 bits))
  tcAccu.io.bf24_a2 := Delay(tcAccu.io.bf24_col_2, out_buf_delay, init=U(0, 24 bits))
  tcAccu.io.bf24_a3 := Delay(tcAccu.io.bf24_col_3, out_buf_delay, init=U(0, 24 bits))
  tcAccu.io.cascade_data_in_col_1 <> tcCoreChainElems(chain_len-2).io.cascade_data_out_col_1
  tcAccu.io.cascade_data_in_col_2 <> tcCoreChainElems(chain_len-2).io.cascade_data_out_col_2
  tcAccu.io.cascade_data_in_col_3 <> tcCoreChainElems(chain_len-2).io.cascade_data_out_col_3
  tcAccu.io.zero_en := False
  tcAccu.io.acc_en := False

  io.res(0) <> tcAccu.io.bf24_col_1
  io.res(1) <> tcAccu.io.bf24_col_2 
  io.res(2) <> tcAccu.io.bf24_col_3

}

object TensorCoreChainGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generate(new TensorCoreChain(3, 9-3)).printPruned()
  }
}
