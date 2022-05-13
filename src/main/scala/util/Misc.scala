package util

import spinal.core._
import spinal.lib._

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
  def apply(width: Int, overflowVal: UInt): DynaCounter = {
    val dynaCounter = new DynaCounter(width)
    dynaCounter.overflowVal := overflowVal-1
    dynaCounter
  }
}

class StreamDelay[T <: Data](dataType: HardType[T]) extends Component {
  val io = new Bundle {
    val inputStream = slave Stream(dataType)
    val outputStream = master Stream(dataType)
  }

  io.outputStream <-/< io.inputStream
}

object StreamDelay {
  def apply[T <: Data](src: Stream[T], delayCycles: Int): Stream[T] = {
    val streamPipe = Array.fill(delayCycles-1)(new StreamDelay(src.payloadType))

    src >> streamPipe(0).io.inputStream
    for (i <- 1 until delayCycles-1) {
      streamPipe(i-1).io.outputStream >> streamPipe(i).io.inputStream
    }

    streamPipe(delayCycles-2).io.outputStream
  }
}