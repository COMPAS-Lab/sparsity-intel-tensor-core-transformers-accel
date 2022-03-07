package mylib

import spinal.core._
import spinal.lib._

class bfp_converter(vector_len: Int, block_size: Int, bitwidth: Int,
                    fpmWidth: Int, bfpmWidth: Int) extends BlackBox {
  // bfpm width here stands for the tensor core input mant, which
  // includes sign bits and the extra 1.
  addGenerics(("V", vector_len), ("P", block_size), ("BIT", bitwidth),
    ("FPM", fpmWidth), ("BFPM", bfpmWidth-2))

  val io = new Bundle {
    val clk = in Bool()
    val rst_n = in Bool()
    val vector_rdy = in Bool()
    val in_vector_flatten = in UInt(vector_len * bitwidth bits)
    val outMants_flatten = out UInt(block_size * bfpmWidth bits)
    val outExp = out UInt(bitwidth-fpmWidth-1 bits)
    val valid_out = out Bool()
  }

  noIoPrefix()
  mapClockDomain(clock = io.clk, reset = io.rst_n, resetActiveLevel = LOW)

  addRTLPath("./src/main/sverilog/bfp_converter.sv")
  addRTLPath("./src/main/sverilog/vectorTransfer.sv")
  addRTLPath("./src/main/sverilog/largestExp.sv")
  addRTLPath("./src/main/sverilog/mantissaAdj.sv")
}

case class bfp_converter_wrapper(vector_len: Int, block_size: Int, bitwidth: Int,
                            fpmWidth: Int, bfpmWidth: Int) extends Component {
  val io = new Bundle {
    val in_vector_flatten = slave Flow(UInt(vector_len * bitwidth bits))
    val outBlk_flatten = master Flow(UInt(block_size * bfpmWidth + bitwidth - fpmWidth - 1 bits))
  }

    val core = new bfp_converter(vector_len, block_size, bitwidth, fpmWidth, bfpmWidth)
    core.io.in_vector_flatten <> io.in_vector_flatten.payload
    core.io.vector_rdy <> io.in_vector_flatten.valid
    io.outBlk_flatten.valid := core.io.valid_out
    io.outBlk_flatten.payload := core.io.outMants_flatten @@ core.io.outExp
}