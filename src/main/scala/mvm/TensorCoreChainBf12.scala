package mvm

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import config._
import intel_ips._
import util._

class TensorCoreChainBf12(chain_len: Int, out_buf_delay: Int,
                      out_fifo_depth: Int, output_width: Int) extends Component {
  val io = new Bundle {
    val dataIn = slave Flow(Vec(UInt(80 bits), chain_len))
    val loadCascadeIn = slave Flow(UInt(80 bits))
    val expIn = in Vec(UInt(8 bits), chain_len)
    val expCascadeIn = in UInt(8 bits)
    //data valid and data in should be 1 clock earlier than
    //the first loading because of data load reg and load_buf_sel reg
    val dataIterReady = out Bool()
    val loadReady = out Bool()
    val res = master Stream(Vec(UInt(output_width bits), 3))
    val matABroadcastIters, matAColSubGrpLen = in UInt(16 bits)
    //TODO: deprecate this signal
    val outValid = out Bool()
  }

  // helper function: connect data in ports
  def connect_data_in(tcIo: TensorCoreBaseInterfaceBf12, dataIn: UInt): Unit = {
    if (dataIn.getWidth == 80) {
      tcIo.data_in_1 := dataIn(3 downto 0)
      tcIo.data_in_2 := dataIn(7 downto 4)
      tcIo.data_in_3 := dataIn(11 downto 8)
      tcIo.data_in_4 := dataIn(15 downto 12)
      tcIo.data_in_5 := dataIn(19 downto 16)
      tcIo.data_in_6 := dataIn(23 downto 20)
      tcIo.data_in_7 := dataIn(27 downto 24)
      tcIo.data_in_8 := dataIn(31 downto 28)
      tcIo.data_in_9 := dataIn(35 downto 32)
      tcIo.data_in_10 := dataIn(39 downto 36)
      tcIo.data_in_11 := dataIn(43 downto 40)
      tcIo.data_in_12 := dataIn(47 downto 44)
      tcIo.data_in_13 := dataIn(51 downto 48)
      tcIo.data_in_14 := dataIn(55 downto 52)
      tcIo.data_in_15 := dataIn(59 downto 56)
      tcIo.data_in_16 := dataIn(63 downto 60)
      tcIo.data_in_17 := dataIn(67 downto 64)
      tcIo.data_in_18 := dataIn(71 downto 68)
      tcIo.data_in_19 := dataIn(75 downto 72)
      tcIo.data_in_20 := dataIn(79 downto 76)
    }
  }

  val tcEntry = new tensor_core_entry_bf12
  val tcStartPoint = new tensor_core_start_bf12
  val tcCoreChainElems = new Array[tensor_core_bf12](chain_len-1)
  val tcAccu = new tensor_core_accu

  // loading requires 3 extra cycles, align the valid signal
  // with the first compute core here
  val loadValidD3t = Delay(io.loadCascadeIn.valid, 3)
  // 2 cycle delay valid signal for loading selection
  val loadValidD2t = Delay(io.loadCascadeIn.valid, 2)
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

  val inputCounter = DynaCounter(io.matABroadcastIters.getWidth, io.matABroadcastIters)
  val inDataIterCounter = DynaCounter(io.matAColSubGrpLen.getWidth, io.matAColSubGrpLen)

  val loadBufSel = Reg(Bool()) init False
  when(io.dataIn.valid) {
    inputCounter.increment()
  }

  when(inputCounter.willOverflow) {
    loadBufSel := !loadBufSel
    inDataIterCounter.increment()
  }
  // TODO: consider moving this out to let upper level
  // hardware to count how many mat B col has been sent
  // by itself.
  io.dataIterReady := Delay(inputCounter.willOverflow, 1)

  //output buffer ctrl logic.
  // delayed output valid: 4c of dot lat,3c of accu lat and 2*(chain_len-1)
  // of input delay on the last stage of the chain
  val delayedDataInValidForOut = Delay(io.dataIn.valid, 2*(chain_len-1)+4+3-1-1, init=False)
  //counting the output iterations for output valid
  val outValidCounter = DynaCounter(io.matABroadcastIters.getWidth, io.matABroadcastIters)

  when(Delay(delayedDataInValidForOut, 1, init=False)) (outValidCounter.increment())
  io.outValid := Delay(outValidCounter.willOverflow, 1, init=False)

  connect_data_in(tcEntry.io, io.loadCascadeIn.payload)
  tcEntry.io.shared_exponent_data := io.expCascadeIn
  tcEntry.io.feed_sel <> U"2'd0"
  tcEntry.io.load_buf_sel <> False
  tcEntry.io.load_bb_one <> True
  tcEntry.io.load_bb_two <> False
  tcEntry.io.side_in_1 <> U"4'd0"
  tcEntry.io.side_in_2 <> U"4'd0"
  tcEntry.io.side_in_3 <> U"4'd0"
  tcEntry.io.side_in_4 <> U"4'd0"
  tcEntry.io.clr0 <> False
  tcEntry.io.clr1 <> False

  connect_data_in(tcStartPoint.io, io.dataIn.payload(0))
  tcStartPoint.io.shared_exponent_data <> io.expIn(0)
  tcStartPoint.io.cascade_weight_in <> tcEntry.io.cascade_weight_out
  tcStartPoint.io.load_buf_sel <> loadBufSel
  tcStartPoint.io.load_bb_one <> loadBufCtrl(0)
  tcStartPoint.io.load_bb_two <> loadBufCtrl(1)
  tcStartPoint.io.side_in_1 <> U"4'h0"
  tcStartPoint.io.side_in_2 <> U"4'h0"
  tcStartPoint.io.side_in_3 <> U"4'd0"
  tcStartPoint.io.side_in_4 <> U"4'd0"
  tcStartPoint.io.feed_sel <> U"2'd1"
  tcStartPoint.io.clr0 <> False
  tcStartPoint.io.clr1 <> False

  for (i <- 0 until chain_len-1) {
    tcCoreChainElems(i) = new tensor_core_bf12
    //TODO: replace input delay chain by FIFO
    val delayedDataIn = BlockDelay(io.dataIn.payload(i+1), 2*(i+1))
    connect_data_in(tcCoreChainElems(i).io, delayedDataIn)
    val delayedExpIn = BlockDelay(io.expIn(i+1), 2*(i+1))
    tcCoreChainElems(i).io.shared_exponent_data <> delayedExpIn
    // comment out direct connect
//    connect_data_in(tcCoreChainElems(i).io, io.dataIn.payload(i+1))
//    tcCoreChainElems(i).io.shared_exponent_data <> io.expIn(i+1)
    val loadBufSelDelayed = Delay(loadBufSel, 2 * (i+1), init=False)

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
    tcCoreChainElems(i).io.load_buf_sel <> loadBufSelDelayed
    tcCoreChainElems(i).io.load_bb_one <> loadBufCtrl(0)
    tcCoreChainElems(i).io.load_bb_two <> loadBufCtrl(1)
    tcCoreChainElems(i).io.feed_sel := U"2'd1"
    tcCoreChainElems(i).io.side_in_1 <> U"4'd0"
    tcCoreChainElems(i).io.side_in_2 <> U"4'd0"
    tcCoreChainElems(i).io.side_in_3 <> U"4'd0"
    tcCoreChainElems(i).io.side_in_4 <> U"4'd0"
    tcCoreChainElems(i).io.clr0 <> False
    tcCoreChainElems(i).io.clr1 <> False
  }

  val resValidCounter = DynaCounter(io.matAColSubGrpLen.getWidth, io.matAColSubGrpLen)
  when(outValidCounter.willOverflow) (resValidCounter.increment())
  val resValid = Mux(io.matAColSubGrpLen === 1,
    outValidCounter.willIncrement,
    resValidCounter.willOverflowIfInc)

  // feedback path
  val oBufferLoadValid = Reg(Bool()) init False
  val fbLoadCounter = DynaCounter(io.matABroadcastIters.getWidth, io.matABroadcastIters)
  when(oBufferLoadValid) {
    fbLoadCounter.increment()
    when(io.matAColSubGrpLen > 1) {
      when (fbLoadCounter.willOverflow & resValidCounter === (io.matAColSubGrpLen - 2)) {
        oBufferLoadValid := False
      }.otherwise {
        oBufferLoadValid := delayedDataInValidForOut
      }
    }.otherwise {
      when(fbLoadCounter.willOverflow) {
        oBufferLoadValid := ~fbLoadCounter.willOverflow
      }.otherwise {
        oBufferLoadValid := delayedDataInValidForOut
      }
    }
  } .otherwise {
    when(~resValidCounter.willOverflowIfInc) {
      oBufferLoadValid := delayedDataInValidForOut
    }
  }

  val fbDelayFifo = new StreamOutFifo(output_width)
  fbDelayFifo.setName("AccuDelayInst")
  // when the final iter is ready, push the res into output fifo
  fbDelayFifo.io.push.valid := oBufferLoadValid
  fbDelayFifo.io.push.payload := tcAccu.io.bf24_col_3 @@ tcAccu.io.bf24_col_2 @@ tcAccu.io.bf24_col_1

  val fbDelayFifoPayload = Vec(UInt(output_width bits), 3)
  fbDelayFifoPayload := fbDelayFifo.io.pop.payload.subdivideIn(output_width bits)
  // fbFifo pop ctrl
  val fbFifoPop, isSecIterStarted = Reg(Bool()) init False
  when (isSecIterStarted) {
    isSecIterStarted := ~resValidCounter.willOverflow
  }.otherwise {
    // TODO: here we assume the data in will not break during one iteration
    isSecIterStarted := inDataIterCounter > 0 & io.dataIn.valid.fall()
  }
  fbFifoPop := Delay(io.dataIn.valid & isSecIterStarted,
    2*(chain_len-1) + 3 - 1 - out_buf_delay, init=False)
  fbDelayFifo.io.pop.ready := fbFifoPop


  val fbEnable = Delay(fbFifoPop, out_buf_delay - 1, init=False)
//  val fbEnableExt = fbEnable | Delay(fbEnable, fbOutRegPipe - 3, init=False)
  val fbDelayPipe = Delay(fbDelayFifoPayload, out_buf_delay - 1, init=fbDelayFifoPayload.getZero)
  tcAccu.io.bf24_a1 := Delay(Mux(fbEnable, fbDelayPipe(0), fbDelayPipe(0).getZero), 1)
  tcAccu.io.bf24_a2 := Delay(Mux(fbEnable, fbDelayPipe(1), fbDelayPipe(1).getZero), 1)
  tcAccu.io.bf24_a3 := Delay(Mux(fbEnable, fbDelayPipe(2), fbDelayPipe(2).getZero), 1)
  tcAccu.io.cascade_data_in_col_1 <> tcCoreChainElems(chain_len-2).io.cascade_data_out_col_1
  tcAccu.io.cascade_data_in_col_2 <> tcCoreChainElems(chain_len-2).io.cascade_data_out_col_2
  tcAccu.io.cascade_data_in_col_3 <> tcCoreChainElems(chain_len-2).io.cascade_data_out_col_3
  tcAccu.io.zero_en := False
  tcAccu.io.acc_en := False
  // gave up using tensor core's input clear because it controls the data input and
  // cascade input reg at the same time
  tcAccu.io.clr0 := False


  val outFifo = new StreamOutFifo(output_width)
  // when the final iter is ready, push the res into output fifo
  outFifo.io.push.valid := Mux(io.matAColSubGrpLen === 1,
    resValid,
    resValidCounter.willOverflowIfInc & Delay(fbEnable, 4, init=False))
  outFifo.io.push.payload := tcAccu.io.bf24_col_3 @@ tcAccu.io.bf24_col_2 @@ tcAccu.io.bf24_col_1
  io.res << outFifo.io.pop.translateWith(outFifo.io.pop.payload.subdivideIn(output_width bits))
}

object TensorCoreChainBf12Gen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generate(
      new TensorCoreChainBf12(
        chain_len=12,
        out_buf_delay=4,
        out_fifo_depth=32,
        output_width=24)).printPruned()
  }
}
