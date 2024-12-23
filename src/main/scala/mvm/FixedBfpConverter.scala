package mvm

import config.DefaultConfig
import spinal.core._
import spinal.lib._

import scala.math.pow

case class FpData(mant_width: Int, exp_width: Int) extends Bundle {
  val signBit = Bool()
  val mantissa = UInt(mant_width bits)
  val exp = UInt(exp_width bits)

  override def getZero: this.type = {
    val zeroData = new FpData(mant_width, exp_width)
    zeroData.mantissa.clearAll()
    zeroData.exp.clearAll()
    zeroData.signBit.clearAll()
    zeroData.asInstanceOf[this.type]
  }

  def fromUInt(src: UInt): this.type = {
    this.signBit := src.msb
    this.exp := src(mant_width, exp_width bits)
    this.mantissa := src(0, mant_width bits)
    this
  }
}

class FixedBfp16Converter extends Component {
  val io = new Bundle {
    //input: flatten 10 32-bit floating
    val dataIn = slave Flow(Vec(FpData(exp_width = 8, mant_width = 23), 10))
    //output: 10 mantissa and one exp
    val dataOut = master Flow(UInt(10 * 8 + 8 bits))
  }

  // comparator tree
  val exceptionalCompRes = UInt(8 bits)
  exceptionalCompRes := Delay(
    Mux(io.dataIn.payload(8).exp >= io.dataIn.payload(9).exp,
      io.dataIn.payload(8).exp,
      io.dataIn.payload(9).exp),
    log2Up(8),
    init=U"8'd0"
  )

  val intermediateCompRes = Vec(Reg(UInt(8 bits)) init 0, 7)
  var resIdx, decreIdx: Int = 0
  for (i <- log2Up(8)-1 downto 0) {
    decreIdx = pow(2, i+1).toInt
    for (j <- 0 until pow(2, i).toInt) {
      if (i == log2Up(8)-1) {
        intermediateCompRes(resIdx) := Mux(
          io.dataIn.payload(resIdx*2).exp >= io.dataIn.payload(resIdx*2+1).exp,
          io.dataIn.payload(resIdx*2).exp,
          io.dataIn.payload(resIdx*2+1).exp
        )
      } else {
        intermediateCompRes(resIdx) := Mux(
          intermediateCompRes(resIdx - decreIdx) >= intermediateCompRes(resIdx - decreIdx + 1),
          intermediateCompRes(resIdx - decreIdx),
          intermediateCompRes(resIdx - decreIdx + 1)
        )
      }
      resIdx += 1
      decreIdx -= 1
    }
  }

  val largestExp = Reg(UInt(8 bits)) init 0
  largestExp := Mux(intermediateCompRes(6) >= exceptionalCompRes,
                  intermediateCompRes(6), exceptionalCompRes)

  //mantissa shifting, 4 cycles delay up to here.
  val voidData = FpData(23, 8).getZero

  val delayedData = Delay(io.dataIn.payload, 4, init = Vec(voidData, 10))
  val delayedDataForResMants = Delay(delayedData, 2, init = Vec(voidData, 10))
  val resMants = Vec(Reg(UInt(8 bits)) init 0, 10)
  val resExp = Reg(UInt(8 bits)) init 0

  for (i <- 0 until 10) {
    val mantsWithSign = 
          Mux(delayedData(i) === voidData, U"9'd0", U"1'b1" @@ delayedData(i).mantissa(22 downto 23-8))
    val shiftedMants = Delay(mantsWithSign |>> (largestExp - delayedData(i).exp), 2, init = U"9'd0")
    when(delayedDataForResMants(i).signBit) {
      resMants(i) := (U"1'b1" @@ ~(shiftedMants) + U"9'd1")(9 downto 2)
    } otherwise {
      resMants(i) := (U"1'b0" @@ shiftedMants)(9 downto 2)
    }
  }

  resExp := Delay(largestExp - U"8'd6", 2, init=U"8'd0")
  io.dataOut.payload := resMants.as(UInt(80 bits)) @@ resExp
  io.dataOut.valid := Delay(io.dataIn.valid, 7)
}


class FixedBfp12Converter(grpSize: Int) extends Component {
  val io = new Bundle {
    //input: flatten 20 32-bit floating
    val dataIn = slave Flow(Vec(UInt(24 bits), grpSize))
    //output: 20 mantissa and one exp
    val dataOut = master Flow(UInt(grpSize * 4 + 8 bits))
  }

  val CONV_DELAY: Int = log2Up(grpSize) + 2 + 1
  val fpDataIn = Vec(FpData(exp_width = 8, mant_width = 15), grpSize)
  for (i <- 0 until grpSize) {
    fpDataIn(i).fromUInt(io.dataIn.payload(i))
  }
  // comparator tree
  val largestExp = Vec(for (i <- fpDataIn) yield i.exp).reduceBalancedTree{
    (x, y) => Delay((x >= y) ? x | y, 1)
  }

  //mantissa shifting, 4 cycles delay up to here.
  val voidData = FpData(15, 8).getZero

  val delayedData = Delay(fpDataIn, log2Up(grpSize), init = Vec(voidData, grpSize))
  val delayedDataForResMants = Delay(delayedData, 2, init = Vec(voidData, grpSize))
  val resMants = Vec(Reg(UInt(4 bits)) init 0, grpSize)
  val resExp = Reg(UInt(8 bits)) init 0

  for (i <- 0 until grpSize) {
    val mantsWithSign =
      Mux(delayedData(i) === voidData, U"5'd0", U"1'b1" @@ delayedData(i).mantissa.asBits.resizeLeft(4).asUInt)
    val shiftedMants = Delay(mantsWithSign |>> (largestExp - delayedData(i).exp), 2, init = U"5'd0")
    when(delayedDataForResMants(i).signBit) {
      resMants(i) := (U"1'b1" @@ ~(shiftedMants) + U"5'd1").asBits.resizeLeft(4).asUInt
    } otherwise {
      resMants(i) := (U"1'b0" @@ shiftedMants).asBits.resizeLeft(4).asUInt
    }
  }

  resExp := Delay(largestExp - U"8'd2", 2, init=U"8'd0")
  io.dataOut.payload := resMants.as(UInt(grpSize * 4 bits)) @@ resExp
  // delay the valid signal for converter-latency cycles
  io.dataOut.valid := Delay(io.dataIn.valid, CONV_DELAY)
}

object FixedBfpConverterGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generate(new FixedBfp12Converter(20)).printPruned()
  }
}