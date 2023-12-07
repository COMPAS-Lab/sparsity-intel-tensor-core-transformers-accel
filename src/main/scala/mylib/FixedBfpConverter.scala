package mylib

import config.DefaultConfig
import spinal.core._
import spinal.lib._
import spinal.lib.experimental.math._
import util._

import scala.math.pow

class FixedBf16Converter extends Component {
  val io = new Bundle {
    //input: flatten 10 32-bit floating
    val dataIn = slave Flow (UInt(32 * 10 bits))
    //output: 10 mantissa and one exp
    val dataOut = master Flow (UInt(10 * 8 + 8 bits))
  }

  class FpData extends Bundle {
    val signBit = Bool()
    val mantissa = UInt(23 bits)
    val exp = UInt(8 bits)
  }

  val dataIn = Vec(new FpData, 10)

  val dataVec = Vec(UInt(32 bit), 10)
  dataVec := io.dataIn.payload.subdivideIn(32 bits)
  for (i <- 0 until 10) {
    dataIn(i).signBit := dataVec(i)(31)
    dataIn(i).exp := dataVec(i)(30 downto 23)
    dataIn(i).mantissa := dataVec(i)(22 downto 0)
  }

  // comparator tree
  val exceptionalCompRes = UInt(8 bits)
  exceptionalCompRes := Delay(
    Mux(
      dataIn(8).exp >= dataIn(9).exp,
      dataIn(8).exp,
      dataIn(9).exp
      ), log2Up(8)
    ) init U"8'd0"

  val intermediateCompRes = Vec(Reg(UInt(8 bits)) init 0, 7)
  var resIdx, decreIdx: Int = 0
  for (i <- log2Up(8) - 1 downto 0) {
    decreIdx = pow(2, i + 1).toInt
    for (j <- 0 until pow(2, i).toInt) {
      if (i == log2Up(8) - 1) {
        intermediateCompRes(resIdx) := Mux(
          dataIn(resIdx * 2).exp >= dataIn(resIdx * 2 + 1).exp,
          dataIn(resIdx * 2).exp,
          dataIn(resIdx * 2 + 1).exp
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
  largestExp := Mux(
    intermediateCompRes(6) >= exceptionalCompRes,
    intermediateCompRes(6), exceptionalCompRes
    )

  //mantissa shifting, 4 cycles delay up to here.
  val voidData = new FpData
  voidData.signBit := False
  voidData.mantissa := U"23'd0"
  voidData.exp := U"8'd0"

  val delayedData = Delay(dataIn, 4, init = Vec(voidData, 10))
  val delayedDataForResMants = Delay(delayedData, 2, init = Vec(voidData, 10))
  val resMants = Vec(Reg(UInt(8 bits)) init 0, 10)
  val resExp = Reg(UInt(8 bits)) init 0

  for (i <- 0 until 10) {
    val mantsWithSign =
      Mux(delayedData(i) === voidData, U"9'd0", U"1'b1" @@ delayedData(i).mantissa(22 downto 23 - 8))
    val shiftedMants = Delay(mantsWithSign |>> (largestExp - delayedData(i).exp), 2, init = U"9'd0")
    when(delayedDataForResMants(i).signBit) {
      resMants(i) := (U"1'b1" @@ ~(shiftedMants) + U"9'd1")(9 downto 2)
    } otherwise {
      resMants(i) := (U"1'b0" @@ shiftedMants)(9 downto 2)
    }
  }

  resExp := Delay(largestExp - U"8'd6", 2, init = U"8'd0")
  io.dataOut.payload := resMants.as(UInt(80 bits)) @@ resExp
  io.dataOut.valid := Delay(io.dataIn.valid, 7)
}

class FixedBf12Converter extends Component {
  val io = new Bundle {
    //input: flatten 20 16-bit floating
    val dataIn = slave Flow (UInt(16 * 20 bits))
    //output: 20 mantissa and one exp
    val dataOut = master Flow (UInt(20 * 4 + 8 bits))
  }

  class FpData extends Bundle {
    val signBit = Bool()
    val mantissa = UInt(10 bits)
    val exp = UInt(5 bits)
  }

  val dataIn = Vec(new FpData, 20)

  val dataVec = io.dataIn.payload.subdivideIn(16 bits)
  for (i <- 0 until 20) {
    dataIn(i).signBit := dataVec(i)(15)
    dataIn(i).exp := dataVec(i)(14 downto 10)
    dataIn(i).mantissa := dataVec(i)(9 downto 0)
  }

  // comparator tree
  // irregular part
  val exceptionalCompRes = Vec(Reg(UInt(8 bits), U(0)), 3)
  exceptionalCompRes(0) := Mux(
    dataIn(19).exp >= dataIn(18).exp,
    dataIn(19).exp.resize(8),
    dataIn(18).exp.resize(8)
    )
  exceptionalCompRes(1) := Mux(
    dataIn(17).exp >= dataIn(16).exp,
    dataIn(17).exp.resize(8),
    dataIn(16).exp.resize(8)
    )
  exceptionalCompRes(2) := Mux(
    exceptionalCompRes(0) >= exceptionalCompRes(1),
    exceptionalCompRes(0),
    exceptionalCompRes(1)
    )
  val exceptionalCompResD2 = Delay(exceptionalCompRes(2), 2)

  // regular part
  val intermediateCompRes = Vec(Reg(UInt(8 bits), U(0)), 15)
  var resIdx, decreIdx: Int = 0
  // tree layer idx
  for (i <- log2Up(16) - 1 downto 0) {
    decreIdx = pow(2, i + 1).toInt
    for (j <- 0 until pow(2, i).toInt) {
      if (i == log2Up(16) - 1) {
        intermediateCompRes(resIdx) := Mux(
          dataIn(resIdx * 2).exp >= dataIn(resIdx * 2 + 1).exp,
          dataIn(resIdx * 2).exp.resize(8),
          dataIn(resIdx * 2 + 1).exp.resize(8)
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
  largestExp := Mux(
    intermediateCompRes(14) >= exceptionalCompResD2,
    intermediateCompRes(14), exceptionalCompResD2
    )

  //mantissa shifting, 4 cycles delay up to here.
  val voidData = new FpData
  voidData.clearAll()

  val delayedData = Delay(dataIn, 5, init = Vec(voidData, 20))
  val delayedDataForResMants = Delay(delayedData, 3, init = Vec(voidData, 20))
  val resMants = Vec(Reg(UInt(4 bits)) init 0, 20)
  val resExp = Reg(UInt(8 bits)) init 0

  for (i <- 0 until 20) {
    val mantsWithSign =
      Mux(delayedData(i) === voidData, U"5'd0", U"1'b1" @@ delayedData(i).mantissa(9 downto 10 - 4))
    val shiftedMants = Delay(mantsWithSign |>> (largestExp - delayedData(i).exp), 2, init = U"5'd0")
    when(delayedDataForResMants(i).signBit) {
      resMants(i) := (U"1'b1" @@ ~(shiftedMants) + U"5'd1")(4 downto 1)
    } otherwise {
      resMants(i) := (U"1'b0" @@ shiftedMants)(4 downto 1)
    }
  }

  resExp := Delay(largestExp - U"8'd6", 2, init = U"8'd0")
  io.dataOut.payload := resMants.as(UInt(80 bits)) @@ resExp
  io.dataOut.valid := Delay(io.dataIn.valid, 8)
}

object FixedBfpConverterGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generate(new FixedBf12Converter).printPruned()
  }
}