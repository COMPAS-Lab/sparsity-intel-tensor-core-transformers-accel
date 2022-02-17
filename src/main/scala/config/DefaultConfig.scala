package config

import spinal.core._
import spinal.lib._
import spinal.core.sim._

class DefaultConfig {
  var defaultClockConfig = ClockDomainConfig(
    clockEdge = RISING,
    resetActiveLevel = LOW
  )

  var defaultSpinalConfig = SpinalConfig(
    mode = Verilog,
    targetDirectory = "./src/generated",
    defaultConfigForClockDomains = defaultClockConfig
  )

  var defaultSimConfig = SimConfig.withConfig(SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      resetActiveLevel = LOW)
  )).addSimulatorFlag("--x-assign 0 --x-initial 0").withWave(5)
}
