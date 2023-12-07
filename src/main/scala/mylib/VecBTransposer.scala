package mylib

import config.DefaultConfig
import spinal.core._
import spinal.lib._
import intel_ips.out_asym_fifo
case class VecBTransposer(dwidth: Int, num_inputs: Int, chain_len: Int) extends Component {
  val io = new Bundle {
    val multiVecIn = slave Flow (UInt(dwidth * num_inputs bits))
    val singleVecOut = Vec(master Flow (UInt(dwidth * 20 bits)), chain_len)
  }

  // transposition fifo
  val transFifoGrp = Array.fill(chain_len, 20)(new out_asym_fifo(input_width = dwidth * num_inputs,
                                                                  output_width = dwidth,
                                                                  depth = num_inputs, id = 0))

  // ctrl counters, put inputs into every transpose fifo
  val loadCounter = Counter(chain_len * 20)
  val popCounter = Counter(num_inputs)

  // connection
  for (i <- 0 until chain_len; j <- 0 until 20) {
    when(io.multiVecIn.fire) {
      transFifoGrp(i)(j).io.wr_en := (loadCounter === i * 20 + j)
      loadCounter.increment()
    }.otherwise {
      transFifoGrp(i)(j).io.wr_en := False
    }
    transFifoGrp(i)(j).io.wr_data := io.multiVecIn.payload
  }

  for (c <- 0 until chain_len) {
    val outPayloadArray = for (tcId <- 0 until 20) yield transFifoGrp(c)(tcId).io.rd_data
    for (tcId <- 0 until 20) {transFifoGrp(c)(tcId).io.rd_en := popCounter > 0}
    io.singleVecOut(c).payload := Vec(outPayloadArray).asBits.asUInt
    io.singleVecOut(c).valid := popCounter > 0
  }

  // ctrl
  when(loadCounter.willOverflow) {
    popCounter.increment()
  }
}

object VecBTransposerGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.withoutEnumString().generate(
      VecBTransposer(16, 32, 10))
  }
}