package mylib

import spinal.core.sim._
import spinal.core._
import spinal.lib._
import util.StreamDelay

import scala.util.Random

class Dut extends Component {
  val io = new Bundle {
    val sin = slave Stream (UInt(8 bits))
    val sout = master Stream (UInt(8 bits))
  }

  io.sout << StreamDelay(io.sin, 1)
}

object StreamDelaySim extends App{
  val config = SpinalConfig(targetDirectory = "simWorkspace")

  SimConfig.withConfig(config).withVcdWave.workspacePath("./simWorkspace").compile(new Dut).doSim { dut =>
    dut.clockDomain.forkStimulus(period = 10)

    var idx = 0
    while (idx < 100) {
      dut.io.sin.payload.randomize()
      dut.io.sin.valid.randomize()
      dut.io.sout.ready.randomize()
      dut.clockDomain.waitRisingEdge()
      idx += 1
    }
  }
}
