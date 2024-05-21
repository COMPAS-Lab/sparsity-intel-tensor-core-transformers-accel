package mvm

import config.DefaultConfig
import spinal.core._
import spinal.lib._
import spinal.lib.experimental.math._
import util._

import scala.math.pow

class FixedBfpConverter extends Component {
  val io = new Bundle {
    //input: flatten 10 32-bit floating
    val dataIn = slave Flow(UInt(32 * 10 bits))
    //output: 10 mantissa and one exp
    val dataOut = master Flow(UInt(10 * 8 + 8 bits))
  }

  class FpData extends Bundle {
    val signBit = Bool()
    val mantissa = UInt(23 bits)
    val exp = UInt(8 bits)
  }

  val dataIn = Vec(new FpData, 10)

  val dataVec = Vec(UInt(32 bit), 10)
  dataVec := io.dataIn.payload.subdivideIn(32 bits)
  for(i <- 0 until 10) {
    dataIn(i).signBit := dataVec(i)(31)
    dataIn(i).exp := dataVec(i)(30 downto 23)
    dataIn(i).mantissa := dataVec(i)(22 downto 0)
  }

  // comparator tree
  val exceptionalCompRes = UInt(8 bits)
  exceptionalCompRes := Delay(
      Mux(dataIn(8).exp >= dataIn(9).exp,
          dataIn(8).exp,
          dataIn(9).exp), log2Up(8)) init U"8'd0"

  val intermediateCompRes = Vec(Reg(UInt(8 bits)) init 0, 7)
  var resIdx, decreIdx: Int = 0
  for (i <- log2Up(8)-1 downto 0) {
    decreIdx = pow(2, i+1).toInt
    for (j <- 0 until pow(2, i).toInt) {
      if (i == log2Up(8)-1) {
        intermediateCompRes(resIdx) := Mux(
          dataIn(resIdx*2).exp >= dataIn(resIdx*2+1).exp,
          dataIn(resIdx*2).exp,
          dataIn(resIdx*2+1).exp
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

object FixedBfpConverterGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generate(new FixedBfpConverter).printPruned()
  }
}