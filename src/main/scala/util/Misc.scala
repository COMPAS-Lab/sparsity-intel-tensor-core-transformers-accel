package util

import spinal.core._
import spinal.lib._
import scala.math.pow

object LeadingZeros {

  // Calculate leading zeros. Solution is based on method described here:
  // https://electronics.stackexchange.com/questions/196914/verilog-synthesize-high-speed-leading-zero-count
  // Code by @typingArtist on SpinalHDL gitter channel: https://gitter.im/SpinalHDL/SpinalHDL?at=5bbe075e435c2a518e81dd83

  def apply(input: Bits): UInt = calcOnes(~input).resize(log2Up(input.getWidth+1))

  def calcOnes(input: Bits): UInt = input.getWidth match {
    case 0 => U""
    case 1 => input.asUInt
    case a => {
      val leftBits = 1 << (log2Up(a)-1)
      val upper = calcOnes(input.resizeLeft(leftBits))
      val lower = calcOnes(input.resize(a - leftBits)).resize(upper.getWidth)
      (upper.msb ## lower.msb).mux(
        B"11"   -> U"10" @@ upper.resize(upper.getWidth-1),
        B"10"   -> U"01" @@ lower.resize(lower.getWidth-1),
        default -> U"00" @@ upper.resize(upper.getWidth-1)
      )
    }
  }
}

class DynaCounter(width: Int) extends ImplicitArea[UInt] {
  require(width > 0)
  val overflowVal = UInt(width bits)
  val (start, end) = (BigInt(0), BigInt(2 << width))

  val willIncrement = False.allowOverride
  val willClear = False.allowOverride

  def clear(): Unit = willClear := True
  def increment(): Unit = willIncrement := True

  val valueNext = UInt(width bit)
  val value = RegNext(valueNext) init(start)
  val willOverflowIfInc = value >= overflowVal
  val willOverflow = willOverflowIfInc && willIncrement

  when(willOverflow){
    valueNext := U(start)
  } otherwise {
    valueNext := (value + U(willIncrement)).resized
  }

  when(willClear) {
    valueNext := start
  }

  willOverflowIfInc.allowPruning
  willOverflow.allowPruning

  override def implicitValue: UInt = this.value
}

object DynaCounter {
//  def apply(width: Int, overflowVal: UInt): DynaCounter = {
//    val dynaCounter = new DynaCounter(width)
//    dynaCounter.overflowVal := overflowVal-1
//    dynaCounter
//  }

  def apply(width: Int, overflowVal: UInt): DynaCounter = new Composite(overflowVal) {
    val dynaCounter = new DynaCounter(width)
    dynaCounter.overflowVal := overflowVal-1
  }.dynaCounter
}

class DelayTree(num_bit: Int, n_outputs: Int) extends Component {
  val io = new Bundle {
    val dataIn = in UInt(num_bit bits)
    val dataOut = out Vec(UInt(num_bit bits), n_outputs)
  }

  private var finishedOuts: Int = 0
  private def tree_recurse(e: UInt, curr_stage: Int): Unit = {
    if (curr_stage < log2Up(n_outputs)-1) {
      val a, b = Reg(UInt(num_bit bits))
      tree_recurse(a, curr_stage+1)
      tree_recurse(b, curr_stage+1)
      a := e
      b := e
    } else {
      if (finishedOuts < n_outputs) {
        io.dataOut(finishedOuts) := e
        io.dataOut(finishedOuts + 1) := e
        finishedOuts += 2
      }
    }
  }

  tree_recurse(io.dataIn, 0)
}

object DelayTree {
  def apply(src: UInt, n_outputs: Int): Vec[UInt] = {
    val tree = new DelayTree(src.getWidth, n_outputs)
    tree.io.dataIn := src
    tree.io.dataOut
  }
}

class blk_delay_core(bitwidth: Int, delay_len: Int, mem_type: String) extends BlackBox {
  val io = new Bundle {
    val clk, nrst, ena = in Bool()
    val dat_in = in Bits(bitwidth bits)
    val dat_out = out Bits(bitwidth bits)
  }

