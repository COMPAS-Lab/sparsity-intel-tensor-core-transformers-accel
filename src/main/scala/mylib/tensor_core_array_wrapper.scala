package mylib

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import config._
import intel_ips._
import spinal.core.fiber.Handle
import util._

case class MultiPortStream(dWidth: Int, addrWidth: Int, hasAlmostFull: Boolean, hasAlmostEmpty: Boolean) extends Bundle with IMasterSlave {
  val start, select = Bool()
  val data = UInt(dWidth bits)
  val addr = UInt(addrWidth bits)
  val almost_empty = if(hasAlmostEmpty) Bool() else null
  val almost_full = if(hasAlmostFull) Bool() else null
  val port_error = Bool()

  override def asMaster(): Unit = {
    out(data)
    out(start, select, addr)
    if(hasAlmostFull) in(almost_full)
    in(port_error)
  }

  override def asSlave(): Unit = {
    in(data)
    out(start, select, addr)
    if(hasAlmostEmpty) in(almost_empty)
    in(port_error)
  }
}

class tensor_core_array_wrapper(array_col: Int, array_row: Int, chain_len: Int,
                                mat_a_row: Int, mat_a_col: Int, mat_b_col: Int) extends Component {
  val io = new Bundle {
    val start, iter = in UInt(8 bits)
    val in_buffer_id = in UInt(16 bits)
    val rd_addr, wr_addr = in UInt(32 bits)
    val load_start = in UInt(32 bits)
    val hbm_0_ready, hbm_1_ready, hbm_2_ready, hbm_3_ready, hbm_4_ready,
          hbm_5_ready, hbm_6_ready, hbm_7_ready = in Bool()
    val tcarray_in = Vec(slave(MultiPortStream(256, 32, false, true)), 4)
    val tcarray_out = Vec(master(MultiPortStream(256, 32, true, false)), 4)
  }

  noIoPrefix()
  clockDomain.clock.unsetName().setName("clk")
  clockDomain.reset.unsetName().setName("clrn")

  for (elem <- io.tcarray_in) {
    elem.start.setName(elem.start.getPartialName() + "_" + elem.getName())
    elem.select.setName(elem.select.getPartialName() + "_" + elem.getName())
    elem.data.setName(elem.data.getPartialName() + "_" + elem.getName())
    elem.addr.setName(elem.addr.getPartialName() + "_" + elem.getName())
    elem.almost_empty.setName(elem.almost_empty.getPartialName() + "_" + elem.getName())
    elem.port_error.setName(elem.port_error.getPartialName() + "_" + elem.getName())
  }
  
  for (elem <- io.tcarray_out) {
    elem.start.setName("start_" + elem.getName())
    elem.select.setName("select_" + elem.getName())
    elem.data.setName("data_" + elem.getName())
    elem.addr.setName("addr_" + elem.getName())
    elem.almost_full.setName("almost_full_" + elem.getName())
    elem.port_error.setName("port_error_" + elem.getName())
  }

  val selectTcarrayIn, startTCarrayIn = Reg(Bool()) init False
  val selectTcarrayOut, startTCarrayOut = Reg(Bool()) init False

  val dataIn = Vec(Stream(UInt(320 bits)), 2)
  val combinedDataIn0 = RegNext(io.tcarray_in(1).data @@ io.tcarray_in(0).data)
  val combinedDataIn1 = RegNext(io.tcarray_in(3).data @@ io.tcarray_in(2).data)
  combinedDataIn0.addAttribute("preserve_syn_only")
  combinedDataIn1.addAttribute("preserve_syn_only")
  dataIn(0).payload := combinedDataIn0(dataIn(0).payload.getWidth-1 downto 0)
  dataIn(0).valid := RegNext(selectTcarrayIn)
  dataIn(1).valid := RegNext(selectTcarrayIn)
  dataIn(1).payload := combinedDataIn1(dataIn(1).payload.getWidth-1 downto 0)

  val data2TcarrayCol = Vec(Stream(UInt(320 bits)), array_col)
  val data2TcarrayRow = Vec(Stream(UInt(320 bits)), array_row)

  val dataInColShiftRegs = new InputShiftReg(320, array_col)
  dataInColShiftRegs.io.pushIn <> dataIn(0)
  for (i <- 0 until array_col) (data2TcarrayCol(i) <> dataInColShiftRegs.io.dataOut(i))
  val dataInRowShiftRegs = new InputShiftReg(320, array_row)
  dataInRowShiftRegs.io.pushIn <> dataIn(1)
  for (i <- 0 until array_row) (data2TcarrayRow(i) <> dataInRowShiftRegs.io.dataOut(i))

  val tcArray = new SparseTensorCoreChainArray(array_col = array_col, array_row = array_row,
                                      chain_len = chain_len, out_buf_delay = chain_len*3-3,
                                      col_buf_max_depth = 128, row_buf_max_depth = 128,
                                      output_fifo_depth = 128, output_width = 24, 
                                      inout_pipe_delay = 4, dwidth = 16)

  tcArray.io.matALoad <> data2TcarrayCol
  for (rowIdx <- 0 until array_row) {
    tcArray.io.matBLoad(rowIdx).valid := data2TcarrayRow(rowIdx).valid
    tcArray.io.matBLoad(rowIdx).payload := data2TcarrayRow(rowIdx).payload(15 downto 0)
    data2TcarrayRow(rowIdx).ready := tcArray.io.matBLoad(rowIdx).ready
  }
  tcArray.io.configPorts.tccColBufferCnterRange := U(
      (mat_a_row / array_col) * (mat_a_col / 20), 16 bits)
  tcArray.io.configPorts.tccRowBufferCnterRange := U(
      (mat_b_col / array_row) * (mat_a_col/(chain_len * 20)), 16 bits)
  tcArray.io.configPorts.matBColsPerTccRow := U((mat_b_col/array_row), 16 bits)
  tcArray.io.configPorts.matAColSubGrpLen := U(mat_a_col/(chain_len * 20), 16 bits)
  tcArray.io.calEn := io.start(0).rise()

  val rdFsm = new StateMachine {
    val rdWordCounter = Counter(mat_a_col / (chain_len * 3))
    val startAssertCounter = Counter(2 bits)

    val ports_err_reduce = Vec(for (i <- 0 until io.tcarray_in.length)
                                  yield io.tcarray_in(i).port_error)
    val inAlmostEmpty = Vec(for (i <- 0 until io.tcarray_in.length)
                                  yield io.tcarray_in(i).almost_empty)

    val sIdle: State = new State with EntryPoint {
      onEntry {
        rdWordCounter.clear()
        startAssertCounter.clear()
        startTCarrayIn.clear()
        selectTcarrayIn.clear()
      }
      whenIsActive{
        when(io.load_start(0).rise() && io.hbm_0_ready) {
          goto(sWait)
        }
      }
    }

    val sWait: State = new State {
      whenIsActive {
        when(startAssertCounter < 3) {
          startTCarrayIn.set()
          startAssertCounter.increment()
        }.otherwise {
          startTCarrayIn.clear()
        }

        when(ports_err_reduce.asBits.orR) (goto(sIdle))
          .elsewhen (startAssertCounter.willOverflow && ~(inAlmostEmpty.asBits.orR)) {
            goto(sSend)
          }
      }
    }

    val sSend: State = new State {
      whenIsActive {
        rdWordCounter.increment()
        when(rdWordCounter.willOverflow) (goto(sIdle))
      }
      onExit(selectTcarrayIn.clear())
    }
  }

  //out logic
  //split output rows into groups of out_grp_size
  val OUT_GRP_SIZE = 1

  for (g <- 0 until tcArray.io.res.size/OUT_GRP_SIZE) {
    val wrInitCount = Counter(2 bits)
    val outValid =
      List.tabulate(OUT_GRP_SIZE)(i => tcArray.io.res(g*OUT_GRP_SIZE+i).valid).reduce((a, b) => a && b)
    val outPop = Reg(Bool()) init False
    val dataOutStream = Stream(UInt(72*OUT_GRP_SIZE bits))

    when(outValid.rise() && ~wrInitCount.willOverflowIfInc) {
      wrInitCount.increment()
    }.elsewhen(outValid && wrInitCount.willOverflowIfInc) {
      wrInitCount.clear()
    }
    outPop := wrInitCount.willOverflowIfInc && io.tcarray_out(g).almost_full
    dataOutStream.valid := outValid
    dataOutStream.payload :=
      List.tabulate(OUT_GRP_SIZE)(i => tcArray.io.res(g*OUT_GRP_SIZE+i).payload).reduce((a, b) => a @@ b)
    dataOutStream.ready := outPop
    for (i <- 0 until OUT_GRP_SIZE) (tcArray.io.res(g*OUT_GRP_SIZE+i).ready := dataOutStream.ready)

    io.tcarray_out(g).start := ~wrInitCount.willOverflowIfInc
    io.tcarray_out(g).select := outPop && outValid
    io.tcarray_out(g).addr := io.wr_addr
    io.tcarray_out(g).data := dataOutStream.payload.resize(io.tcarray_out(g).data.getWidth bits)
  }

  for (elem <- io.tcarray_in) {
    elem.start := startTCarrayIn
    elem.select := selectTcarrayIn
    elem.addr := io.rd_addr
  }
}

object tensor_core_array_wrapper_gen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    val array_col = 20
    val array_row = 4
    val chain_len = 10
    gen.defaultSpinalConfig.withoutEnumString().generate(new tensor_core_array_wrapper(
      array_col = array_col,
      array_row = array_row,
      chain_len = chain_len,
      mat_a_row = array_col*2*2,
      mat_a_col = chain_len*array_row*20*2,
      mat_b_col = chain_len*array_row*2*8*3*2 
    ))
  }
}