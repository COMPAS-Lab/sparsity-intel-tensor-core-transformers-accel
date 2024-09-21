package mvm

import spinal.core._
import spinal.lib._
import scala.math.{min, pow, ceil}

case class BenesNetSwitch(bitwidth: Int) extends Component {
  val io = new Bundle{
    val datIn = Vec(slave Flow(BfpBlockWithIdx(bitwidth, 0, 0, 0)), 2)
    val datOut = Vec(master Flow(BfpBlockWithIdx(bitwidth, 0, 0, 0)), 2)
    val switchCtrl, en = in Bool()
  }

  val outReg = Vec(Reg(Flow(BfpBlockWithIdx(bitwidth, 0, 0, 0))), 2)
  outReg.foreach(_.setIdle())

  when(io.en) {
    when(io.switchCtrl) {
      outReg(0) << io.datIn(1)
      outReg(1) << io.datIn(0)
    }.otherwise {
      outReg(0) << io.datIn(0)
      outReg(1) << io.datIn(1)
    }
  }.otherwise {
    outReg := outReg
  }

  io.datOut := outReg
}

case class BenesNet(num_ports: Int, bitwidth: Int, dest_width: Int, asso_tcc_id: Int) extends Component {
  val io = new Bundle {
    val inputSeq = in Vec(BfpBlockWithIdx(bitwidth, 0, 0, dest_width), num_ports)
    val outputSeq = Vec(master Flow(BfpBlockWithIdx(bitwidth, 0, 0, 0)), num_ports)
    val en = in Bool()
  }

  val nConnStgs: Int = (log2Up(num_ports) - 1) * 2
  val nUnitsStg: Int = (num_ports / 2)

  val switches = Array.fill(nConnStgs + 1, nUnitsStg)(BenesNetSwitch(bitwidth))

  // intermediate stages connection
  var nSubGrps = 0
  for (stgIdx <- 0 until nConnStgs) {
    val nSubGrpPorts: Int = num_ports / pow(2, nSubGrps).toInt
    for (subGrpIdx <- 0 until pow(2, nSubGrps).toInt) {
      val portIdOffset: Int = nSubGrpPorts * subGrpIdx
      for (portId <- 0 until nSubGrpPorts) {
        var destPort, srcPort: Int = 0
        if (stgIdx < nConnStgs / 2) {
          destPort = portId
          srcPort = if (destPort < nSubGrpPorts / 2) destPort * 2
                          else (destPort - nSubGrpPorts / 2) * 2 + 1
        } else {
          srcPort = portId
          destPort = if (srcPort < nSubGrpPorts / 2) srcPort * 2
                          else (srcPort - nSubGrpPorts / 2) * 2 + 1
        }
        srcPort += portIdOffset
        destPort += portIdOffset

        switches(stgIdx + 1)(destPort/2).io.datIn(destPort % 2) <<
          switches(stgIdx)(srcPort/2).io.datOut(srcPort % 2)
      }
    }

    if (stgIdx < (nConnStgs / 2 - 1)) {
      nSubGrps += 1
    } else if (stgIdx > (nConnStgs/2 - 1)) {
      nSubGrps -= 1
    }
  }

  // input and output connection
  for (uidx <- 0 until nUnitsStg) {
    switches(0)(uidx).io.datIn(0).payload.blkData := io.inputSeq(uidx*2).blkData
    switches(0)(uidx).io.datIn(0).valid := io.inputSeq(uidx*2).destId(asso_tcc_id)
    switches(0)(uidx).io.datIn(1).payload.blkData := io.inputSeq(uidx*2+1).blkData
    switches(0)(uidx).io.datIn(1).valid := io.inputSeq(uidx*2+1).destId(asso_tcc_id)

    io.outputSeq(uidx*2) << switches.last(uidx).io.datOut(0)
    io.outputSeq(uidx*2+1) << switches.last(uidx).io.datOut(1)
  }

  // control path
  for (stgIdx <- 0 until nConnStgs+1) {
    for (uId <- 0 until nUnitsStg) {
      switches(stgIdx)(uId).io.en := io.en
      val validSigs = Vec(for (i <- switches(stgIdx)(uId).io.datIn) yield i.valid).asBits.asUInt
      switches(stgIdx)(uId).io.switchCtrl := validSigs.muxListDc(
        for (i <- 0 until pow(2, validSigs.getWidth).toInt) yield (i, if (i == 1) True else False)
      )
    }
  }
}
