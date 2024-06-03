package mvm

import spinal.core._
import spinal.lib._
import config.DefaultConfig

class RedundancyMover(num_ports: Int, bitwidth: Int, placeholder: BigInt) extends Component {
  val io = new Bundle {
    val inputSeq = in Vec(UInt(bitwidth bits), num_ports)
    val outputSeq = out Vec(UInt(bitwidth bits), num_ports)
  }
  assert(isPow2(num_ports) && num_ports >= 4)

  private def rmRedundancy(ports: Vec[UInt]): Vec[UInt] = {
    val resPorts = Vec(Reg(UInt(bitwidth bits), init=U(0)), ports.size)
    if (ports.size == 2) {
      switch(ports(0)(bitwidth-1) ## ports(1)(bitwidth-1)) {
        is (B"2'b00", B"2'b11", B"2'b01") {
          resPorts := ports
        }
        is (B"2'b10") {
          resPorts := Vec(ports(1), ports(0))
        }
      }
    } else {
      val halfMoverLower = rmRedundancy(Vec(for(i <- 0 until ports.size/2) yield ports(i)))
      val halfMoverUpper = rmRedundancy(Vec(for(i <- ports.size/2 until ports.size) yield ports(i)))
      halfMoverUpper.setName("upper_half")
      halfMoverLower.setName("lower_half")

      var mCount = 0
      for(i <- resPorts.indices) {
        if(i < halfMoverLower.size / 2) {
          // no selection span
          resPorts(i) := halfMoverLower(i)
        } else if(i < halfMoverLower.size) {
          //selection span increase from 1 to p/2
          val upperCandidatesArray = halfMoverLower(i) +: (for (u <- 0 to mCount) yield halfMoverUpper(u))
          val upperCandidates = Vec(UInt(bitwidth bits), upperCandidatesArray.size)
          for (uCandIdx <- upperCandidates.indices) {
            upperCandidates(uCandIdx) := upperCandidatesArray(uCandIdx)
          }
          upperCandidates.setName("upper_candidates")
          if (upperCandidates.size > 2) {
            val upperSel = Vec(
              for (l <- halfMoverLower.size / 2 to i) yield halfMoverLower(l).msb).sCount(True)
            resPorts(i) := upperCandidates(upperSel)
          } else {
            resPorts(i) := upperCandidates(halfMoverLower(i).msb.asUInt)
          }
          mCount += 1
        } else if (i < halfMoverLower.size / 2 + halfMoverUpper.size) {
          //static selection span as P/2
          val upperCandidates = Vec(
            for (u <- (i - halfMoverLower.size) to (i - halfMoverLower.size / 2)) yield halfMoverUpper(u))
          val upperSel = Vec(
            for (l <- halfMoverLower.size / 2 until halfMoverLower.size) yield halfMoverLower(l).msb)
            .sCount(True)
          resPorts(i) := upperCandidates(upperSel)
        } else {
          // selection span decrease from P/2 to 0
          val upperCandidates = Vec(
            for(u <- (i - halfMoverLower.size) until halfMoverLower.size) yield halfMoverUpper(u))
          val upperSel = Vec(
            for (l <- halfMoverLower.size / 2 until halfMoverLower.size) yield halfMoverLower(l).msb)
            .sCount(True)
          switch(upperSel) {
            for (sIdx <- 0 until 2 * halfMoverLower.size - i) {
              is(U(sIdx)) {
                resPorts(i) := upperCandidates(sIdx)
              }
            }
            default {
              resPorts(i) := U(placeholder)
            }
          }
        }
      }
    }
    resPorts
  }

  io.outputSeq := rmRedundancy(io.inputSeq)
}

object RedundancyMoverGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generateVerilog(new RedundancyMover(16, 11, BigInt("11111111111111111", 2)))
  }
}
