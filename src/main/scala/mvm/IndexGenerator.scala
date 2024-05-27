package mvm

import spinal.core._
import spinal.lib._
import config.DefaultConfig
import scala.math.pow

class IndexGenerator(num_ports: Int, bitwidth: Int, placeholder: BigInt) extends Component {
  val io = new Bundle {
    val seqIn = in Vec(UInt(bitwidth bits), num_ports)
    val seqOut = out Vec(UInt(bitwidth bits), pow(2, log2Up(num_ports)).toInt)
  }

  val totalIns = pow(2, log2Up(num_ports)).toInt
  // n_stages is special because it starts from 4-input removers
  val nStgs = log2Up(num_ports) - 1 + 1
  val interRes = Vec(Vec(UInt(bitwidth bits), totalIns), nStgs)

  // assign inputs
  val firstStgRemovers = totalIns / 4
  val actualInIdxPerGroup = num_ports / firstStgRemovers
  var currSeqIdx = 0
  for (r <- 0 until firstStgRemovers) {
    for (i <- 0 until 4) {
      if (i < actualInIdxPerGroup) {
        interRes(0)(r * 4 + i) := io.seqIn(currSeqIdx)
        currSeqIdx += 1
      } else {
        interRes(0)(r * 4 + i) := U(placeholder)
      }
    }
  }

  // intermediate stages
  for (stg <- 0 until nStgs) {
    val nRemoverInputs = pow(2, stg).toInt * 4
    val nStgRemovers = totalIns / nRemoverInputs
    val removers = Array.fill(nStgRemovers)(new RedundancyRemover(nRemoverInputs, bitwidth, placeholder))
    for (r <- removers.indices) {
      val upperIns = Vec(
        for (i <- 0 until nRemoverInputs / 2) yield interRes(stg)(r * nRemoverInputs + i))
      val lowerIns = Vec(
        for (i <- nRemoverInputs / 2 until nRemoverInputs) yield interRes(stg)(r * nRemoverInputs + i))
      removers(r).io.lowerIns.payload <> lowerIns
      removers(r).io.lowerIns.valid <> True
      removers(r).io.upperIns.payload <> upperIns
      removers(r).io.upperIns.valid <> True
      val partialOuts = Vec(
        for(i <- 0 until nRemoverInputs) yield interRes(stg + 1)(r * nRemoverInputs + i))
      partialOuts := removers(r).io.outs
    }
  }

  // outputs
  // TODO: add width conversion here
  io.seqOut := Vec(
    for (i <- io.seqOut.indices) yield interRes.last(i))
}

object IndexGeneratorGen extends App {
  val config = new DefaultConfig
  config.defaultSpinalConfig.withoutEnumString().generate(new IndexGenerator(
    num_ports = 12, bitwidth = 11, placeholder = BigInt("10000000000", 2)
  )).printPruned()
}