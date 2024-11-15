package mvm

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import config._
import intel_ips._
import util._

class TensorCoreChainBf12(chain_len: Int, out_buf_delay: Int,
                          output_width: Int, ridx_width: Int) extends Component {
  val io = new Bundle {
    // TODO: how to efficiently use the valid signal?
    val dataIn = slave Flow(Vec(UInt(80 bits), chain_len))
    val loadCascadeIn = slave Flow(BfpBlockWithIdx(80, ridx_width, 0, 0))
    val expIn = in Vec(UInt(8 bits), chain_len)
    val expCascadeIn = in UInt(8 bits)
    //data valid and data in should be 1 clock earlier than
    //the first loading because of data load reg and load_buf_sel reg
    val dataIterReady = out Bool()
    val res = master Flow(Vec(BfpBlockWithIdx(output_width, ridx_width, 0, 0), 3))
    // ctrl signal that switches the selected buffer
    val doubleBufferCompSel = in Bool()
    val doubleBufferLoadSel = in Bits(2 bits)
    val matABroadcastIters = in UInt(16 bits)
    val dataInLast = in Bool()
    val dataOutLast = out Bool()
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
  // small buffer for row index
  val rIdxBuffer = Array.fill(2)(new StreamOutFifo(ridx_width, 2, "MLAB"))

  // loading requires 3 extra cycles, align the valid signal
  // with the first compute core here
  val loadCounter = Counter(chain_len*3, inc=Delay(io.loadCascadeIn.valid, 3))
  // 2 cycle delay valid signal for loading selection
  val loadBufCtrl = Bits(2 bits)
  val loadBufCompSel = RegNext(io.doubleBufferCompSel, init=False)

  val inputCounter = DynaCounter(io.matABroadcastIters.getWidth, io.matABroadcastIters)
  when(io.dataIn.valid) {inputCounter.increment()}
  // TODO: consider moving this out to let upper level
  // hardware to count how many mat B col has been sent
  // by itself.
  io.dataIterReady := Delay(inputCounter.willOverflow, 1)

  val delayedCasLoadValidForBufSel = Delay(io.loadCascadeIn.valid, 2)
  when(delayedCasLoadValidForBufSel) {
    loadBufCtrl := Delay(io.doubleBufferLoadSel, 2, init=B"01")
  }.otherwise {
    loadBufCtrl := B(0)
  }

  //ridx buffer logic: triggered by io.loadCascadeIn.valid
  val rIdxPushStart = Reg(Bool(), init=False)

  rIdxBuffer(0).io.push.valid := rIdxPushStart & io.doubleBufferLoadSel(0)
  rIdxBuffer(0).io.push.payload := Delay(io.loadCascadeIn.payload.rIdx, 1)
  rIdxBuffer(1).io.push.valid := rIdxPushStart & io.doubleBufferLoadSel(1)
  rIdxBuffer(1).io.push.payload := Delay(io.loadCascadeIn.payload.rIdx, 1)

  when(rIdxPushStart) {
    rIdxPushStart := False
  }.otherwise {
    rIdxPushStart := io.loadCascadeIn.valid.rise() |
      (io.loadCascadeIn.valid & io.doubleBufferLoadSel(0).edge())
  }

  //output buffer ctrl logic.
  // delayed output valid: 4c of dot lat,3c of accu lat and 2*(chain_len-1)
  // of input delay on the last stage of the chain
  val delayedDataInValidForFbpop = BlockDelay(io.dataIn.valid, 2*(chain_len-1)+4+3-1-1-2-out_buf_delay, "MLAB")
  val delayedDataInValidForAccu = Delay(delayedDataInValidForFbpop, out_buf_delay)
  val delayedDataInValidForOut = Delay(delayedDataInValidForAccu, 2)
  val delayedDataInLastForAccu = BlockDelay(io.dataInLast, 2*(chain_len-1)+4+3-1-1-2, "MLAB")
  val delayedDataInLastForOut = Delay(delayedDataInLastForAccu, 2)
  val delayedBufCompSel = BlockDelay(io.doubleBufferCompSel, 2*(chain_len-1)+4+3-1-1, "MLAB")
  //counting the output iterations for output valid
  val outValidCounter = DynaCounter(io.matABroadcastIters.getWidth, io.matABroadcastIters)
  when(delayedDataInValidForOut) (outValidCounter.increment())

  connect_data_in(tcEntry.io, io.loadCascadeIn.payload.blkData)
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
  tcStartPoint.io.load_buf_sel <> loadBufCompSel
  tcStartPoint.io.load_bb_one <> loadBufCtrl(0)
  tcStartPoint.io.load_bb_two <> loadBufCtrl(1)
  tcStartPoint.io.side_in_1 <> U"4'h0"
  tcStartPoint.io.side_in_2 <> U"4'h0"
  tcStartPoint.io.side_in_3 <> U"4'd0"
  tcStartPoint.io.side_in_4 <> U"4'd0"
  tcStartPoint.io.feed_sel <> U"2'd1"
  tcStartPoint.io.clr0 <> False
  tcStartPoint.io.clr1 <> False

  val loadBufSelDelayed = Bits(chain_len-1 bits)
  for (i <- 0 until chain_len-1) {
    tcCoreChainElems(i) = new tensor_core_bf12
    // FIFO-based delay chain
    val delayedDataIn = BlockDelay(io.dataIn.payload(i+1), 2*(i+1), "M20K")
    connect_data_in(tcCoreChainElems(i).io, delayedDataIn)
    val delayedExpIn = BlockDelay(io.expIn(i+1), 2*(i+1), "M20K")
    tcCoreChainElems(i).io.shared_exponent_data <> delayedExpIn
    val loadBufCompSelEnCounter = Counter(chain_len * 3, inc = delayedCasLoadValidForBufSel)

    if (i == 0) {
      tcCoreChainElems(i).io.cascade_data_in_col_1 <> tcStartPoint.io.cascade_data_out_col_1
      tcCoreChainElems(i).io.cascade_data_in_col_2 <> tcStartPoint.io.cascade_data_out_col_2
      tcCoreChainElems(i).io.cascade_data_in_col_3 <> tcStartPoint.io.cascade_data_out_col_3
      tcCoreChainElems(i).io.cascade_weight_in <> tcStartPoint.io.cascade_weight_out
      loadBufSelDelayed(i) := Delay(loadBufCompSel, 2)
    } else {
      tcCoreChainElems(i).io.cascade_data_in_col_1 <> tcCoreChainElems(i-1).io.cascade_data_out_col_1
      tcCoreChainElems(i).io.cascade_data_in_col_2 <> tcCoreChainElems(i-1).io.cascade_data_out_col_2
      tcCoreChainElems(i).io.cascade_data_in_col_3 <> tcCoreChainElems(i-1).io.cascade_data_out_col_3
      tcCoreChainElems(i).io.cascade_weight_in <> tcCoreChainElems(i-1).io.cascade_weight_out
      loadBufSelDelayed(i) := Delay(loadBufSelDelayed(i-1), 2)
    }
    tcCoreChainElems(i).io.zero_en <> False
    tcCoreChainElems(i).io.acc_en <> False
    tcCoreChainElems(i).io.load_buf_sel <> loadBufSelDelayed(i)
//    tcCoreChainElems(i).io.load_bb_one <> loadBufCtrl(0)
//    tcCoreChainElems(i).io.load_bb_two <> loadBufCtrl(1)
    tcCoreChainElems(i).io.load_bb_one := loadBufCtrl(0) & (loadBufCompSelEnCounter > ((i+1)*3-1))
    tcCoreChainElems(i).io.load_bb_two := loadBufCtrl(1) & (loadBufCompSelEnCounter > ((i+1)*3-1))
    tcCoreChainElems(i).io.feed_sel := U"2'd1"
    tcCoreChainElems(i).io.side_in_1 <> U"4'd0"
    tcCoreChainElems(i).io.side_in_2 <> U"4'd0"
    tcCoreChainElems(i).io.side_in_3 <> U"4'd0"
    tcCoreChainElems(i).io.side_in_4 <> U"4'd0"
    tcCoreChainElems(i).io.clr0 <> False
    tcCoreChainElems(i).io.clr1 <> False
  }

  // feedback path
  val fbBufferLoadValid = Reg(Bool()) init False
  fbBufferLoadValid := delayedDataInValidForOut & ~delayedDataInLastForOut

  val fbDelayFifo = new StreamOutFifo(output_width * 3, 32, "M20K")
  fbDelayFifo.setName("AccuDelayInst")
  // when the final iter is ready, push the res into output fifo
  fbDelayFifo.io.push.valid := fbBufferLoadValid
  fbDelayFifo.io.push.payload := tcAccu.io.bf24_col_3 @@ tcAccu.io.bf24_col_2 @@ tcAccu.io.bf24_col_1

  val fbDelayFifoPayload = Vec(UInt(output_width bits), 3)
  fbDelayFifoPayload := fbDelayFifo.io.pop.payload.subdivideIn(output_width bits)
  // fbFifo pop ctrl
  val accuInCounter = DynaCounter(io.matABroadcastIters.getWidth, io.matABroadcastIters)
  when(delayedDataInValidForAccu) {accuInCounter.increment()}

  val fbFifoPop = Bool()
  fbDelayFifo.io.pop.ready := fbFifoPop

  val fbFifoPopCtrlFsm = new StateMachine {
    fbFifoPop := False
    val sIdle: State = new State with EntryPoint {
      whenIsActive {
        when(delayedDataInValidForAccu & ~delayedDataInLastForAccu) {
          goto(sWait1IterPass)
        }
      }
    }

    val sWait1IterPass: State = new State {
      whenIsActive {
        when(accuInCounter.value > (io.matABroadcastIters - out_buf_delay -1)) {
          goto(sPop)
        }
      }
    }

    val sPop: State = new State {
      whenIsActive {
        fbFifoPop := delayedDataInValidForFbpop
        when(delayedDataInLastForAccu) {
          when(accuInCounter.value > (io.matABroadcastIters - out_buf_delay - 1)) {
            goto(sIdle)
          }
        }
      }
    }
  }

  val fbEnable = Delay(fbFifoPop, out_buf_delay - 1, init=False)
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

  val accuOutVec = Vec(
    tcAccu.io.bf24_col_1.resize(output_width),
    tcAccu.io.bf24_col_2.resize(output_width),
    tcAccu.io.bf24_col_3.resize(output_width)
  )
  val resWithIdx = Vec(BfpBlockWithIdx(output_width, ridx_width, 0, 0), 3)

  rIdxBuffer(0).io.pop.ready := Delay(
    delayedDataInValidForOut & (delayedBufCompSel === False) & outValidCounter.willOverflow, 1)
  rIdxBuffer(1).io.pop.ready := Delay(
    delayedDataInValidForOut & (delayedBufCompSel === True) & outValidCounter.willOverflow, 1)
  for (bCol <- 0 until 3) {
    resWithIdx(bCol).blkData := accuOutVec(bCol)
    resWithIdx(bCol).rIdx := Delay(
      Mux(delayedBufCompSel, rIdxBuffer(1).io.pop.payload, rIdxBuffer(0).io.pop.payload), 1, init = U(0))
  }

  io.res.payload := resWithIdx
  io.res.valid := Delay(delayedDataInValidForOut, 1)
  io.dataOutLast := ~fbBufferLoadValid & io.res.valid
}

object TensorCoreChainBf12Gen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generate(
      new TensorCoreChainBf12(
        chain_len=12,
        out_buf_delay=4,
        output_width=24,
        ridx_width=9,
      )).printPruned()
  }
}
