package intel_ips

import spinal.core._
import spinal.lib._

class scfifo(output_width: Int, depth: Int, ram_type: String, afull_thres: Int = -1) extends BlackBox {
  addGenerics(
    "lpm_width" -> output_width,
    "lpm_numwords" -> depth,
    "lpm_widthu" -> log2Up(depth),
    "add_ram_output_register" -> "ON",
    "enable_ecc" -> "FALSE",
    "intended_device_family" -> "Stratix 10",
    "lpm_hint" -> ("RAM_BLOCK_TYPE=" + ram_type),
    "lpm_showahead" -> "ON",
    "lpm_type" -> "scfifo",
    "overflow_checking" -> "ON",
    "underflow_checking" -> "ON",
    "use_eab" -> "ON",
  )

  if (afull_thres > 0) {
    addGeneric("almost_full_value", afull_thres)
  }

  val io = new Bundle {
    val clock = in Bool()
    val wrreq, rdreq = in Bool()
    val full, empty = out Bool()
    val data = in Bits(output_width bits)
    val q = out Bits(output_width bits)
    val aclr, sclr = in Bool()
    val almost_empty, almost_full = out Bool()
  }


  // disable the prefix
  noIoPrefix()
  // specify the tensor core main clock
  mapClockDomain(clock = io.clock, reset = io.sclr)
}