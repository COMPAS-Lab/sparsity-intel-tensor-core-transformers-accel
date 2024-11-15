package intel_ips

import spinal.core._
import spinal.lib._

class altera_syncram(bitwidth: Int,
                     depth: Int,
                     operation_mode: String,
                     ram_type: String) extends BlackBox {
  addGenerics(
    "address_aclr_b"  -> "NONE",
    "address_reg_b"  -> "CLOCK0",
    "clock_enable_input_a"  -> "BYPASS",
    "clock_enable_input_b"  -> "BYPASS",
    "clock_enable_output_b"  -> "BYPASS",
    "enable_force_to_zero"  -> "FALSE",
    "intended_device_family"  -> "Stratix 10",
    "lpm_type"  -> "altera_syncram",
    "numwords_a"  -> depth,
    "numwords_b"  -> depth,
    "operation_mode"  -> operation_mode,
    "outdata_aclr_b"  -> "NONE",
    "outdata_sclr_b"  -> "NONE",
    "outdata_reg_b"  -> "CLOCK0",
    "power_up_uninitialized"  -> "FALSE",
    "ram_block_type"  -> ram_type,
    "read_during_write_mode_mixed_ports"  -> "DONT_CARE",
    "widthad_a"  -> log2Up(depth),
    "widthad_b"  -> log2Up(depth),
    "width_a"  -> bitwidth,
    "width_b"  -> bitwidth,
    "width_byteena_a"  -> 1,
  )

  val io = new Bundle {
    val address_a, address_b = in UInt(log2Up(depth) bits)
    val clock0 = in Bool()
    val data_a = in UInt(bitwidth bits)
    val wren_a = in Bool()
    val q_b = out UInt(bitwidth bits)

    val address2_a, address2_b = in Bool()
    val aclr0, aclr1 = in Bool()
    val addressstall_a, addressstall_b = in Bool()
    val byteena_a, byteena_b = in Bool()
    val clock1 = in Bool()
    val clocken0, clocken1, clocken2, clocken3 = in Bool()
    val data_b = in UInt(bitwidth bits)
    val eccencbypass = in Bool()
    val eccencparity = in UInt(8 bits)
    val eccstatus = out Bool()
    val q_a = out UInt(bitwidth bits)

    val rden_a, rden_b = in Bool()
    val sclr = in Bool()
    val wren_b = in Bool()
  }

  // disable the prefix
  noIoPrefix()
  mapClockDomain(clock = io.clock0)
}

class spram_megafunc(bitwidth: Int, depth: Int, ram_type: String) extends Component {
  val io = new Bundle {
    val wren = in Bool()
    val rdaddress = in UInt(log2Up(depth) bits)
    val wraddress =  in UInt(log2Up(depth) bits)
    val data = in UInt(bitwidth bits)
    val q = out UInt(bitwidth bits)
  }

  val spram_core = new altera_syncram(
    bitwidth = bitwidth, depth = depth, operation_mode = "DUAL_PORT", ram_type = ram_type
  )
  spram_core.io.address_a := io.wraddress
  spram_core.io.address_b := io.rdaddress
  spram_core.io.data_a := io.data
  spram_core.io.wren_a := io.wren
  io.q := spram_core.io.q_b

  spram_core.io.aclr0.clear()
  spram_core.io.aclr1.clear()
  spram_core.io.address2_a.setAll()
  spram_core.io.address2_b.setAll()
  spram_core.io.addressstall_a.clear()
  spram_core.io.addressstall_b.clear()
  spram_core.io.byteena_a.setAll()
  spram_core.io.byteena_b.setAll()
  spram_core.io.clock1.setAll()
  spram_core.io.clocken0.setAll()
  spram_core.io.clocken1.setAll()
  spram_core.io.clocken2.setAll()
  spram_core.io.clocken3.setAll()
  spram_core.io.data_b.setAll()
  spram_core.io.eccencbypass.clear()
  spram_core.io.eccencparity.clearAll()
  spram_core.io.rden_a.setAll()
  spram_core.io.rden_b.setAll()
  spram_core.io.sclr.clearAll()
  spram_core.io.wren_b.clearAll()
}