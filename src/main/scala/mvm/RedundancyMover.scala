package mvm

import spinal.core._
import spinal.lib._
import config.DefaultConfig
import scala.math.{min, pow}

class RedundancyMover(num_ports: Int, bitwidth: Int, dest_width: Int, placeholder: BigInt) extends Component {
  val io = new Bundle {
    val inputSeq = in Vec(IndexData(bitwidth, dest_width), num_ports)
    val outputSeq = out Vec(IndexData(bitwidth, dest_width), num_ports)
  }
  assert(isPow2(num_ports) && num_ports >= 4)

  private def rmRedundancy(ports: Vec[IndexData], stg: Int): Vec[IndexData] = {
    val resPorts = Vec(Reg(IndexData(bitwidth, dest_width),
      init=IndexData(bitwidth, dest_width, placeholder)), ports.size)
    if (ports.size == 2) {
      switch(ports(0).idxData.msb ## ports(1).idxData.msb) {
        is (B"2'b00", B"2'b11", B"2'b01") {
          resPorts := ports
        }
        is (B"2'b10") {
          resPorts := Vec(ports(1), ports(0))
        }
      }
    } else {
      val halfMoverLower = rmRedundancy(Vec(for(i <- 0 until ports.size/2) yield ports(i)), stg-1)
      val halfMoverUpper = rmRedundancy(Vec(for(i <- ports.size/2 until ports.size) yield ports(i)), stg-1)

      // selection candidates
      val srcPorts = Vec(IndexData(bitwidth, dest_width), ports.size)
      for (i <- 0 until ports.size/2) {
        srcPorts(i) := halfMoverUpper(i)
      }
      for (i <- ports.size/2 until ports.size) {
        srcPorts(i) := IndexData(bitwidth, dest_width, placeholder)
      }

      val moveSel = Vec(for (l <- halfMoverLower) yield l.idxData.msb).asBits
      for (outPortIdx <- resPorts.indices) {
        val moveSelBuilder = WhenBuilder()
        for (nCand <- 0 to min(outPortIdx, ports.size/2)) {
          val selEntry = (~B(0, ports.size/2 bits) << U(nCand))(ports.size/2-1 downto 0)
          moveSelBuilder.when(moveSel === selEntry) {
            resPorts(outPortIdx) := srcPorts(outPortIdx - nCand)
          }
        }
        if (outPortIdx < ports.size/2) {
          moveSelBuilder.when(moveSel(outPortIdx downto 0) === B(0)) {
            resPorts(outPortIdx) := halfMoverLower(outPortIdx)
          }
        }
        moveSelBuilder.otherwise {
          resPorts(outPortIdx) := IndexData(bitwidth, dest_width, placeholder)
        }
      }
    }
    resPorts
  }

  io.outputSeq := rmRedundancy(io.inputSeq, log2Up(num_ports))
}

object RedundancyMoverGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generateVerilog(new RedundancyMover(4, 9, 12, BigInt("111111111", 2)))
  }
}
