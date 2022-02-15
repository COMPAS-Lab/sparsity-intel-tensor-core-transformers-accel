package intel_ips

import spinal.core._
import spinal.lib._
import spinal.lib.experimental.math._
import util._
import intel_ips._

object TensorCoreType extends Enumeration {
  type TensorCoreType = Value
  val ENTRY, CHAIN, ACCU = Value
}

import intel_ips.TensorCoreType._

class TensorCoreInterface extends Bundle {
  val clk = in Bool()
  // data input port
  val data_in_1, data_in_2, data_in_3, data_in_4, data_in_5,
  data_in_6, data_in_7, data_in_8, data_in_9, data_in_10 = in UInt(8 bits)
  // exponent port
  val shared_exponent_data = in UInt(8 bits)
  // control ports
  // feed selection: 0: select data in to buffers;
  // 2: select load cascade in to buffers
  val feed_sel = in UInt(2 bits)
  // select one bank of the buffers to load
  val load_bb_one, load_bb_two = in Bool()
  // select one bank of the buffers as the input of DOT
  val load_buf_sel = in Bool()
  val zero_en, acc_en = in Bool()
  // cascade data input port for the accumulator
  val cascade_data_in_col_1, cascade_data_in_col_2, cascade_data_in_col_3 = in UInt(32 bits)
  val cascade_data_out_col_1, cascade_data_out_col_2, cascade_data_out_col_3 = out UInt(32 bits)
  // cascade load chain ports
  val cascade_weight_in = in UInt(88 bits)
  val cascade_weight_out = out UInt(88 bits)
  // output port
  val bf24_col_1, bf24_col_2, bf24_col_3 = out UInt(24 bits)
}

class tensor_core extends BlackBox {
  val io = new TensorCoreInterface

  // disable the prefix
  noIoPrefix()
  mapClockDomain(clock = io.clk)
}

class tensor_core_accu_24 extends BlackBox {
  val io = new Bundle {
    val clk, acc_en, zero_en = in Bool()
    val bf24_a1, bf24_a2, bf24_a3 = in UInt(24 bits)
    val cascade_data_in_col_1, cascade_data_in_col_2, cascade_data_in_col_3 =
      in UInt(32 bits)
    val bf24_col_1, bf24_col_2, bf24_col_3 = out UInt(24 bits)
    val cascade_data_out_col_1, cascade_data_out_col_2, cascade_data_out_col_3 =
      out UInt(32 bits)
  }

  noIoPrefix()
  mapClockDomain(clock = io.clk)
}

class TensorCoreBehavioral(tc_type: TensorCoreType) extends Component{
  val io = new TensorCoreInterface

  //disable the prefix
  noIoPrefix()
  // specify the tensor core main clock
//  val tcClockDomain = ClockDomain.internal(
//    name = "tc",
//    withClockEnable = true,
//    withReset = true,
//    config = ClockDomainConfig(clockEdge = RISING, resetKind = ASYNC)
//  )
//  tcClockDomain.clock := io.labclk(0)
//  tcClockDomain.reset := io.lsim_nclr(0)
//  tcClockDomain.clockEnable := io.lsim_ce

  // helper functions
  def combineArray(in: Vec[UInt]): UInt ={
    val wordWidth = in(0).getBitsWidth
    val res = UInt(wordWidth * in.size bits)
    for (slice <- 0 until in.size) {
      res((slice + 1) * wordWidth-1 downto slice * wordWidth) := in(slice)
    }
    res
  }

  def treeSum(in: Vec[UInt]): UInt = {
    //only for size as 10
    assert(in.size == 10)
    val stg1Res = Vec(UInt(in(0).getWidth+1 bits), 5)
    for (i <- 0 until 5) stg1Res(i) := in(i*2) +^ in(i*2+1)
    val stg2Res = Vec(UInt((stg1Res(0).getWidth+1 bits)), 2)
    for (i <- 0 until 2) stg2Res(i) := stg1Res(i*2) +^ in(i*2+1)
    val stg3Res = UInt(stg2Res(0).getWidth+1 bits)
    stg3Res := stg2Res(0) +^ stg2Res(1)
    val ret = UInt(20 bits)
    ret := stg3Res +^ stg1Res(4).resize(stg3Res.getWidth)
    ret
  }

