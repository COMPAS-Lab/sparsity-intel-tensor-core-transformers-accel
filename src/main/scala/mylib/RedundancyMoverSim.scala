package mylib

import spinal.core._
import spinal.core.sim._

object RedundancyMoverSim extends App {
  def spinalConfig = SpinalConfig(
    targetDirectory = "hw/gen",
    defaultConfigForClockDomains = ClockDomainConfig(
      resetActiveLevel = HIGH
      ),
    onlyStdLogicVectorAtTopLevelIo = true
    )
  def sim = SimConfig.withConfig(spinalConfig).withIVerilog.withVcdWave

  def repInsertion(candidates: Array[Int], numReps: Int): Array[Array[Int]] = {
    if(numReps > 1) {
      var res = Array.empty[Array[Int]]
      for(occupiedCandIdx <- 0 until (candidates.length - 2 * (numReps - 1 ))) {
        var subCand = candidates.takeRight(candidates.length - (occupiedCandIdx + 2))
        var subReps = numReps - 1
        var subRes = repInsertion(subCand, subReps)
        for(subResMember <- subRes) {
          res :+= (candidates(occupiedCandIdx) +: subResMember)
        }
      }
      res
    } else {
      for(i <- candidates) yield Array(i)
    }
  }

  val n_ports = 16
  sim.compile(new RedundancyMover(n_ports, 10)).doSim { dut =>
    val rep_placeholder = BigInt("1000000000", 2)
    val init_candidates = (1 until n_ports).toArray
    for (n_reps <- 1 to n_ports / 2) {
      var rep_choices = repInsertion(init_candidates, n_reps)
      for (sti <- rep_choices) {
        var input_vec = (for(d <- 1 to n_ports) yield BigInt(d.toString, 10)).reverse
        for (rep_idx <- sti) {
          input_vec = input_vec.updated(rep_idx, rep_placeholder)
        }
        for (i <- dut.io.inputSeq.indices) {
          dut.io.inputSeq(i) #= input_vec(i)
        }
        sleep(10)
        for (rep_idx <- sti) {
          input_vec = input_vec.updated(rep_idx, BigInt("-1", 10))
        }
        val expected_outs = input_vec.sorted.reverse
        var actual_outs = dut.io.outputSeq.map(p => if(p.toInt == 512) -1 else p.toInt).toList
        assert (expected_outs == actual_outs, "expected: " + expected_outs + ", actual: " + actual_outs)
      }
    }
  }
}
