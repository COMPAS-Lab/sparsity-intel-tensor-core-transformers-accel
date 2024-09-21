package intel_ips

import spinal.core._
import spinal.lib._

class scfifo(output_width: Int, depth: Int, ram_type: String) extends BlackBox {
  addGenerics(
    "LPM_WIDTH" -> output_width,
    "LPM_NUMWORDS" -> depth,
    "LPM_WIDTHU" -> log2Up(depth),
    "ADD_RAM_OUTPUT_REGISTER" -> "ON",
    "ENABLE_ECC" -> "FALSE",
    "INTENDED_DEVICE_FAMILY" -> "Stratix 10",
    "LPM_HINT" -> ("RAM_BLOCK_TYPE=" + ram_type),
    "LPM_SHOWAHEAD" -> "ON",
    "LPM_TYPE" -> "scfifo",
    "OVERFLOW_CHECKING" -> "ON",
    "UNDERFLOW_CHECKING" -> "ON",
    "USE_EAB" -> "ON",
  )
  val io = new Bundle {
    val clock = in Bool()
    val wrreq, rdreq = in Bool()
    val full, empty = out Bool()
    val data = in UInt(output_width bits)
    val q = out UInt(output_width bits)
    val aclr, sclr = in Bool()
    val almost_empty, almost_full, eccstatus = out Bool()
    val usedw = out UInt(log2Up(depth) bits)
  }


  // disable the prefix
  noIoPrefix()
  // specify the tensor core main clock
  mapClockDomain(clock = io.clock)
}