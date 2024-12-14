package mvm

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import config._
import util._
import scala.math.{min, pow, ceil, floor}

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

  def disablePort(): Unit = {
    start := False
    select := False
    addr.clearAll()
    if (this.isMasterInterface) {
      data.clearAll()
    }
  }
}

class tensor_core_array_wrapper(array_col: Int, array_row: Int, chain_len: Int,
                                idx_width: IdxWidth, mat_a_col: Int,
                                num_hbms: Int
                               ) extends Component {
  val io = new Bundle {
    val start, iter = in UInt (8 bits)
    val lat_counter = out UInt (16 bits)
    val rd_addr, wr_addr = in UInt (32 bits)
    val load_start = in UInt (32 bits)
    val hbm_ready = Array.fill(num_hbms)(in Bool())
    // TODO: temp ports for idx gen only, deprecated in the future
    val tcarray_in = Vec(slave(MultiPortStream(256, 32, false, true)), 3)
    val tcarray_out = Vec(master(MultiPortStream(256, 32, true, false)), 2)
  }

  // input list:
  // tcarray_in_0: col input, idx input
  // tcarray_in_1/2: row input

  // shared tcarray in channel address table
  // io.load_start(n downto 0) === 0 -> tcArray.io.matBLoad(0)
  // io.load_start(n downto 0) === 1 -> tcArray.io.matBLoad(1)
  // io.load_start(n downto 0) === 2 -> tcArray.io.matBLoad(2)
  // io.load_start(n downto 0) === 3 -> tcArray.io.matBLoad(3)
  // io.load_start(n downto 0) === 4 -> tcArray.io.matBLoad(4)
  // io.load_start(n downto 0) === 5 -> tcArray.io.matBLoad(5)
  // io.load_start(n downto 0) === 6 -> idxGenerator

  // control regs:
  // io.start(0): start load
  // io.start(1): soft reset
  // io.start(2): cal en start

  //rdAddr: stop ptr for idx and row
  //wrAddr: stop ptr for col

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

  val loadStart = Delay(io.start(0), 6)
  val softClrn = Delay(io.start(1), 6)
  val calStart = Delay(io.start(2), 6)

  val softClrnArea = new ResetArea(softClrn, false) {
    val bufferSelCC = Delay(io.load_start, 4)
    val rdAddrCC = Delay(io.rd_addr, 4)
    val wrAddrCC = Delay(io.wr_addr, 4)

    val idxGenerator = new IndexGenerator(array_col, idx_width.c, BigInt("1" * idx_width.c, 2))
    val idxGenFifoFast, idxGenFifoSlow = StreamFifo(IndexData(idx_width.c, array_col), 128)
    // index generator connection
    val isIdxGenWaitingOuts = Reg(Bits(array_col bits), init=B(0))
    val isLastPlaceholderRecved = Reg(Bits(3 bits), init=B(0))
    val tcArrayIn4IdxGenValid = Bool()

    val tcArrayIn4IdxGen =
      io.tcarray_in(0).data(idx_width.c * array_col - 1 downto 0).subdivideIn(idx_width.c bits)

    for (i <- 0 until array_col) {
      val idxGenInValid, idxGenInLast = Bool()
      val lastGrpRaised = Reg(Bool(), init=False)

      when(isIdxGenWaitingOuts(i)) {
        idxGenInValid := False
        idxGenInLast := False
        when(lastGrpRaised) {
          isIdxGenWaitingOuts(i) := isLastPlaceholderRecved.orR
        }.otherwise {
          lastGrpRaised := idxGenerator.io.lastGrpOut
          isIdxGenWaitingOuts(i) :=
            ~(idxGenFifoSlow.io.push.ready & idxGenFifoFast.io.push.ready & idxGenerator.io.lastGrpOut)
        }
      }.otherwise {
        idxGenInValid := (~tcArrayIn4IdxGen(i).msb) & tcArrayIn4IdxGenValid
        idxGenInLast := tcArrayIn4IdxGen(i).msb & tcArrayIn4IdxGenValid
        isIdxGenWaitingOuts(i) := tcArrayIn4IdxGen(i).msb & tcArrayIn4IdxGenValid
        lastGrpRaised.clear()
      }

      idxGenerator.io.seqIn(i).payload := IndexData(tcArrayIn4IdxGen(i), B(1, array_col bits) |<< i)
      idxGenerator.io.seqIn(i).valid := idxGenInValid & idxGenFifoFast.io.push.ready & idxGenFifoSlow.io.push.ready
      idxGenerator.io.lastGrpIns(i) := idxGenInLast
    }

    // make sure both slow and fast fifo get the last placeholder
    when(isLastPlaceholderRecved(0)) {
      isLastPlaceholderRecved(1) := idxGenFifoSlow.io.push.ready
      isLastPlaceholderRecved(2) := idxGenFifoFast.io.push.ready
      when(isLastPlaceholderRecved.andR) {
        isLastPlaceholderRecved.clearAll()
      }
    }.otherwise {
      when(idxGenFifoSlow.io.push.ready & idxGenFifoFast.io.push.ready & idxGenerator.io.lastGrpOut) {
        isLastPlaceholderRecved.clearAll()
      }.otherwise {
        isLastPlaceholderRecved(0) := idxGenerator.io.lastGrpOut
        isLastPlaceholderRecved(1) := idxGenFifoSlow.io.push.ready
        isLastPlaceholderRecved(2) := idxGenFifoFast.io.push.ready
      }
    }

    idxGenFifoSlow.io.push.payload <> idxGenerator.io.seqOut.payload
    idxGenFifoSlow.io.push.valid :=
      (idxGenerator.io.seqOut.valid | idxGenerator.io.lastGrpOut | isLastPlaceholderRecved(0)) & idxGenFifoFast.io.push.ready
    idxGenFifoFast.io.push.payload <> idxGenerator.io.seqOut.payload
    idxGenFifoFast.io.push.valid :=
      idxGenerator.io.seqOut.valid | idxGenerator.io.lastGrpOut | isLastPlaceholderRecved(0) & idxGenFifoSlow.io.push.ready
    idxGenerator.io.seqOut.ready := idxGenFifoSlow.io.push.ready & idxGenFifoFast.io.push.ready

    // TC Array data path from HBM to TC Array
    val data2TcarrayRow = Vec(Stream(UInt(88 bits)), array_row)
    val data2TcarrayRowValid = Bits(array_row bits)
    for (i <- 0 until array_row) {
      data2TcarrayRow(i).payload := io.tcarray_in(0).data(87 downto 0)
      data2TcarrayRow(i).valid := data2TcarrayRowValid(i) & io.tcarray_in(0).select
    }

    val data2TcarrayCol = Vec(Stream(BfpBlockWithIdx(88, idx_width.r, 0, 0)), array_col)
    val MATA_CHAN_PER_GRP = 4
    val HBM_MATA_CHAN_GRP = Array(1, 2)
    val combDataFromHbm =
      Vec(for (ihbm <- HBM_MATA_CHAN_GRP) yield io.tcarray_in(ihbm).data)
        .asBits.subdivideIn(MATA_CHAN_PER_GRP slices)
    val tcArray = new TensorCoreChainArray(
      array_col = array_col,
      array_row = array_row,
      chain_len = chain_len,
      idx_width = idx_width,
      col_buffer_depth = 2048,
      row_buffer_depth = 512,
      out_buf_delay = 4,
      output_fifo_depth = 512,
      output_width = 12,
      inout_pipe_delay = 4,
      debug_en = true
    )

    tcArray.io.matALoad <> data2TcarrayCol
    tcArray.io.matBLoad <> data2TcarrayRow
    tcArray.io.sortedColIdxSlow << idxGenFifoSlow.io.pop
    tcArray.io.sortedColIdxFast << idxGenFifoFast.io.pop
    tcArray.io.colIdxFifoNotEmpty := idxGenFifoSlow.io.occupancy > 32
    tcArray.io.calEn := Delay(calStart.rise(), 3)
    tcArray.io.configRowBuffWrBound := Delay(io.iter, 3).resized
    io.lat_counter := Delay(tcArray.io.latCounter, 3)

    val idxGenRowSharedRdFsm = new StateMachine {
      val rdWordCounter = DynaCounter(32, rdAddrCC)
      // wait for multiport fifo depth / 8 + 16 cycles according to Gidel Doc
      val startAssertCounter = Counter(512/8+16)

      val ports_err_reduce = io.tcarray_in(0).port_error
      val inAlmostEmpty = io.tcarray_in(0).almost_empty

      val selStart, selSelect = Bool()
      tcArrayIn4IdxGenValid := False
      data2TcarrayRowValid.clearAll()

      selStart := False
      selSelect := False

      val sIdle: State = new State with EntryPoint {
        whenIsActive {
          rdWordCounter.clear()
          startAssertCounter.clear()
          when(loadStart.rise() && io.hbm_ready(0)) {
            goto(sWait)
            selStart := True
          }
        }
      }

      val sWait: State = new State {
        whenIsActive {
          startAssertCounter.increment()
          selStart := True

          when(ports_err_reduce.asBits.orR) {
            goto(sIdle)
          }.elsewhen(startAssertCounter.willOverflow && ~(inAlmostEmpty.asBits.orR)) {
            goto(sSend)
          }
        }
      }

      val sSend: State = new State {
        whenIsActive {
          switch(bufferSelCC(log2Up(tcArray.io.matBLoad.size + 1)-1 downto 0)) {
            for (i <- 0 until (tcArray.io.matBLoad.size + 1)) {
              if (i == tcArray.io.matBLoad.size) {
                is(i) {
                  tcArrayIn4IdxGenValid := True
                  selSelect := True
                  when(Vec(for(i <- tcArrayIn4IdxGen) yield i.msb).andR) {
                    goto(sPause)
                  }
                }
              } else {
                is(i) {
                  data2TcarrayRowValid(i) := True
                  selSelect := tcArray.io.matBLoad(i).ready
                }
              }
            }

            default {
              selSelect := False
            }
          }

          when(selSelect) {
            rdWordCounter.increment()
          }
          when(rdWordCounter.willOverflow) {
            goto(sIdle)
          }
        }
      }

      val sPause: State = new State {
        whenIsActive {
          when(rdWordCounter.willOverflow) {
            goto(sIdle)
          }.otherwise {
            when(~isIdxGenWaitingOuts.andR &
              idxGenFifoSlow.io.occupancy < 64 &
              idxGenFifoFast.io.occupancy < 64) {
              goto(sSend)
            }
          }
        }
      }
    }

    io.tcarray_in(0).addr.clearAll()
    io.tcarray_in(0).start <> idxGenRowSharedRdFsm.selStart
    io.tcarray_in(0).select := idxGenRowSharedRdFsm.selSelect

    // TC array col inputs ctrl
    val colRdFsm = new StateMachine {
      val rdWordCounter = DynaCounter(32, wrAddrCC).setName("colRdFsm_0_rdCounter")
      // wait for multiport fifo depth / 8 + 16 cycles according to Gidel Doc
      val startAssertCounter = Counter(512 / 8 + 16)

      val ports_err_reduce = io.tcarray_in(1).port_error
      val inAlmostEmpty = io.tcarray_in(1).port_error

      val chanStart = Bool()
      val chanSel = Bool()
      val tcColSel = Reg(Bits(array_col/MATA_CHAN_PER_GRP bits),
        init=B(array_col/MATA_CHAN_PER_GRP bits, 0 -> true, default -> false))

      chanStart := False
      chanSel := False
      data2TcarrayCol.foreach(_.valid := False)
      data2TcarrayCol.foreach(_.payload.setDefault())

      val sIdle: State = new State with EntryPoint {
        onEntry {
          rdWordCounter.clear()
          startAssertCounter.clear()
        }
        whenIsActive {
          when(calStart.rise() && Vec(io.hbm_ready.slice(1, 5)).andR) {
            goto(sWait)
          }
        }
      }

      val sWait: State = new State {
        whenIsActive {
          chanStart := True
          startAssertCounter.increment()

          when(ports_err_reduce) {
            goto(sIdle)
          }.elsewhen(startAssertCounter.willOverflow && ~inAlmostEmpty) {
            goto(sSend)
          }
        }
      }

      val sSend: State = new State {
        whenIsActive {
          for (c <- 0 until array_col/MATA_CHAN_PER_GRP) {
            val colWidth = data2TcarrayCol(c).payload.getBitsWidth
            for (gid <- 0 until MATA_CHAN_PER_GRP) {
              val colPayload = combDataFromHbm(gid).resize(colWidth)
              // don't push padded data into col buffer, those data are for hbm channel's intra col alignment
              data2TcarrayCol(c * MATA_CHAN_PER_GRP + gid).valid :=
                tcColSel(c) & ~(colPayload.resizeLeft(2) === B"2'b10")
              when(tcColSel(c)) {
                data2TcarrayCol(c * MATA_CHAN_PER_GRP + gid).payload.fromUInt(colPayload.asUInt)
              }
            }
          }
          //TODO: parameterize this
          val colReadys = Bits(MATA_CHAN_PER_GRP * ceil(array_col/MATA_CHAN_PER_GRP).toInt bits)
          for (cid <- colReadys.bitsRange) {
            if (cid < data2TcarrayCol.length) {
              colReadys(cid) := data2TcarrayCol(cid).ready
            } else {
              colReadys(cid) := True
            }
          }
          val tcarrayColInRdyGrp = colReadys.subdivideIn(array_col/MATA_CHAN_PER_GRP slices)
          chanSel := OhMux(tcColSel, Vec(for(i <- tcarrayColInRdyGrp) yield i.andR))
          when(chanSel) {
            rdWordCounter.increment()
            tcColSel := tcColSel.rotateLeft(1)
          }
          when(rdWordCounter.willOverflow) {
            goto(sIdle)
          }
        }
      }
    }

    for(hbmChanId <- 1 until io.tcarray_in.size) {
      if (HBM_MATA_CHAN_GRP.contains(hbmChanId)) {
        io.tcarray_in(hbmChanId).addr.clearAll()
        io.tcarray_in(hbmChanId).start := colRdFsm.chanStart
        io.tcarray_in(hbmChanId).select := colRdFsm.chanSel
      } else {
        io.tcarray_in(hbmChanId).disablePort()
      }
    }

    //out logic
    //split output rows into groups of out_grp_size
    val OUT_GRP_SIZE = tcArray.io.res.size / io.tcarray_out.size

    for (g <- 0 until tcArray.io.res.size / OUT_GRP_SIZE) {
      val wrInitCount = Counter(512 / 8 + 16)
      val outValid =
        List.tabulate(OUT_GRP_SIZE)(i => tcArray.io.res(g * OUT_GRP_SIZE + i).valid).reduce((a, b) => a && b)
      val outPopEn, outStart = Reg(Bool()) init False
      val dataOutStream = Stream(UInt((24 * 3 + idx_width.r) * OUT_GRP_SIZE bits))

      when(outStart) {
        when(outPopEn) {
          outPopEn := dataOutStream.valid
          outStart := dataOutStream.valid
        }.otherwise {
          wrInitCount.increment()
          outPopEn := wrInitCount.willOverflow
        }
      }.otherwise {
        outStart := dataOutStream.valid
        wrInitCount.clear()
      }

      dataOutStream.valid := outValid
      // combine each group output payloads together in dataOutStream.payload
      // assuming the results from the same TCC shares the index
      for (outId <- 0 until OUT_GRP_SIZE) {
        val tcArrayResGrp = tcArray.io.res(g * OUT_GRP_SIZE + outId).payload.subdivideIn(3 slices)
        dataOutStream.payload((24 * 3 + idx_width.r) * (outId + 1) - 1 downto (24 * 3 + idx_width.r) * outId) :=
          tcArrayResGrp(0)(24 + idx_width.r - 1 downto 24) @@
            tcArrayResGrp(2)(23 downto 0) @@ tcArrayResGrp(1)(23 downto 0) @@ tcArrayResGrp(0)(23 downto 0)
      }
      dataOutStream.ready := outPopEn & ~io.tcarray_out(g).almost_full
      for (i <- 0 until OUT_GRP_SIZE) (tcArray.io.res(g * OUT_GRP_SIZE + i).ready := dataOutStream.ready)

      io.tcarray_out(g).start := outStart & ~outPopEn
      io.tcarray_out(g).select := dataOutStream.ready
      io.tcarray_out(g).addr.clearAll()
      io.tcarray_out(g).data := dataOutStream.payload.resize(io.tcarray_out(g).data.getWidth bits)
    }
  }

  // temporarily disable unused ports
//  io.tcarray_out(1).disablePort()

  // TODO: fix mem usage computation here
  //  generate mem usage report
//  val col_mem_size = softClrnArea.tcArray.bufferArea.colBuffer.length * 3
//  val row_mem_size = softClrnArea.tcArray.bufferArea.rowMem.length * 3
//  val fb_fifo_size = tcArray.tensorArray.length * tcArray.tensorArray(0).length * 2
//  println("total ram blocks: ", (col_mem_size + row_mem_size + fb_fifo_size))
}

object tensor_core_array_wrapper_gen extends App {
  val gen = new DefaultConfig
  val array_col = 12
  val array_row = 6
  val chain_len = 8
  val ridx_width = 12
  val cidx_width = 10

  gen.defaultSpinalConfig.withoutEnumString().generate(new tensor_core_array_wrapper(
    array_col = array_col,
    array_row = array_row,
    chain_len = chain_len,
    idx_width = IdxWidth(ridx_width, cidx_width),
    mat_a_col = chain_len * array_row * 20 * 2,
    num_hbms = 8
  ))
}