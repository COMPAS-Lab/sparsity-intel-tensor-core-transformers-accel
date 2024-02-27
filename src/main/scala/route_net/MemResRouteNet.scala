package route_net

import config.DefaultConfig
import spinal.core._
import spinal.lib._

case class MemResRouteNet(num_rep_ports: Int, num_rep_banks: Int, num_unrep_banks: Int,
                          num_outputs: Int, dwidth: Int) extends Component {
  //FIXME: hardcoded number of input and output ports
  // num_ports = num_rep_ports x num_rep_banks + num_unrep_banks
  // ports_width = dwidth
  val id_width = log2Up(num_outputs)
  val io = new Bundle {
    val ins_rep = Vec(Vec(slave Flow (UInt(dwidth + id_width bits)), num_rep_ports), num_rep_banks)
    val ins_unrep = Vec(slave Flow (UInt(dwidth + id_width bits)), num_unrep_banks)
    val outs = Vec(master Flow (UInt(dwidth bits)), num_outputs)
  }

  val colAssoFifos = Array.fill(num_outputs)(StreamFifo(UInt(dwidth bits), 32))

  // get id from inputs
  val allIns = Vec(Flow (UInt(dwidth + id_width bits)), num_rep_ports * num_rep_banks + num_unrep_banks)
  for (p <- 0 until num_rep_ports; b <- 0 until num_rep_banks) {
    allIns(b * num_rep_ports + p) << io.ins_rep(b)(p)
  }
  for (urep <- 0 until num_unrep_banks) {
    allIns(num_rep_ports * num_rep_banks + urep) << io.ins_unrep(urep)
  }

  // route inputs to fifos according to the
  val allInsD1 = Vec(Flow (UInt(dwidth bits)), allIns.size)
  for ((d1, s) <- (allInsD1, allIns).zipped) {
    d1.payload := Delay(s.payload(dwidth + id_width - 1 downto id_width), 1)
    d1.valid := Delay(s.valid, 1)
  }
  for (c <- 0 until num_outputs) {
    val allIdsForCurrCache = Reg(UInt(num_rep_ports * num_rep_banks + num_unrep_banks bits)) init 0
    for (i <- 0 until num_rep_ports * num_rep_banks + num_unrep_banks) {
      allIdsForCurrCache(i) := allIns(i).fire && (allIns(i).payload(id_width - 1 downto 0) === c)
    }
    val selectedIns = Delay(MuxOH(allIdsForCurrCache, allInsD1), 1)
    colAssoFifos(c).io.push <> selectedIns.toStream(null)
    io.outs(c) <> colAssoFifos(c).io.pop.toFlow
  }
}

object MemResRouteNetGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.withoutEnumString().generate(
      new MemResRouteNet(
        num_rep_ports = 20, num_rep_banks = 2, num_unrep_banks = 18,
        num_outputs = 20, dwidth = 16)
      )
  }
}