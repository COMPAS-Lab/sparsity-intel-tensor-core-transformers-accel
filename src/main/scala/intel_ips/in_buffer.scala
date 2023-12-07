package intel_ips

import spinal.core._
import spinal.lib._

class in_buffer extends BlackBox {
  val io = new Bundle {
    val clock = in Bool()
    val wren = in Bool()
    val rdaddress, wraddress =  in UInt(7 bits)
    val data = in UInt(88 bits)
    val q = out UInt(88 bits)
  }

  // disable the prefix
  noIoPrefix()
  // specify the tensor core main clock
  mapClockDomain(clock = io.clock)
}

class simple_buffer(dwidth: Int, awidth: Int) extends BlackBox {
  val io = new Bundle {
    val clock = in Bool()
    val wren = in Bool()
    val rdaddress, wraddress = in UInt (awidth bits)
    val data = in UInt (dwidth bits)
    val q = out UInt (dwidth bits)
  }

  // disable the prefix
  noIoPrefix()
  // specify the tensor core main clock
  mapClockDomain(clock = io.clock)
}

class banked_buffer(dwidth: Int, awidth: Int, n_parallel_vecs: Int, id_width: Int, rd_delay: Int = 3) extends Component {
  val io = new Bundle {
    val wren = in Bool()
    val wraddress = in UInt (awidth bits)
    val rdaddress = in UInt (awidth + id_width bits)
    val dat_in = in UInt (dwidth bits)
    val dat_out = out UInt (dwidth * n_parallel_vecs + id_width bits)
  }

  val mems = Array.fill(n_parallel_vecs)(new simple_buffer(dwidth, awidth))
  val out_id = Delay(io.rdaddress(id_width-1 downto 0), rd_delay)

  val outGrp = Vec(UInt(dwidth bits), n_parallel_vecs)
  for (p <- 0 until n_parallel_vecs) {
    mems(p).io.wren := io.wren
    mems(p).io.wraddress := io.wraddress
    mems(p).io.rdaddress := io.rdaddress(awidth + id_width - 1 downto id_width)
    mems(p).io.data := io.dat_in
    outGrp(p) := mems(p).io.q
  }

  io.dat_out := Cat(outGrp.asBits, out_id.asBits).asUInt
}