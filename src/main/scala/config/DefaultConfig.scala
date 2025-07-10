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
    targetDirectory = "./src/generated_1core",
    oneFilePerComponent = true,
    defaultConfigForClockDomains = defaultClockConfig,
    removePruned = true
  )

  var defaultSimConfig = SimConfig.withConfig(SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      resetActiveLevel = LOW)
  )).addSimulatorFlag("--x-assign 0 --x-initial 0").withWave(5)
}
