package mvm

import spinal.core._
import spinal.lib._
import config.DefaultConfig
import scala.math.pow

class IndexGenerator(num_ports: Int, bitwidth: Int, placeholder: BigInt) extends Component {
  val io = new Bundle {
    val seqIn = Vec(slave Flow(UInt(bitwidth bits)), num_ports)
    val seqOut = master Flow(Vec(UInt(bitwidth bits), pow(2, log2Up(num_ports)).toInt))
    val lastGrpIn = in Bool()
    val lastGrpOut = out Bool()
  }

  private def combineLastGrpOut(grpInA: Bool, grpInB: Bool): Bool = {
    val grpOut = Bool()
    val grpOutFlag = Reg(UInt(2 bits)) init 0

    grpOut := False

    when(grpOutFlag === U"2'd0") {
      when(grpInA & grpInB) {
        grpOutFlag := U"2'd0"
        grpOut := True
      }.elsewhen(grpInA | grpInB) {
        grpOutFlag := U"2'd1"
      }.otherwise {
        grpOutFlag := U"2'd0"
      }
    }.elsewhen(grpOutFlag === U"2'd1") {
      when(grpInA | grpInB) {
        grpOutFlag := U"2'd0"
        grpOut := True
      }
    }
    grpOut
  }

  val totalIns = pow(2, log2Up(num_ports)).toInt
  val nStgs = log2Up(num_ports)
  val interRes = Vec(Vec(UInt(bitwidth bits), totalIns), nStgs - 1)

  // declare redremovers
  val removers = List.tabulate(nStgs)(
    i => Array.fill(pow(2, nStgs-i-1).toInt)(
      new RedundancyRemover(pow(2, i+1).toInt, bitwidth, placeholder)))

  for (stg <- 0 until nStgs) {
    val nRemoverInputs: Int = pow(2, stg+1).toInt
    if (stg == 0) {
      // deal with irregularity in the first stage
      // TODO: current hw generation logic does not support odd number of inputs
      for (currInIdx <- removers(stg).indices) {
        if ((currInIdx*2) < num_ports) {
          removers(stg)(currInIdx).io.upperIns.payload(0) <> io.seqIn(currInIdx * nRemoverInputs).payload
          removers(stg)(currInIdx).io.lowerIns.payload(0) <> io.seqIn(currInIdx * nRemoverInputs + 1).payload
          removers(stg)(currInIdx).io.upperIns.valid <> io.seqIn(currInIdx * nRemoverInputs).valid
          removers(stg)(currInIdx).io.lowerIns.valid <> io.seqIn(currInIdx * nRemoverInputs + 1).valid
          removers(stg)(currInIdx).io.lastGrpIn <> io.lastGrpIn
        }
      }
    } else {
      val equivInputRangeFactor = pow(2, stg+1).toInt
      for (currInIdx <- removers(stg).indices) {
        val equivInputRange = List(equivInputRangeFactor * currInIdx, equivInputRangeFactor * (currInIdx + 1))
        if (equivInputRange.last <= num_ports) {
          removers(stg)(currInIdx).io.upperIns <> removers(stg-1)(currInIdx * 2).io.outs
          removers(stg)(currInIdx).io.lowerIns <> removers(stg-1)(currInIdx * 2 + 1).io.outs
          removers(stg)(currInIdx).io.lastGrpIn <> combineLastGrpOut(
            removers(stg-1)(currInIdx * 2).io.lastGrpOut, removers(stg-1)(currInIdx * 2 + 1).io.lastGrpOut
          )
        } else if ((equivInputRange.sum / 2).toInt == num_ports) {
          removers(stg)(currInIdx).io.upperIns <> removers(stg-1)(currInIdx * 2).io.outs
          removers(stg)(currInIdx).io.lastGrpIn <> removers(stg-1)(currInIdx * 2).io.lastGrpOut
          removers(stg)(currInIdx).io.lowerIns.valid := removers(stg-1)(currInIdx * 2).io.outs.valid
          removers(stg)(currInIdx).io.lowerIns.payload :=
            Vec(for(pidx <- removers(stg)(currInIdx).io.lowerIns.payload.indices) yield U(placeholder))
        } else if ((equivInputRange.sum / 2).toInt < num_ports) {
          removers(stg)(currInIdx).io.upperIns <> removers(stg-1)(currInIdx * 2).io.outs
          removers(stg)(currInIdx).io.lowerIns <> removers(stg-1)(currInIdx * 2 + 1).io.outs
          removers(stg)(currInIdx).io.lastGrpIn <> combineLastGrpOut(
            removers(stg-1)(currInIdx * 2).io.lastGrpOut, removers(stg-1)(currInIdx * 2 + 1).io.lastGrpOut
          )
        }
      }
    }
  }

  private val actualOutSize: Int = removers.last(0).io.outs.payload.size
  val redundancyMover = new RedundancyMover(actualOutSize, bitwidth, placeholder)
  for (i <- removers.last(0).io.outs.payload.indices) {
    redundancyMover.io.inputSeq(i) := Mux(
      removers.last(0).io.outs.payload(i).msb,
      U(placeholder),
      removers.last(0).io.outs.payload(i))
  }
  io.seqOut.payload := redundancyMover.io.outputSeq
  io.seqOut.valid := Delay(removers.last(0).io.outs.valid, log2Up(actualOutSize) + 1, init = False)
  io.lastGrpOut := Delay(removers.last(0).io.lastGrpOut, log2Up(actualOutSize) + 1, init = False)
}

object IndexGeneratorGen extends App {
  val config = new DefaultConfig
  config.defaultSpinalConfig.withoutEnumString().generate(new IndexGenerator(
    num_ports = 12, bitwidth = 9, placeholder = BigInt("111111111", 2)
  )).printPruned()
}