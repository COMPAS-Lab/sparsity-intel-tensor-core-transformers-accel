package mylib

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import config._
import intel_ips._
import util._
import route_net._

class SparseTensorCoreChainArray(array_col: Int, array_row: Int, chain_len: Int,
                                 dwidth: Int,
                                 out_buf_delay: Int, //should be (matBCols / array_row).ceil.toInt - 3
                                 col_buf_max_depth: Int, row_buf_max_depth: Int,
                                 output_fifo_depth: Int, output_width: Int,
                                 inout_pipe_delay: Int = 5) extends Component {
  val io = new Bundle {
    val matALoad = Vec(slave Stream (UInt(dwidth * 20 bits)), array_col)
    val matBLoad = Vec(slave Stream (UInt(dwidth bits)), array_row)
    val calEn = in Bool()
    // config ports
    val configPorts = in(TensorCoreChainArrayConfigPorts())
    val res = Vec(master Stream (UInt(output_width * 3 bits)), array_row)
  }
  // config
  val repBankedIds = Array(0, 1)
  val repTimes = array_col
  val matBVecPara = 32
  // input delays
  val configDelay = Delay(io.configPorts, 6)

  // instantiate tensor core chains and its transposer
  // FIXME: Transposer too large
  val tcArrayInTransposer = Array.fill(array_row, array_col)(VecBTransposer(dwidth, 32, chain_len))
  val tcArray = Array
    .fill(array_row, array_col)(new TensorCoreChainBf12(chain_len, out_buf_delay, output_fifo_depth, output_width))
  for (r <- 0 until array_row; c <- 0 until array_col) {
    tcArray(r)(c).setName("u_tc_core_r_" + r + "_c_" + c)
  }
  val matACaches = Array.fill(array_col)(new in_buffer)
  val matBCaches = Array.fill(array_row)(BankedMatCache(n_banks = array_col,
                                                        n_reps = array_col,
                                                        rep_bank_ids = repBankedIds,
                                                        bank_depth = 32,
                                                        n_parallel_vecs = matBVecPara,
                                                        dwidth = dwidth))
  //TODO: route net now fixed to have 20 inputs
  val memReqRouteNet = Array.fill(array_row)(MemReqRouteNet(5 + log2Up(array_col), 32))
  val memResRouteNet = Array.fill(array_row)(
    MemResRouteNet(
      num_rep_ports = 20, num_rep_banks = repBankedIds.length,
      num_unrep_banks = array_col - repBankedIds.length,
      num_outputs = 20, dwidth = dwidth * matBVecPara
      )
    )
  //bfp converters
  val colConverters = Array.fill(array_col)(new FixedBf12Converter)
  val rowConverters = Array.fill(array_row, array_col, chain_len)(new FixedBf12Converter)

  // Ctrl regs
  val rowBufferRdCounter = Array.fill(array_row) {
    DynaCounter(16, configDelay.tccRowBufferCnterRange + (chain_len - 1) * 2)
  }
  val colBufferRdCounter = Array.fill(array_col) {
    DynaCounter(16, configDelay.tccColBufferCnterRange)
  }
  val tensorLoadValid = Reg(Bits(array_col bits)) init 0
  val tensorDataValid = Reg(Bits(array_row bits)) init 0
  // Connections
  // input buffers
  for (c <- 0 until array_col) {
    colConverters(c).io.dataIn <> io.matALoad(c).toFlow
    val colBufferWrCounter = DynaCounter(16, configDelay.tccColBufferCnterRange)
    matACaches(c).io.wraddress := colBufferWrCounter.resize(matACaches(c).io.wraddress.getWidth)
    matACaches(c).io.data := colConverters(c).io.dataOut.payload
    //TODO: fix col buffer rd addr delay timing misalignment
    matACaches(c).io.rdaddress := Delay(colBufferRdCounter(c).resize(matACaches(c).io.rdaddress.getWidth), 2)
    matACaches(c).setName("matACache_" + c)

    when(colConverters(c).io.dataOut.fire) {
      colBufferWrCounter.increment()
      matACaches(c).io.wren := True
    } otherwise {
      colBufferWrCounter.clear()
      matACaches(c).io.wren := False
    }
  }
  // matB buffers
  for (r <- 0 until array_row) {
    matBCaches(r).setName("matBCache_" + r)
    matBCaches(r).io.datLoadIn <> io.matBLoad(r).toFlow
    for (b <- 0 until matBCaches(r).n_banks) {
      if (repBankedIds.contains(b)) {
        for (rep <- 0 until repTimes) {
          matBCaches(r).io.datRdAddrRepBanks(b)(rep) << memReqRouteNet(r).io.outs(b)
          // to bank res route net
          matBCaches(r).io.datRdOutRepBanks(b)(rep) >> memResRouteNet(r).io.ins_rep(b)(rep)
        }
      } else {
        matBCaches(r).io.datRdAddrUnrepBanks(b - repBankedIds.length) << memReqRouteNet(r).io.outs(b)
        // to bank res route net
        matBCaches(r).io.datRdOutUnrepBanks(b - repBankedIds.length) >> memResRouteNet(r).io
          .ins_unrep(b - repBankedIds.length)
      }
    }
  }

  for (r <- 0 until array_row) {
    for (c <- 0 until array_col) {
      // mat A indices to the route net
      memReqRouteNet(r).io.ins(c).payload := Cat(matACaches(c).io.data(4 downto 0), U(c, log2Up(array_col) bits)).asUInt
      memReqRouteNet(r).io.ins(c).valid := tensorLoadValid(c)
      // MemResRouteNet to each tensor core chain
      memResRouteNet(r).io.outs(c) >> tcArrayInTransposer(r)(c).io.multiVecIn
      // bfp converter to tensor core chains
      for (tcId <- 0 until chain_len) {
        rowConverters(r)(c)(tcId).io.dataIn <> tcArrayInTransposer(r)(c).io.singleVecOut(tcId)
        tcArray(r)(c).io.dataIn(tcId).payload := rowConverters(r)(c)(tcId).io.dataOut.payload(87 downto 8)
        tcArray(r)(c).io.expIn(tcId) := rowConverters(r)(c)(tcId).io.dataOut.payload(7 downto 0)
        tcArray(r)(c).io.dataIn(tcId).valid := rowConverters(r)(c)(tcId).io.dataOut.valid
      }

      tcArray(r)(c).io.loadCascadeIn := matACaches(c).io.q(87 downto 8)
      tcArray(r)(c).io.expCascadeIn := matACaches(c).io.q(7 downto 0)
      tcArray(r)(c).io.loadValid := Delay(tensorLoadValid(c), 1 + 2 + inout_pipe_delay)
      tcArray(r)(c).io.dataValid := Delay(tensorDataValid(r), 1 + 2 + inout_pipe_delay)
      // tensor core input iters: number of iterations to take matB sub columns
      //   it is the number of B columns for a tensor core chain row.
      //   it equals to the chain_loading_latency when the Dot Product
      //   hides the matA loading latency just fine.
      tcArray(r)(c).io.inputIters := configDelay.matBColsPerTccRow
      tcArray(r)(c).io.matAColSubGrpLen := configDelay.matAColSubGrpLen
    }
  }

  //ctrl signals
  for (c <- 0 until array_col) {tensorLoadValid(c) := io.matALoad(c).valid}
  for (r <- 0 until array_row) {tensorDataValid(r) := io.calEn}

  //output buffer path
  val outputBufferSelOut =
    Vec(Vec(Flow(UInt(output_width * 3 bits)), array_col), array_row)

  for (r <- 0 until array_row; c <- 0 until array_col) {
    val tcChainId = r * array_col + c
    outputBufferSelOut(r)(c).payload := tcArray(r)(c).io.res.payload.asBits.asUInt
    outputBufferSelOut(r)(c).valid := tcArray(r)(c).io.res.valid
    tcArray(r)(c).io.res.ready := True
  }

  // TODO: verify function of shift regs
  // val outShiftRegs = new Array[OutputShiftReg](array_row)
  // val outResDelayUnblocked = Vec(Flow (UInt(output_width * 3 bits)), array_row)
  // val outBuffer = new Array[StreamFifo[UInt]](array_row)
  val outBuffer = new Array[StreamOutAsymFifo](array_row)
  for (regIdx <- 0 until array_row) {
    // outShiftRegs(regIdx) = new OutputShiftReg(output_width * 3, array_col)

    // for (col <- 0 until array_col) {
    //temperarly break the back pressure from output shift register to
    // check timing
    // outShiftRegs(regIdx).io.resIn(col) << Delay(outputBufferSelOut(regIdx)(col), 4)
    // outShiftRegs(regIdx).io.resIn(col).valid := Delay(outputBufferSelOut(regIdx)(col).valid, 4)
    // outShiftRegs(regIdx).io.resIn(col).payload := Delay(outputBufferSelOut(regIdx)(col).payload, 4)
    // }

    // outResDelayUnblocked(regIdx) << outShiftRegs(regIdx).io.popOut
    // outBuffer(regIdx) = StreamFifo(UInt(outResDelayUnblocked(regIdx).payload.getWidth bits), 64)
    // outBuffer(regIdx).io.push.payload := Delay(outResDelayUnblocked(regIdx).payload, 4,
    //   init=outResDelayUnblocked(regIdx).payload.getZero)
    // outBuffer(regIdx).io.push.valid := Delay(outResDelayUnblocked(regIdx).valid, 4, init=False)

    outBuffer(regIdx) = new StreamOutAsymFifo(output_width * 3 * array_col, output_width * 3)
    outBuffer(regIdx).io.push.valid := Delay(outputBufferSelOut(regIdx)(0).valid, inout_pipe_delay)
    outBuffer(regIdx).io.push.payload :=
      Delay(
        List.tabulate(array_col)(i => outputBufferSelOut(regIdx)(i).payload).reduce((a, b) => a @@ b), inout_pipe_delay
        )

    io.res(regIdx) << outBuffer(regIdx).io.pop
  }
}

object SparseTensorCoreChainArrayGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    val array_col = 20
    val array_row = 4
    val chain_len = 10
    gen.defaultSpinalConfig.withoutEnumString().generate(
      new SparseTensorCoreChainArray(
        array_col = array_col,
        array_row = array_row,
        chain_len = chain_len,
        dwidth = 16,
        out_buf_delay = 5,
        col_buf_max_depth = 128,
        row_buf_max_depth = 128,
        output_fifo_depth = 32,
        output_width = 24,
        inout_pipe_delay = 4
        )
      )
  }
}