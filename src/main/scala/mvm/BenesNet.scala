package mvm

import spinal.core._
import spinal.lib._
import scala.math.{ceil, min, pow}

case class BenesNet(num_ports: Int, bitwidth: Int, dest_width: Int, bypass: Boolean = false) extends Component {
  // Benes Net for input data distribution
  // reference: https://github.com/georgia-tech-synergy-lab/SIGMA
  val io = new Bundle {
    val inputSeq = in Vec(BfpBlockWithIdx(bitwidth, 0, 0, dest_width), num_ports)
    val outputSeq = Vec(master Flow(BfpBlockWithIdx(bitwidth, 0, 0, 0)), num_ports)
  }

  def switcher(a: BfpBlockWithIdx,
               b: BfpBlockWithIdx,
               stgId: Int,
               portIdOffset: Int): BfpBlockWithIdx = {
    val outReg = Reg(BfpBlockWithIdx(bitwidth, 0, 0, dest_width))

    outReg.setName("stg_" + stgId.toString + "_muxff_" + (portIdOffset).toString)
    outReg := Mux(a.destId(stgId), b, a)
    outReg
  }

  if (bypass) {
    // bypass entire benes net for P&R results for naive design
    for (i <- 0 until num_ports) {
      io.outputSeq(i).blkData := io.inputSeq(i).blkData
      io.outputSeq(i).valid := io.inputSeq(i).destId === i
    }
  } else {
    assert(isPow2(num_ports), "number of inputs for Benes net should be power of 2")

    val nConnStgs: Int = log2Up(num_ports) * 2
    val nUnitsStg: Int = (num_ports / 2)

    // intermediate stages connection
    var preStgPorts: Vec[BfpBlockWithIdx] = io.inputSeq

    var nSubGrps = num_ports / 2
    var currPortSkipOffset = 1
    for (stgIdx <- 0 until nConnStgs) {
      val curr_stg_ports = Vec(BfpBlockWithIdx(bitwidth, 0, 0, dest_width), num_ports)
      val nSubGrpPorts: Int = num_ports / nSubGrps
      for (subGrpIdx <- 0 until nSubGrps) {
        for (pId <- 0 until nSubGrpPorts) {
          val currAbsPid = pId + subGrpIdx * nSubGrpPorts
          val srcA = pId + subGrpIdx * nSubGrpPorts
          val srcB = (pId + subGrpIdx * nSubGrpPorts + currPortSkipOffset) % nSubGrpPorts + subGrpIdx * nSubGrpPorts
          curr_stg_ports(currAbsPid) := switcher(
            a = preStgPorts(srcA),
            b = preStgPorts(srcB),
            stgId = stgIdx,
            portIdOffset = currAbsPid
          )
        }
      }

      if (stgIdx < (nConnStgs / 2 - 1)) {
        nSubGrps /= 2
        currPortSkipOffset *= 2
      } else if (stgIdx >= (nConnStgs / 2)) {
        nSubGrps *= 2
        currPortSkipOffset /= 2
      }
      preStgPorts = curr_stg_ports
    }

    // output connection
    for (pidx <- 0 until num_ports) {
      io.outputSeq(pidx).payload.blkData := preStgPorts(pidx).blkData
      io.outputSeq(pidx).valid := (preStgPorts(pidx).destId.asUInt === pidx)
    }
  }
}