  noIoPrefix()
  mapCurrentClockDomain(clock = io.clk, reset=io.nrst, resetActiveLevel = LOW)

  addGenerics(
    "LENGTH" -> delay_len,
    "WIDTH" -> bitwidth,
    "TYPE" -> mem_type,
    "REGISTER_OUTPUTS" -> "TRUE"
  )
  addRTLPath("./src/main/sverilog/blk_delay_core.sv")
}

object BlockDelay {
 def apply[T <: Data](that: T, cycleCount: Int, mem_type: String, delay_en: Bool = null): T = {
   require(cycleCount >= 0,"Negative cycleCount is not allowed in Delay")

   val res: T = cloneOf(that)
   val delayCore = new blk_delay_core(that.getBitsWidth, cycleCount, mem_type = mem_type)

   if (delay_en != null){
     delayCore.io.ena := delay_en
   } else {
     delayCore.io.ena := True
   }

   delayCore.io.dat_in := that.asBits
   res.assignFromBits(delayCore.io.dat_out)
   res
 }
}

object StreamWidthConv{
  def apply[T <: Data](that: Stream[Vec[T]], out_width: Int): Stream[Vec[T]] = new Composite(that) {
    require(that.payload.length < out_width, "stream width conversion only supports narrow to wide conversion")

    val resPayload = Vec(Reg(cloneOf(that.payload.last), init=cloneOf(that.payload.last).getZero), out_width)
    val inCounter = Counter(out_width / that.payload.length) init 0
    val res = Stream(Vec(cloneOf(that.payload.last), out_width))


    that.ready := res.ready
    when(that.fire || (that.ready && inCounter.willOverflowIfInc)) {
      inCounter.increment()
    }
    when(inCounter.willOverflow) {
      resPayload.foreach(_.clearAll())
    }
    res.valid := inCounter.willOverflowIfInc
    res.payload := resPayload

    for (gIdx <- 0 until out_width / that.payload.length) {
      when(that.fire && (inCounter === gIdx)) {
        for (el <- that.payload.indices) {
          resPayload(gIdx * that.payload.length + el) := that.payload(el)
        }
      }
    }
  }.res
}

class StreamDelay[T <: Data](dataType: HardType[T]) extends Component {
  val io = new Bundle {
    val inputStream = slave Stream(dataType)
    val outputStream = master Stream(dataType)
  }

  val outReg, bufferReg = Reg(dataType)
  val outValidReg = Reg(Bool()) init False
  val inReadyReg = Reg(Bool()) init True
  val isBufferLoaded = Reg(Bool()) init False
  inReadyReg := io.outputStream.ready

  when(~outValidReg) {
    outValidReg := io.inputStream.fire
    when(io.inputStream.fire) {
      outReg := io.inputStream.payload
    }
  } otherwise {
    when (io.outputStream.fire & ~isBufferLoaded) {
      outValidReg := io.inputStream.fire
      outReg := io.inputStream.payload
    } elsewhen (io.outputStream.fire & isBufferLoaded) {
      outValidReg := True
      outReg := bufferReg
      when(io.inputStream.fire) {
        bufferReg := io.inputStream.payload
        isBufferLoaded := True
      } otherwise {
        isBufferLoaded := False
      }
    } otherwise {
      when(io.inputStream.fire & ~isBufferLoaded) {
        isBufferLoaded := True
        bufferReg := io.inputStream.payload
      }
    }
  }

  io.outputStream.payload := outReg
  io.inputStream.ready := inReadyReg
  io.outputStream.valid := outValidReg
}

object StreamDelay {
  def apply[T <: Data](src: Stream[T], delayCycles: Int): Stream[T] = {
    val streamPipe = Array.fill(delayCycles)(new StreamDelay(src.payloadType))

    streamPipe(0).io.inputStream << src
    for (i <- 1 until delayCycles) {
      streamPipe(i - 1).io.outputStream >> streamPipe(i).io.inputStream
    }

    streamPipe(delayCycles-1).io.outputStream
  }
}