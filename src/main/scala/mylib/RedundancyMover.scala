package mylib

import spinal.core._
import spinal.lib._
import scala.math.max
import config.DefaultConfig

class RedundancyMover(num_ports: Int, bitwidth: Int) extends Component {
  val io = new Bundle {
    val inputSeq = in Vec(UInt(bitwidth bits), num_ports)
    val outputSeq = out Vec(UInt(bitwidth bits), num_ports)
  }
  assert(isPow2(num_ports) && num_ports >= 4)

  private def rmRedundancy(ports: Vec[UInt]): Vec[UInt] = {
    val resPorts = Vec(UInt(bitwidth bits), ports.size)
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
      val placeholder = U(U"1'b1" ## U(0, bitwidth-1 bits))
      val halfRemovalLower = rmRedundancy(Vec(for(i <- 0 until ports.size/2) yield ports(i)))
      val halfRemovalUpper = rmRedundancy(Vec(for(i <- ports.size/2 until ports.size) yield ports(i)))
      halfRemovalUpper.setName("upper_half")
      halfRemovalLower.setName("lower_half")

      var mCount = 0
      for(i <- resPorts.indices) {
        if(i < halfRemovalLower.size / 2) {
          // no selection span
          resPorts(i) := halfRemovalLower(i)
        } else if(i < halfRemovalLower.size) {
          //selection span increase from 1 to p/2
          val upperCandidatesArray = halfRemovalLower(i) +: (for (u <- 0 to mCount) yield halfRemovalUpper(u))
          val upperCandidates = Vec(UInt(bitwidth bits), upperCandidatesArray.size)
          for (uCandIdx <- upperCandidates.indices) {
            upperCandidates(uCandIdx) := upperCandidatesArray(uCandIdx)
          }
          upperCandidates.setName("upper_candidates")
          if (upperCandidates.size > 2) {
            val upperSel = Vec(
              for (l <- halfRemovalLower.size / 2 to i) yield halfRemovalLower(l).msb).sCount(True)
            resPorts(i) := upperCandidates(upperSel)
          } else {
            resPorts(i) := upperCandidates(halfRemovalLower(i).msb.asUInt)
          }
          mCount += 1
        } else if (i < halfRemovalLower.size / 2 + halfRemovalUpper.size) {
          //static selection span as P/2
          val upperCandidates = Vec(
            for (u <- (i - halfRemovalLower.size) to (i - halfRemovalLower.size / 2)) yield halfRemovalUpper(u))
          val upperSel = Vec(
            for (l <- halfRemovalLower.size / 2 until halfRemovalLower.size) yield halfRemovalLower(l).msb)
            .sCount(True)
          resPorts(i) := upperCandidates(upperSel)
        } else {
          // selection span decrease from P/2 to 0
          val upperCandidates = Vec(
            for(u <- (i - halfRemovalLower.size) until halfRemovalLower.size) yield halfRemovalUpper(u))
          val upperSel = Vec(
            for (l <- halfRemovalLower.size / 2 until halfRemovalLower.size) yield halfRemovalLower(l).msb)
            .sCount(True)
          switch(upperSel) {
            for (sIdx <- 0 until 2 * halfRemovalLower.size - i) {
              is(U(sIdx)) {
                resPorts(i) := upperCandidates(sIdx)
              }
            }
            default {
              resPorts(i) := placeholder
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
    gen.defaultSpinalConfig.generateVerilog(new RedundancyMover(16, 11))
  }
}
