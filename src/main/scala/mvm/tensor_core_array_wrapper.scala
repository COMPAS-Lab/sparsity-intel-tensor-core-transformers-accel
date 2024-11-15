package mvm

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import config._
import intel_ips._
import scala.math.{min, pow, ceil}

case class MultiPortStream(dWidth: Int, addrWidth: Int, hasAlmostFull: Boolean, hasAlmostEmpty: Boolean) extends Bundle with IMasterSlave {
  val start, select = Bool()
  val data = UInt(dWidth bits)
  val addr = UInt(addrWidth bits)
  val almost_empty = if (hasAlmostEmpty) Bool() else null
  val almost_full = if (hasAlmostFull) Bool() else null
  val port_error = Bool()

  override def asMaster(): Unit = {
    out(data)
    out(start, select, addr)
    if (hasAlmostFull) in(almost_full)
    in(port_error)
  }

  override def asSlave(): Unit = {
    in(data)
    out(start, select, addr)
    if (hasAlmostEmpty) in(almost_empty)
    in(port_error)
  }
}

class tensor_core_array_wrapper(array_col: Int, array_row: Int, chain_len: Int,
                                idx_width: IdxWidth, mat_a_col: Int,
                                num_hbms: Int, row_buffer_depth: Int,
                               ) extends Component {
  val io = new Bundle {
    val start, iter = in UInt (8 bits)
    val in_buffer_id = in UInt (16 bits)
    val rd_addr, wr_addr = in UInt (32 bits)
    val load_start = in UInt (32 bits)
    val hbm_ready = Array.fill(num_hbms)(in Bool())
    // TODO: temp ports for idx gen only, deprecated in the future
    val tcarray_in = Vec(slave(MultiPortStream(256, 32, false, true)), 5)
    val tcarray_out = Vec(master(MultiPortStream(256, 32, true, false)), 2)
  }

  // input list:
  // tcarray_in_0\1: row input
  // tcarray_in_2\3: col input
  // tcarray_in_4: index input
  noIoPrefix()
  val clrn = ClockDomain.current.readResetWire
  ClockDomain.current.clock.unsetName().setName("clk")
  ClockDomain.current.reset.unsetName().setName("clrn")


  for (i <- io.hbm_ready.indices) {
    io.hbm_ready(i).unsetName().setName("hbm_" + i + "_ready")
  }

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

  val idxGenRegion = new Area {
    val idxInStart, idxInSelect = Reg(Bool(), init = False)
    val loadStartCC = BufferCC(io.load_start(0), init = False)
    val idxGenerator = new IndexGenerator(array_col, idx_width.c, BigInt("1"*idx_width.c, 2))
    // index generator connection
    val hbmData = Delay(
      io.tcarray_in(4).data(idx_width.c * array_col - 1 downto 0).subdivideIn(idx_width.c bits), 2)
    val hbmDataTlast = Bits(array_col bits)
    for (i <- idxGenerator.io.seqIn.indices) {
      idxGenerator.io.seqIn(i).payload := IndexData(hbmData(i), B(1, array_col bits) |<< i)
      idxGenerator.io.seqIn(i).valid := hbmData(i).msb
      hbmDataTlast(i) := hbmData(i).msb
    }
    //TODO: fix this temp connection
    idxGenerator.io.lastGrpIns := hbmDataTlast
    val idxGenFifoFast, idxGenFifoSlow = StreamFifo(IndexData(idx_width.c, array_col), 128)
    idxGenFifoSlow.io.push << idxGenerator.io.seqOut
    idxGenFifoFast.io.push.payload <> idxGenerator.io.seqOut.payload
    idxGenFifoFast.io.push.valid := idxGenFifoSlow.io.push.fire

    // index read control
    val idxRdFsm = new StateMachine {
      val rdWordCounter = Counter(mat_a_col / (chain_len * 3))
      val startAssertCounter = Counter(2 bits)

      val sIdleIdx: State = new State with EntryPoint {
        onEntry {
          rdWordCounter.clear()
          startAssertCounter.clear()
          idxInStart.clear()
          idxInSelect.clear()
        }
        whenIsActive {
          when(loadStartCC.rise() && io.hbm_ready(4)) {
            goto(sWaitIdx)
          }
        }
      }

      val sWaitIdx: State = new State {
        whenIsActive {
          when(startAssertCounter < 3) {
            idxInStart.set()
            startAssertCounter.increment()
          }.otherwise {
            idxInStart.clear()
          }

          when(io.tcarray_in(4).port_error)(goto(sIdleIdx))
            .elsewhen(startAssertCounter.willOverflow && ~(io.tcarray_in(4).almost_empty)) {
              goto(sSendIdx)
            }
        }
      }

      val sSendIdx: State = new State {
        whenIsActive {
          rdWordCounter.increment()
          when(rdWordCounter.willOverflow)(goto(sIdleIdx))
        }
        onExit(idxInSelect.clear())
      }
    }

    io.tcarray_in(4).addr := idxRdFsm.rdWordCounter.resized
    io.tcarray_in(4).start <> idxInStart
    io.tcarray_in(4).select := idxInSelect & idxGenFifoFast.io.push.ready & idxGenFifoSlow.io.push.ready
  }

  val selectTcarrayIn, startTCarrayIn = Reg(Bool()) init False
  val selectTcarrayOut, startTCarrayOut = Reg(Bool()) init False

  val data2TcarrayCol = Vec(Stream(BfpBlockWithIdx(88, idx_width.r, 0, 0)), array_col)
  val data2TcarrayRow = Vec(Stream(UInt(88 bits)), array_row)

  val dataColIn = Stream(UInt(data2TcarrayCol(0).payload.getBitsWidth bits))
  val dataRowIn = Stream(UInt(data2TcarrayRow(0).payload.getBitsWidth bits))
  dataColIn.payload := io.tcarray_in(0).data(data2TcarrayCol(0).payload.getBitsWidth - 1 downto 0)
  dataColIn.valid := RegNext(io.tcarray_in(0).select)
  dataRowIn.payload := io.tcarray_in(2).data(data2TcarrayRow(0).payload.getBitsWidth - 1 downto 0)
  dataRowIn.valid := RegNext(io.tcarray_in(2).select)

  val dataInColShiftRegs = new InputShiftReg(data2TcarrayCol(0).payload.getBitsWidth, array_col)
  dataInColShiftRegs.io.pushIn <> dataColIn
  for (i <- 0 until array_col) {
    val dataInColShiftRegsOut = BfpBlockWithIdx(88, idx_width.r, 0, 0)
    dataInColShiftRegsOut.fromUInt(dataInColShiftRegs.io.dataOut(i).payload)
    data2TcarrayCol(i) << dataInColShiftRegs.io.dataOut(i).translateWith(dataInColShiftRegsOut)
  }
  val dataInRowShiftRegs = new InputShiftReg(data2TcarrayRow(0).payload.getBitsWidth, array_row)
  dataInRowShiftRegs.io.pushIn <> dataRowIn
  for (i <- 0 until array_row) (data2TcarrayRow(i) <> dataInRowShiftRegs.io.dataOut(i))

  val tcArray = new TensorCoreChainArray(
    array_col = array_col,
    array_row = array_row,
    chain_len = chain_len,
    idx_width = idx_width,
    col_buffer_depth = 128,
    row_buffer_depth = row_buffer_depth,
    out_buf_delay = 4,
    output_fifo_depth = 512,
    output_width = 24,
    inout_pipe_delay = 4
  )

  val rowIdCount = Counter(128)
  when(tcArray.io.matBLoad(0).fire) {rowIdCount.increment()}

  tcArray.io.matALoad <> data2TcarrayCol
  tcArray.io.matBLoad <> data2TcarrayRow
  tcArray.io.sortedColIdxSlow << idxGenRegion.idxGenFifoSlow.io.pop
  tcArray.io.sortedColIdxFast << idxGenRegion.idxGenFifoFast.io.pop
  tcArray.io.colIdxFifoNotEmpty := True
  tcArray.io.calEn := io.start(0).rise()
  tcArray.io.configRowBuffWrBound := U(24, 16 bits).resized

  val rdFsm = new StateMachine {
    val rdWordCounter = Counter(mat_a_col / (chain_len * 3))
    val startAssertCounter = Counter(2 bits)

    val ports_err_reduce = Vec(for (i <- 0 until io.tcarray_in.length - 1)
      yield io.tcarray_in(i).port_error)
    val inAlmostEmpty = Vec(for (i <- 0 until io.tcarray_in.length - 1)
      yield io.tcarray_in(i).almost_empty)

    val sIdle: State = new State with EntryPoint {
      onEntry {
        rdWordCounter.clear()
        startAssertCounter.clear()
        startTCarrayIn.clear()
        selectTcarrayIn.clear()
      }
      whenIsActive {
        when(io.load_start(0).rise() && Vec(io.hbm_ready.slice(0, 4)).asBits.andR) {
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

        when(ports_err_reduce.asBits.orR)(goto(sIdle))
          .elsewhen(startAssertCounter.willOverflow && ~(inAlmostEmpty.asBits.orR)) {
            goto(sSend)
          }
      }
    }

    val sSend: State = new State {
      whenIsActive {
        rdWordCounter.increment()
        when(rdWordCounter.willOverflow)(goto(sIdle))
      }
      onExit(selectTcarrayIn.clear())
    }
  }

  //out logic
  //split output rows into groups of out_grp_size
  val OUT_GRP_SIZE = tcArray.io.res.size / io.tcarray_out.size

  for (g <- 0 until tcArray.io.res.size / OUT_GRP_SIZE) {
    val wrInitCount = Counter(2 bits)
    val outValid =
      List.tabulate(OUT_GRP_SIZE)(i => tcArray.io.res(g * OUT_GRP_SIZE + i).valid).reduce((a, b) => a && b)
    val outPop = Reg(Bool()) init False
    val dataOutStream = Stream(UInt((24 * 3 + idx_width.r) * OUT_GRP_SIZE bits))

    when(outValid.rise() && ~wrInitCount.willOverflowIfInc) {
      wrInitCount.increment()
    }.elsewhen(outValid && wrInitCount.willOverflowIfInc) {
      wrInitCount.clear()
    }
    outPop := wrInitCount.willOverflowIfInc && io.tcarray_out(g).almost_full
    dataOutStream.valid := outValid
    // combine each group output payloads together in dataOutStream.payload
    // assuming the results from the same TCC shares the index
    for (outId <- 0 until OUT_GRP_SIZE) {
      val tcArrayResGrp = tcArray.io.res(g * OUT_GRP_SIZE + outId).payload.subdivideIn(3 slices)
      dataOutStream.payload((24 * 3 + idx_width.r) * (outId + 1) - 1 downto (24 * 3 + idx_width.r) * outId) :=
        tcArrayResGrp(0)(24 + idx_width.r - 1 downto 24) @@
          tcArrayResGrp(2)(23 downto 0) @@ tcArrayResGrp(1)(23 downto 0) @@ tcArrayResGrp(0)(23 downto 0)
    }
    dataOutStream.ready := outPop
    for (i <- 0 until OUT_GRP_SIZE) (tcArray.io.res(g * OUT_GRP_SIZE + i).ready := dataOutStream.ready)

    io.tcarray_out(g).start := ~wrInitCount.willOverflowIfInc
    io.tcarray_out(g).select := outPop && outValid
    io.tcarray_out(g).addr := io.wr_addr
    io.tcarray_out(g).data := dataOutStream.payload.resize(io.tcarray_out(g).data.getWidth bits)
  }

  for (elem <- io.tcarray_in.slice(0, 4)) {
    elem.start := startTCarrayIn
    elem.select := selectTcarrayIn
    elem.addr := io.rd_addr
  }

  // TODO: fix mem usage computation here
  //  generate mem usage report
//  val col_mem_size = tcArray.colMem.length * 3
//  val row_mem_size = tcArray.rowMem.length * 3
//  val fb_fifo_size = tcArray.tensorArray.length * tcArray.tensorArray(0).length * 2
//  println("total ram blocks: ", (col_mem_size + row_mem_size + fb_fifo_size))
}

object tensor_core_array_wrapper_gen extends App {
  val gen = new DefaultConfig
  val array_col = 12
  val array_row = 6
  val chain_len = 8
  val max_seq_len = 4480
  val ridx_width = 12
  val cidx_width = 9

  gen.defaultSpinalConfig.withoutEnumString().generate(new tensor_core_array_wrapper(
    array_col = array_col,
    array_row = array_row,
    chain_len = chain_len,
    idx_width = IdxWidth(ridx_width, cidx_width),
    mat_a_col = chain_len * array_row * 20 * 2,
    num_hbms = 7,
    row_buffer_depth = pow(2, log2Up(max_seq_len / 20)).toInt
  ))
}