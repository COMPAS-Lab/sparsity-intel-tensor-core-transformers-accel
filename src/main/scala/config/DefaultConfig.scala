package config

import spinal.core._
import spinal.lib._
import spinal.core.sim._

class DefaultConfig {
  var defaultClockConfig = ClockDomainConfig(
    clockEdge = RISING,
    resetActiveLevel = LOW,
    resetKind = SYNC
  )

  var defaultSpinalConfig = SpinalConfig(
    mode = Verilog,
    targetDirectory = "./src/generated_benes_core_16x40",
    oneFilePerComponent = true,
    defaultConfigForClockDomains = defaultClockConfig,
    removePruned = true
  )

  var defaultSimConfig = SimConfig.withConfig(SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      resetActiveLevel = LOW)
  )).addSimulatorFlag("--x-assign 0 --x-initial 0").withWave(5)

  def getConfigForSpecificPath(path: String): SpinalConfig = {
    var spinalConfig = SpinalConfig(
      mode = Verilog,
      targetDirectory = path,
      oneFilePerComponent = true,
      defaultConfigForClockDomains = defaultClockConfig,
      removePruned = true,
      bitVectorWidthMax = 5120,
    )

    spinalConfig
  }
}
