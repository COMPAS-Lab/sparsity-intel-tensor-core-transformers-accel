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

class dp_buffer(dwidth: Int, awidth: Int) extends BlackBox {
  val io = new Bundle {
    val clock = in Bool()
    val wren_a, wren_b = in Bool()
    val read_address_a, write_address_a = in UInt(awidth bits)
    val read_address_b, write_address_b = in UInt(awidth bits)
    val q_a, q_b = out UInt(dwidth bits)
    val data_a, data_b = in UInt(dwidth bits)
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

  val out_id = Delay(io.rdaddress(id_width - 1 downto 0), rd_delay)
  val outGrp = Vec(UInt(dwidth bits), n_parallel_vecs)

  if (n_parallel_vecs % 2 == 0) {
    val mems = Array.fill(n_parallel_vecs / 2)(new dp_buffer(dwidth, awidth))

    for (p <- 0 until n_parallel_vecs/2) {
      mems(p).io.wren_a := io.wren
      mems(p).io.write_address_a := io.wraddress
      mems(p).io.wren_b := Bool(false)
      mems(p).io.write_address_b.setAllTo(false)
      mems(p).io.data_a := io.dat_in
      mems(p).io.data_b.setAllTo(false)

      mems(p).io.read_address_a := io.rdaddress(awidth + id_width - 1 downto id_width)
      mems(p).io.read_address_b := io.rdaddress(awidth + id_width - 1 downto id_width)
      outGrp(p * 2) := mems(p).io.q_a
      outGrp(p * 2 + 1) := mems(p).io.q_b
    }

    io.dat_out := Cat(outGrp.asBits, out_id.asBits).asUInt
  } else {
    val mems = Array.fill(n_parallel_vecs)(new simple_buffer(dwidth, awidth))

    for (p <- 0 until n_parallel_vecs) {
      mems(p).io.wren := io.wren
      mems(p).io.wraddress := io.wraddress
      mems(p).io.rdaddress := io.rdaddress(awidth + id_width - 1 downto id_width)
      mems(p).io.data := io.dat_in
      outGrp(p) := mems(p).io.q
    }

    io.dat_out := Cat(outGrp.asBits, out_id.asBits).asUInt
  }
}