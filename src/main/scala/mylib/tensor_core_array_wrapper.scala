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
    val hbm_0_ready, hbm_1_ready, hbm_2_ready = in Bool()
    val tcarray_in = Vec(slave(MultiPortStream(256, 32, false, true)), 2)
    val tcarray_out = master(MultiPortStream(128, 32, true, false))
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

  io.tcarray_out.start.setName("start_" + io.tcarray_out.getName())
  io.tcarray_out.select.setName("select_" + io.tcarray_out.getName())
  io.tcarray_out.data.setName("data_" + io.tcarray_out.getName())
  io.tcarray_out.addr.setName("addr_" + io.tcarray_out.getName())
  io.tcarray_out.almost_full.setName("almost_full_" + io.tcarray_out.getName())
  io.tcarray_out.port_error.setName("port_error_" + io.tcarray_out.getName())

  val selectTcarrayIn, startTCarrayIn = Reg(Bool()) init False
  val selectTcarrayOut, startTCarrayOut = Reg(Bool()) init False
  val outPop = Reg(Bool()) init False

  val dataIn = Flow(UInt(320 bits))
  val combinedDataIn = RegNext(io.tcarray_in(1).data(63 downto 0) @@ io.tcarray_in(0).data) init 0
  dataIn.payload := combinedDataIn
  dataIn.valid := RegNext(selectTcarrayIn)

  val data2TcarrayCol = Vec(Flow(UInt(320 bits)), array_col)
  val data2TcarrayRow = Vec(Flow(UInt(320 bits)), chain_len * array_row)
  data2TcarrayRow := data2TcarrayRow.getZero
  data2TcarrayCol := data2TcarrayCol.getZero

  val dataInColIdx: UInt = (io.in_buffer_id & U(array_col-1)).resize(log2Up(array_col))
  data2TcarrayCol(dataInColIdx.resize(log2Up(data2TcarrayCol.length))) := dataIn
  val dataInRowIdx: UInt = io.in_buffer_id - (array_col - 1)
  data2TcarrayRow(dataInRowIdx.resize(log2Up(data2TcarrayRow.length))) := dataIn

  val dataOutStream = Stream(UInt(72 bits))

  val tcArray = new TensorCoreChainArray(array_col = array_col, array_row = array_row,
                                      chain_len = chain_len, out_buf_delay = 102-3,
                                      col_buf_max_depth = 128, row_buf_max_depth = 128,
                                      output_width = 24)

  tcArray.io.matALoad := data2TcarrayCol
  for (rowIdx <- 0 until array_row; chainIdx <- 0 until chain_len) {
    tcArray.io.matBLoad(rowIdx)(chainIdx) := data2TcarrayRow(rowIdx * chain_len + chainIdx)
  }
  tcArray.io.configPorts.tccColBufferCnterRange := U(
      (mat_a_row / array_col) * (mat_a_col / 10), 8 bits)
  tcArray.io.configPorts.tccRowBufferCnterRange := U(
      (mat_b_col / array_row) * (mat_a_col/(chain_len * 10)), 8 bits)
  tcArray.io.configPorts.matBColsPerTccRow := U((mat_b_col/array_row), 8 bits)
  tcArray.io.configPorts.matAColSubGrpLen := U(mat_a_col/(chain_len * 10), 8 bits)
  tcArray.io.calEn := io.start(0).rise()
  tcArray.io.res_id := io.in_buffer_id.resize(tcArray.io.res_id.getWidth)
  tcArray.io.res >> dataOutStream

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
  val wrInitCount = Counter(2 bits)
  val outValid = tcArray.io.res.valid
  dataOutStream.ready := outPop

  when(outValid.rise() && ~wrInitCount.willOverflowIfInc) {
    wrInitCount.increment()
  }.elsewhen(~outValid && wrInitCount.willOverflowIfInc) {
    wrInitCount.clear()
  }

  outPop := wrInitCount.willOverflowIfInc && io.tcarray_out.almost_full
  startTCarrayOut := ~wrInitCount.willOverflowIfInc
  selectTcarrayOut := outPop && outValid

  for (elem <- io.tcarray_in) {
    elem.start := startTCarrayIn
    elem.select := selectTcarrayIn
    elem.addr := io.rd_addr
  }

  io.tcarray_out.start := startTCarrayOut
  io.tcarray_out.select := selectTcarrayOut
  io.tcarray_out.addr := io.wr_addr
  io.tcarray_out.data := dataOutStream.payload.resize(128 bits)

  //  generate mem usage report
  val col_mem_size = tcArray.colMem.length * 3
  val row_mem_size = tcArray.rowMem.length * 3
  val out_fifo_size = tcArray.outputBuffer.length * 2
  val fb_fifo_size = tcArray.tensorArray.length * tcArray.tensorArray(0).length * 2
  println("total ram blocks: ", (col_mem_size + row_mem_size + out_fifo_size + fb_fifo_size))

}

object tensor_core_array_wrapper_gen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.generate(new tensor_core_array_wrapper(
      array_col = 22,
      array_row = 5,
      chain_len = 34,
      mat_a_row = 66,
      mat_a_col = 340,
      mat_b_col = 510
    ))
  }
}