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
    val hbm_0_ready, hbm_1_ready, hbm_2_ready, hbm_3_ready, hbm_4_ready, hbm_5_ready = in Bool()
    val tcarray_in = Vec(slave(MultiPortStream(256, 32, false, true)), 4)
    val tcarray_out = Vec(master(MultiPortStream(128, 32, true, false)), 2)
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
  val outPop = Reg(Bool()) init False

  val dataIn = Vec(Flow(UInt(320 bits)), 2)
  val combinedDataIn0 = RegNext(io.tcarray_in(1).data(63 downto 0) @@ io.tcarray_in(0).data) init 0
  val combinedDataIn1 = RegNext(io.tcarray_in(3).data(63 downto 0) @@ io.tcarray_in(2).data) init 0
  dataIn(0).payload := combinedDataIn0
  dataIn(0).valid := RegNext(selectTcarrayIn)
  dataIn(1).valid := RegNext(selectTcarrayIn)
  dataIn(1).payload := combinedDataIn1

  val data2TcarrayCol = Vec(Flow(UInt(320 bits)), array_col)
  val data2TcarrayRowTop = Vec(Flow(UInt(320 bits)), chain_len * array_row / 2)
  val data2TcarrayRowBot = Vec(Flow(UInt(320 bits)), chain_len * array_row / 2)
  data2TcarrayRowTop := data2TcarrayRowTop.getZero
  data2TcarrayRowBot := data2TcarrayRowBot.getZero
  data2TcarrayCol := data2TcarrayCol.getZero

  val dataInColIdx: UInt = (io.in_buffer_id & U(array_col-1)).resize(log2Up(array_col))
  data2TcarrayCol(dataInColIdx.resize(log2Up(data2TcarrayCol.length))) := dataIn(0)
  val dataInRowIdx: UInt = io.in_buffer_id - (array_col - 1)
  data2TcarrayRowTop(dataInRowIdx.resize(log2Up(data2TcarrayRowTop.length))) := dataIn(0)
  data2TcarrayRowBot(dataInRowIdx.resize(log2Up(data2TcarrayRowBot.length))) := dataIn(1)

  val dataOutStreamTop, dataOutStreamBot = Stream(UInt(72 bits))

  val tcArray = new TensorCoreChainArray(array_col = array_col, array_row = array_row,
                                      chain_len = chain_len, out_buf_delay = chain_len*3-3,
                                      col_buf_max_depth = 128, row_buf_max_depth = 128,
                                      output_width = 24)

  tcArray.io.matALoad := data2TcarrayCol
  for (rowIdx <- 0 until array_row; chainIdx <- 0 until chain_len) {
    if ((rowIdx * chain_len + chainIdx) < (array_row * chain_len / 2)) {
      tcArray.io.matBLoad(rowIdx)(chainIdx) := data2TcarrayRowTop(rowIdx * chain_len + chainIdx)
    } else {
      tcArray.io.matBLoad(rowIdx)(chainIdx) := data2TcarrayRowBot(rowIdx * chain_len + chainIdx - array_row * chain_len / 2)
    }
  }
  tcArray.io.configPorts.tccColBufferCnterRange := U(
      (mat_a_row / array_col) * (mat_a_col / 10), 8 bits)
  tcArray.io.configPorts.tccRowBufferCnterRange := U(
      (mat_b_col / array_row) * (mat_a_col/(chain_len * 10)), 8 bits)
  tcArray.io.configPorts.matBColsPerTccRow := U((mat_b_col/array_row), 8 bits)
  tcArray.io.configPorts.matAColSubGrpLen := U(mat_a_col/(chain_len * 10), 8 bits)
  tcArray.io.calEn := io.start(0).rise()
  tcArray.io.res_id := io.in_buffer_id.resize(tcArray.io.res_id.getWidth)
  tcArray.io.res_top >> dataOutStreamTop
  tcArray.io.res_bot >> dataOutStreamBot

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
  val outValid = tcArray.io.res_top.valid
  dataOutStreamTop.ready := outPop
  dataOutStreamBot.ready := outPop

  when(outValid.rise() && ~wrInitCount.willOverflowIfInc) {
    wrInitCount.increment()
  }.elsewhen(~outValid && wrInitCount.willOverflowIfInc) {
    wrInitCount.clear()
  }

  outPop := wrInitCount.willOverflowIfInc && io.tcarray_out(0).almost_full && io.tcarray_out(1).almost_full
  startTCarrayOut := ~wrInitCount.willOverflowIfInc
  selectTcarrayOut := outPop && outValid

  for (elem <- io.tcarray_in) {
    elem.start := startTCarrayIn
    elem.select := selectTcarrayIn
    elem.addr := io.rd_addr
  }

  io.tcarray_out(0).start := startTCarrayOut
  io.tcarray_out(0).select := selectTcarrayOut
  io.tcarray_out(0).addr := io.wr_addr
  io.tcarray_out(0).data := dataOutStreamTop.payload.resize(128 bits)
  io.tcarray_out(1).start := startTCarrayOut
  io.tcarray_out(1).select := selectTcarrayOut
  io.tcarray_out(1).addr := io.wr_addr
  io.tcarray_out(1).data := dataOutStreamBot.payload.resize(128 bits)

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
      array_col = 12,
      array_row = 8,
      chain_len = 34,
      mat_a_row = 96,
      mat_a_col = 204,
      mat_b_col = 816 
    ))
  }
}