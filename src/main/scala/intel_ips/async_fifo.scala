package intel_ips

import spinal.core._
import spinal.lib._

class async_fifo(dwidth: Int, depth: Int) extends BlackBox {
  addGenerics(
    "DATA_WIDTH_A" -> dwidth,
    "DATA_WIDTH_B" -> dwidth,
    "ADDR_WIDTH_A" -> log2Up(depth),
    "ADDR_WIDTH_B" -> log2Up(depth),
    "ENABLE_SHOWHEAD" -> "ON",
    "RDSYNC_DELAYPIPE" -> 2,
    "WRSYNC_DELAYPIPE" -> 2,
    "UNDERFLOW_CHECKING" -> "ON",
    "OVERFLOW_CHECKING" -> "ON",
    "ADD_USEDW_MSB_BIT" -> "OFF",
    "WRITE_ACLR_SYNCH" -> "OFF",
    "READ_ACLR_SYNCH" -> "OFF",
    "ADD_RAM_OUTPUT_REGISTER" -> "OFF",
    "MAXIMUM_DEPTH" -> depth,
    "BYTE_EN_WIDTH" -> 1,
    "BYTE_SIZE" -> 8
  )
  val io = new Bundle {
    val data = in UInt(dwidth bits)
    val rdclk, wrclk, aclr = in Bool()
    val rdreq, wrreq = in Bool()
    val byteena = in Bool()
    val rdfull, wrfull, rdempty, wrempty = out Bool()
    val rdusedw, wrusedw = out UInt(log2Up(depth) bits)
    val q = out UInt(dwidth bits)
  }

  noIoPrefix()
}