  def fxp2FP(mant: UInt, exp: UInt): Bits = {
    //detect pos or neg
    val mantCompliment = Mux(mant.msb, ~mant + U"20'd1", mant)
    val ldZeros = LeadingZeros(mantCompliment.asBits)
    print(s"shifting ${ldZeros.getWidth}...")
    val finalMant = UInt(23 bits) clearAll()
    finalMant(22 downto 23-20) := (mantCompliment |<< (ldZeros+1))
    val finalExp = UInt((8 bits))
//    finalExp := U"8'd19" - ldZeros + exp +127
    finalExp := exp
    val ret = Bits(32 bits)
    ret := B(mant.msb, finalExp, finalMant)
    return ret
  }

  def directAssignFp(bitstream: Bits): Floating = {
    val fp = Floating32()
    fp.sign := bitstream.msb
    fp.mantissa := bitstream(0, 23 bits)
    fp.exponent := bitstream(23, 8 bits)
    fp
  }

  //2 banks of 8-bit weight buffer, each has 10 mant and 1 exp
  val wBufferBank0 = Vec(Vec(Reg(UInt(8 bits)) init 0, 10), 3)
  val wBufferBank1 = Vec(Vec(Reg(UInt(8 bits)) init 0, 10), 3)
  val eBufferBank0 = Vec(Reg(UInt(8 bits)) init 0, 3)
  val eBufferBank1 = Vec(Reg(UInt(8 bits)) init 0, 3)

  val selectedLoad = Vec(UInt(8 bits), 10)
  val selectedExp = UInt(8 bits)

  //combining data in
  val data_in = Vec(UInt(8 bits), 10)
  data_in(0) := io.data_in_1
  data_in(1) := io.data_in_2
  data_in(2) := io.data_in_3
  data_in(3) := io.data_in_4
  data_in(4) := io.data_in_5
  data_in(5) := io.data_in_6
  data_in(6) := io.data_in_7
  data_in(7) := io.data_in_8
  data_in(8) := io.data_in_9
  data_in(9) := io.data_in_10

  //selecting weights loading
  when(io.load_bb_one) {
    for (i <- 0 until 10) {
      wBufferBank0(0)(i) := selectedLoad(i)
      wBufferBank0(1)(i) := wBufferBank0(0)(i)
      wBufferBank0(2)(i) := wBufferBank0(1)(i)
    }
    eBufferBank0(0) := selectedExp
    eBufferBank0(1) := eBufferBank0(0)
    eBufferBank0(2) := eBufferBank0(1)
  }

  when(io.load_bb_two) {
    for (i <- 0 until 10) {
      wBufferBank1(0)(i) := selectedLoad(i)
      wBufferBank1(1)(i) := wBufferBank1(0)(i)
      wBufferBank1(2)(i) := wBufferBank1(1)(i)
    }
    eBufferBank1(0) := selectedExp
    eBufferBank1(1) := eBufferBank1(0)
    eBufferBank1(2) := eBufferBank1(1)
  }
  //cascade output selection
  val casOutSel = io.load_bb_one ## io.load_bb_two
  switch (casOutSel) {
    is(B"2'b01") {
      io.cascade_weight_out(79 downto 0) := combineArray(wBufferBank1(2))
      io.cascade_weight_out(87 downto 80) := eBufferBank1(2)
    }
    is(B"2'b10") {
      io.cascade_weight_out(79 downto 0) := combineArray(wBufferBank0(2))
      io.cascade_weight_out(87 downto 80) := eBufferBank0(2)
    }
    default{
      io.cascade_weight_out := 0
    }
  }

  //input selection
  switch(io.feed_sel){
    is(U"2'd0") {
      selectedLoad := data_in
      selectedExp := io.shared_exponent_data
    }
    is(U"2'd1") {
      selectedLoad.foreach(_ := U"8'd0")
      selectedExp := 0
    }
    is (U"2'd2") {
      selectedLoad := io.cascade_weight_in(79 downto 0).subdivideIn(8 bits)
      selectedExp := io.cascade_weight_in(87 downto 80)
    }
    default {
      selectedLoad.foreach(_ := U"8'd0")
      selectedExp := 0
    }
  }

  //compute path
  val dataInReg = Vec(Reg(UInt(8 bits)) init 0, 10)
  dataInReg := data_in
  val bufSelReg = RegNext(io.load_buf_sel) init false
  val expInReg = RegNext(io.shared_exponent_data) init 0

  //assign one cycle delay for dot
  val dotMultOut = Vec(Vec(Reg(UInt(16 bits)) init 0, 10), 3)
  //and one cycle for reduction
  val dotReduceOut = Vec(Reg(UInt(20 bits)) init 0, 3)
  val dotMultWeiIn = Vec(Vec(UInt(8 bits), 10), 3)
  //output of the exp sum
  val expOut = Vec(Reg(UInt(8 bits)) init 0, 3)
  //selected exp from one of the exp banks
  val expSumIn = Vec(UInt(8 bits), 3)

  dotMultWeiIn := Mux(bufSelReg, wBufferBank1, wBufferBank0)
  expSumIn := Mux(bufSelReg, eBufferBank1, eBufferBank0)
  for (r <- 0 until 3; c <- 0 until 10) {
    dotMultOut(r)(c) := dataInReg(c) * dotMultWeiIn(r)(c)
  }

  for(r <- 0 until 3) {
    //compute dot
    val tempDotRes = UInt(20 bits)
    tempDotRes := treeSum(dotMultOut(r))
    dotReduceOut(r) := tempDotRes
    //compute exp, delay 1 cycle to align with DOT
    expOut(r) := Delay(expInReg + expSumIn(r), 1)
  }

  //fp 32 adder
  val fp32Adders = new Array[addfp32](3)
  val fp32AddRes = Vec(Reg(UInt(32 bits)) init 0, 3)
  val cascadeAccRes = Vec(Reg(UInt(32 bits)) init 0, 3)
  cascadeAccRes(0) := io.cascade_data_in_col_1
  cascadeAccRes(1) := io.cascade_data_in_col_2
  cascadeAccRes(2) := io.cascade_data_out_col_3

  val dataInSplit = Vec(Reg(Bits(24 bits)) init 0, 3)
  dataInSplit := (dataInReg.asBits)(71 downto 0).subdivideIn(24 bits)

  for (i <- 0 until 3) {
    fp32Adders(i) = new addfp32
    if (tc_type == CHAIN) {
      fp32Adders(i).io.a <> fxp2FP(dotReduceOut(i), expOut(i))
    } else if (tc_type == ACCU) {
      fp32Adders(i).io.a <> (dataInSplit(i) ## B"8'd0")
    } else {
      fp32Adders(i).io.a <> B"32'd0"
    }
    fp32Adders(i).io.b <> cascadeAccRes(i).asBits
    fp32AddRes(i) := fp32Adders(i).io.res.asUInt
  }
  //assign outputs
  io.cascade_data_out_col_1 := fp32AddRes(0)
  io.cascade_data_out_col_2 := fp32AddRes(1)
  io.cascade_data_out_col_3 := fp32AddRes(2)
  val combinedOuts = Vec(UInt(24 bits), 3)
  //round each fp32 to 24
  for (i <- 0 until 3) {
    val newMant = fp32AddRes(i)(22 downto 8)
    combinedOuts(i)(14 downto 0) := newMant
    combinedOuts(i)(23 downto 15) := fp32AddRes(i)(31 downto 23)
  }
  io.bf24_col_1 <> combinedOuts(0)
  io.bf24_col_2 <> combinedOuts(1)
  io.bf24_col_3 <> combinedOuts(2)
}
