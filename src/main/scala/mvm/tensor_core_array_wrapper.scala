package mvm

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import config._
import util._
import intel_ips.hyperpipe
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
                                idx_width: IdxWidth, num_hbms: Int) extends Component {
  val io = new Bundle {
    val tc_ctrl = in UInt (8 bits)
    val mbvec_size = in UInt (16 bits)
    val lat_counter = out UInt (32 bits)
    val err_info = out Bits(32 bits)
    val mbidx_rd_bound, ma_rd_bound = in UInt (32 bits)
    val buf_ld_sel = in UInt (32 bits)
    val hbm_ready = Array.fill(num_hbms)(in Bool())
    // TODO: temp ports for idx gen only, deprecated in the future
    val tcarray_in = Vec(slave(MultiPortStream(256, 32, false, true)), 8)
    val tcarray_out = Vec(master(MultiPortStream(256, 32, true, false)), 2)
  }

  // input list:
  // tcarray_in_0: idx input
  // tcarray_in_1/2/3/4/5: row input
  // tcarray_in_6/7: mat b input

  // shared tcarray in channel address table
  // io.buf_ld_sel(n downto 0) === 1 -> tcArray.io.matBLoad
  // io.buf_ld_sel(n downto 0) === 0 -> idxGenerator

  // control regs:
  // io.tc_ctrl(0): start load
  // io.tc_ctrl(1): soft reset
  // io.tc_ctrl(2): cal en start
  // io.tc_ctrl(3): boundries push signal
  // io.tc_ctrl(4): perf counters rd select

  //mbidx_rd_bound: stop ptr for idx and row
  //ma_rd_bound: stop ptr for col

  // errors:
  // errors(0): compute error
  // errors(1): idx gen error

  val CTRL_REG_DELAY = 5

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

  val loadStart = Delay(io.tc_ctrl(0), CTRL_REG_DELAY)
  val softClrn = Delay(io.tc_ctrl(1), CTRL_REG_DELAY)
  val calStart = Delay(io.tc_ctrl(2), CTRL_REG_DELAY)
  val loadRdBounds = Delay(io.tc_ctrl(3), CTRL_REG_DELAY)
  val perfCounterSel = Delay(io.tc_ctrl(5 downto 4), CTRL_REG_DELAY)

  val softClrnArea = new ResetArea(softClrn, cumulative=false) {
    // ctrl registers
    val bufferSelCC = Delay(io.buf_ld_sel, CTRL_REG_DELAY)
    val mbidxRdBoundQue = new StreamFifoIp(UInt(io.mbidx_rd_bound.getWidth bits), 64, "MLAB")
    val maRdBoundQue = new StreamFifoIp(UInt(io.ma_rd_bound.getWidth bits), 64, "MLAB")
    val mbidxRdBoundIoDelayed = Delay(io.mbidx_rd_bound, CTRL_REG_DELAY)
    val maRdBoundIoDelayed = Delay(io.ma_rd_bound, CTRL_REG_DELAY)

    val mbidxRdBoundCC = Mux(bufferSelCC(0), mbidxRdBoundIoDelayed, mbidxRdBoundQue.io.pop.payload)
    val maRdBoundCC = maRdBoundQue.io.pop.payload
    val calTileStart = Bool()

    // simple rd bounds pushing logic
    mbidxRdBoundQue.io.push.payload := mbidxRdBoundIoDelayed
    maRdBoundQue.io.push.payload := maRdBoundIoDelayed
    when(loadRdBounds.rise()) {
      mbidxRdBoundQue.io.push.valid := True
      maRdBoundQue.io.push.valid := True
    }.otherwise {
      mbidxRdBoundQue.io.push.valid := False
      maRdBoundQue.io.push.valid := False
    }

    // double buffer flags
    val dBuffLdPtr, dBuffComputePtr = Reg(Bool()) init False
    val matADbuffRdy = Vec(Reg(Bool()), 2)
    matADbuffRdy.foreach(_.init(False))
    val currLdRdy = Mux(dBuffLdPtr, matADbuffRdy(1), matADbuffRdy(0))
    val currCompRdy = Mux(dBuffComputePtr, matADbuffRdy(1), matADbuffRdy(0))

    val idxGenFifoFast, idxGenFifoSlow = new StreamFifoIp(IndexData(idx_width.c, array_col), 512, "M20K", 256)
    // index generator connection
    val tcArrayIn4IdxGenValid = Bool()
    val IDX_IN_GRP_REUSE_FACTOR = 2

    if (idx_width.c * array_col / IDX_IN_GRP_REUSE_FACTOR > io.tcarray_in(0).data.getBitsWidth) {
      throw new Exception("hbm channel 0 not wide enough to hold indices")
    }

    // index input reuse logic
    val grped_index_data_in =
      Vec(Reg(UInt(idx_width.c * array_col / IDX_IN_GRP_REUSE_FACTOR bits)), IDX_IN_GRP_REUSE_FACTOR)
    if (IDX_IN_GRP_REUSE_FACTOR > 1) {
      val idx_in_mux_counter = Counter(IDX_IN_GRP_REUSE_FACTOR)
      when(io.tcarray_in(0).select) {
        idx_in_mux_counter.increment()
      }
      for (i <- grped_index_data_in.indices) {
        grped_index_data_in(i).init(0)
        when(idx_in_mux_counter.value === i) {
          grped_index_data_in(i) :=
            io.tcarray_in(0).data(idx_width.c * array_col / IDX_IN_GRP_REUSE_FACTOR - 1 downto 0)
        }
      }
    } else {
      grped_index_data_in(0) := io.tcarray_in(0).data(idx_width.c * array_col - 1 downto 0)
    }

    val tcArrayIn4IdxGen = grped_index_data_in.asBits.asUInt.subdivideIn(idx_width.c bits)

    // fake idx fifo
    idxGenFifoSlow.io.push.payload <> IndexData(tcArrayIn4IdxGen(0), ~B(0, array_col bits))
    idxGenFifoSlow.io.push.valid := io.tcarray_in(0).select & ~bufferSelCC(0)
    idxGenFifoFast.io.push.payload <> IndexData(tcArrayIn4IdxGen(1), ~B(0, array_col bits))
    idxGenFifoFast.io.push.valid := io.tcarray_in(0).select & ~bufferSelCC(0)

    // TC Array data path from HBM to TC Array
    val data2TcarrayRow = Stream(UInt(88 bits))
    val data2TcarrayRowValid = Bool()
    data2TcarrayRow.payload := Delay(io.tcarray_in(0).data(87 downto 0), 4)
    data2TcarrayRow.valid := Delay(data2TcarrayRowValid & io.tcarray_in(0).select, 4)

    val data2TcarrayCol = Vec(Stream(BfpBlockWithIdx(88, idx_width.r, 0, 0)), array_col)
    // val MATA_CHAN_PER_GRP = Array(7, 5)
    // val HBM_MATA_CHAN_GRP = Array(Array(1, 2, 3), Array(4, 5))
    val MATA_CHAN_PER_GRP = Array(12)
    val HBM_MATA_CHAN_GRP = Array(Array(1, 2, 3, 4, 5, 6, 7))
    val COL_IN_GRP_REUSE_FACTOR = 3

    for (i <- HBM_MATA_CHAN_GRP.indices) {
      val hbm_width = HBM_MATA_CHAN_GRP(i).length * 256
      val col_width = MATA_CHAN_PER_GRP(i) * (idx_width.r + 88) / COL_IN_GRP_REUSE_FACTOR
      if (col_width > hbm_width) {
        throw new Exception("hbms for cols are not wide enough")
      }
    }

    val combDataFromHbm: Array[Vec[Bits]] = Array.ofDim[Vec[Bits]](HBM_MATA_CHAN_GRP.length)
    for (i <- HBM_MATA_CHAN_GRP.indices) {
      combDataFromHbm(i) = Vec(
        for (j <- HBM_MATA_CHAN_GRP(i)) yield io.tcarray_in(j).data
      ).asBits(MATA_CHAN_PER_GRP(i) * (88 + idx_width.r) - 1 downto 0).subdivideIn(MATA_CHAN_PER_GRP(i) slices)
    }

    // FIXME: dangerous! starting calc only when it receives all mat a
    // to walk around shared mat a input problem.
    // must make sure the col buffer is large enough to use this.
    val matAFullyLoaded = Reg(Bool(), init=False)
    val idxFifoLoaded = Bool()
    val tcArray = new TensorCoreChainArray(
      array_col = array_col,
      array_row = array_row,
      chain_len = chain_len,
      idx_width = idx_width,
      col_buffer_depth = 2048,
      row_buffer_depth = 512,
      out_buf_delay = 4,
      output_fifo_depth = 128,
      output_width = 24,
      inout_pipe_delay = 5,
      n_out_chans = 2,
      n_words_outchan = 2,
      debug_en = false,
    )

    tcArray.io.matALoad <> data2TcarrayCol
    tcArray.io.matBLoad <> data2TcarrayRow
    tcArray.io.sortedColIdxSlow << idxGenFifoSlow.io.pop
    tcArray.io.sortedColIdxFast << idxGenFifoFast.io.pop
    // start fulfillment signal of computation
    // as long as one of the idx fifos is full enough,
    // the computation can start
    tcArray.io.colIdxFifoNotEmpty :=
      currCompRdy & (idxGenFifoFast.io.almostFull | idxGenFifoSlow.io.almostFull | idxFifoLoaded)
    tcArray.io.calEn := calTileStart
    tcArray.io.configRowBuffWrBound := Delay(io.mbvec_size, CTRL_REG_DELAY).resized
    tcArray.io.matADbuffWrPtr := dBuffLdPtr
    tcArray.io.matADbuffRdPtr := dBuffComputePtr
    tcArray.io.clrCounters := calStart

    // index gen and mat b load ctrl
    val idxGenRowSharedRdFsm = new StateMachine {
      val rdWordCounter = DynaCounter(32, mbidxRdBoundCC)
      // wait for multiport fifo depth / 8 + 16 cycles according to Gidel Doc
      val startAssertCounter = Counter(4)
      val bdPopDlyCounter = Counter(CTRL_REG_DELAY + 2)
      val isNextBdPoped, isCurrCompFinished = Reg(Bool(), init=False)

      val ports_err_reduce = io.tcarray_in(0).port_error

      val selStart, selSelect = Bool()
      tcArrayIn4IdxGenValid := False
      data2TcarrayRowValid.clearAll()

      selStart := False
      selSelect := False
      mbidxRdBoundQue.io.pop.ready := False
      idxFifoLoaded := False

      val sIdle: State = new State with EntryPoint {
        whenIsActive {
          rdWordCounter.clear()
          startAssertCounter.clear()
          when(loadStart.rise() && io.hbm_ready(0)) {
            goto(sWait)
          }
        }
      }

      val sWait: State = new State {
        whenIsActive {
          when(ports_err_reduce.asBits.orR) {
            goto(sIdle)
          }.elsewhen(~startAssertCounter.willOverflowIfInc) {
            startAssertCounter.increment()
            selStart := True
          }.elsewhen(~io.tcarray_in(0).almost_empty) {
            goto(sSend)
          }
        }
      }

      val sSend: State = new State {
        whenIsActive {
          when(bufferSelCC(0)) {
            data2TcarrayRowValid := True
            selSelect := tcArray.io.matBLoad.ready
            when(rdWordCounter.willOverflow) {
              goto(sIdle)
            }
          }.otherwise{
            tcArrayIn4IdxGenValid := True
            selSelect := True
            when(rdWordCounter.willOverflow) {
              idxFifoLoaded := True
              goto(sWaitComp)
            }.otherwise {
              when(Vec(for (i <- tcArrayIn4IdxGen) yield i.msb).andR) {
                goto(sPause)
              }
            }
          }

          when(selSelect) {
            rdWordCounter.increment()
          }
        }
      }

      val sPause: State = new State {
        whenIsActive {
          when(rdWordCounter.willOverflow) {
            goto(sIdle)
          }.otherwise {
            when(~idxGenFifoSlow.io.almostFull &
              ~idxGenFifoFast.io.almostFull) {
              goto(sSend)
            }
          }
        }
      }

      val sWaitComp: State = new State {
        // FIXME: bdPopDly should always be smaller than delay
        // from tc_array_in_0 to tcarray
        whenIsActive {
          isCurrCompFinished := Mux(isCurrCompFinished, True, dBuffComputePtr.edge())
          when(mbidxRdBoundQue.io.pop.valid) {
            when(~isNextBdPoped) {
              mbidxRdBoundQue.io.pop.ready := True
              isNextBdPoped := True
            }.otherwise {
              when(bdPopDlyCounter.willOverflowIfInc) {
                goto(sPause)
              }.otherwise {
                bdPopDlyCounter.increment()
              }
            }
          }.otherwise {
            goto(sIdle)
          }
        }
        onExit {
          isNextBdPoped := False
          isCurrCompFinished := False
          bdPopDlyCounter.clear()
        }
      }
    }

    io.tcarray_in(0).addr.clearAll()
    io.tcarray_in(0).start <> idxGenRowSharedRdFsm.selStart
    io.tcarray_in(0).select := idxGenRowSharedRdFsm.selSelect

    // TC array col inputs ctrl
    val colRdFsm = new StateMachine {
      val rdWordCounter = DynaCounter(32, maRdBoundCC).setName("colRdFsm_0_rdCounter")
      // wait for multiport fifo depth / 8 + 16 cycles according to Gidel Doc
      val startAssertCounter = Counter(4)

      val ports_err_reduce = io.tcarray_in(1).port_error | io.tcarray_in(2).port_error
      val inAlmostEmpty = io.tcarray_in(1).almost_empty | io.tcarray_in(2).almost_empty

      val chanStart = Bool()
      val chanSel = Bool()
      val isNextBdPoped = Reg(Bool()) init False
      val bdPopDlyCounter = Counter(CTRL_REG_DELAY + 2)
      val hbmGrpSel = Counter(COL_IN_GRP_REUSE_FACTOR)

      chanStart := False
      chanSel := False
      data2TcarrayCol.foreach(_.valid := False)
      data2TcarrayCol.foreach(_.payload.setDefault())
      maRdBoundQue.io.pop.ready := False

      val sIdle: State = new State with EntryPoint {
        whenIsActive {
          rdWordCounter.clear()
          startAssertCounter.clear()
          matAFullyLoaded := False
          when(calStart.rise() &&
            maRdBoundQue.io.pop.valid &&
            Vec(io.hbm_ready.slice(1, io.tcarray_in.size)).andR) {
            goto(sWait)
          }
        }
      }

      val sWait: State = new State {
        whenIsActive {
          when(ports_err_reduce) {
            goto(sIdle)
          }.elsewhen(~startAssertCounter.willOverflowIfInc) {
            startAssertCounter.increment()
            chanStart := True
          }.elsewhen(~inAlmostEmpty) {
            goto(sSend)
          }
        }
      }

      val sSend: State = new State {
        whenIsActive {
          for (iHbmGrp <- HBM_MATA_CHAN_GRP.indices) {
            for (iCol <- 0 until MATA_CHAN_PER_GRP(iHbmGrp)) {
              val iColOffset: Int = if (iHbmGrp == 0) 0 else MATA_CHAN_PER_GRP(iHbmGrp-1)

              if (COL_IN_GRP_REUSE_FACTOR == 1) {
                data2TcarrayCol(iColOffset + iCol).payload.fromUInt(combDataFromHbm(iHbmGrp)(iCol).asUInt)
                data2TcarrayCol(iColOffset + iCol).valid := ~(combDataFromHbm(iHbmGrp)(iCol).resizeLeft(2) === B"2'b10")
              } else if (COL_IN_GRP_REUSE_FACTOR > 1) {
                switch(hbmGrpSel.value) {
                  for (g <- 0 until COL_IN_GRP_REUSE_FACTOR) {
                    is(g) {
                      data2TcarrayCol(iColOffset + iCol + g * MATA_CHAN_PER_GRP(iHbmGrp)).payload
                        .fromUInt(combDataFromHbm(iHbmGrp)(iCol).asUInt)
                      data2TcarrayCol(iColOffset + iCol + g * MATA_CHAN_PER_GRP(iHbmGrp)).valid :=
                        ~(combDataFromHbm(iHbmGrp)(iCol).resizeLeft(2) === B"2'b10")
                    }
                  }
                }
              }
            }
          }

          chanSel := Vec(for(i <- data2TcarrayCol) yield i.ready).andR
          when(chanSel) {
            rdWordCounter.increment()
          }
          when(rdWordCounter.willOverflow) {
            matAFullyLoaded := True
            goto(sPause)
          }
        }
      }

      val sPause: State = new State {
        whenIsActive {
          matAFullyLoaded := False
          when(maRdBoundQue.io.pop.valid) {
            when(~isNextBdPoped) {
              maRdBoundQue.io.pop.ready := True
              isNextBdPoped := True
            }.otherwise {
              when(bdPopDlyCounter.willOverflowIfInc) {
                when(~currLdRdy) {
                  goto(sSend)
                }
              }.otherwise {
                bdPopDlyCounter.increment()
              }
            }
          }.otherwise {
            goto(sIdle)
          }
        }
        onExit {
          isNextBdPoped := False
          bdPopDlyCounter.clear()
        }
      }
    }

    for(hbmChanId <- 1 until io.tcarray_in.size) {
      if (HBM_MATA_CHAN_GRP.reduce((a,b) => a ++ b).contains(hbmChanId)) {
        io.tcarray_in(hbmChanId).addr.clearAll()
        io.tcarray_in(hbmChanId).start := colRdFsm.chanStart
        io.tcarray_in(hbmChanId).select := colRdFsm.chanSel
      } else {
        io.tcarray_in(hbmChanId).disablePort()
      }
    }

    // start ctrl
    //   when two ptrs meets either it's idle or one of
    //   ld and comp finishes before the other, so only
    //   one of them needs moving
    when(dBuffLdPtr === dBuffComputePtr) {
      // if ld not ready, wait for ld and move ld ptr
      when(~currLdRdy) {
        when(matAFullyLoaded) {
          dBuffLdPtr := ~dBuffLdPtr
          when(dBuffLdPtr) {
            matADbuffRdy(1) := True
          }.otherwise {
            matADbuffRdy(0) := True
          }
        } // if ld ready, wait for comp and move comp ptr
      }.otherwise {
        when(tcArray.io.calFin) {
          dBuffComputePtr := ~dBuffComputePtr
          when(dBuffComputePtr) {
            matADbuffRdy(1) := False
          }.otherwise {
            matADbuffRdy(0) := False
          }
        }
      }
    }.otherwise {
      // when two ptrs are different, either of them
      // need to move, or both
      when(tcArray.io.calFin) {
        dBuffComputePtr := ~dBuffComputePtr
      }
      when(matAFullyLoaded) {
        dBuffLdPtr := ~dBuffLdPtr
      }

      when(dBuffLdPtr) {
        when(matAFullyLoaded) {
          matADbuffRdy(1) := True
        }
        when(tcArray.io.calFin) {
          matADbuffRdy(0) := False
        }
      }.otherwise {
        when(matAFullyLoaded) {
          matADbuffRdy(0) := True
        }
        when(tcArray.io.calFin) {
          matADbuffRdy(1) := False
        }
      }
    }

    // issue cal en when dbuff compute ptr points to a change
    calTileStart := False
    when(dBuffComputePtr.edge()) {
      when(currCompRdy) {calTileStart := True}
    }.otherwise {
      when(currCompRdy.rise()) {calTileStart := True}
    }

    //out logic
    for (g <- tcArray.io.res.indices) {
      val outHbmWrFsm = new StateMachine {
        val wrInitCount = Counter(4)
        val port_err = io.tcarray_out(g).port_error

        io.tcarray_out(g).select := False
        io.tcarray_out(g).start := False
        tcArray.io.res(g).ready := False
        io.tcarray_out(g).addr.clearAll()
        io.tcarray_out(g).data := tcArray.io.res(g).payload

        val sIdle: State = new State with EntryPoint {
          whenIsActive {
            wrInitCount.clear()
            when(calStart.rise()) {
              goto(sWait)
            }
          }
        }

        val sWait: State = new State {
          whenIsActive {
            when(port_err) {
              goto(sIdle)
            }.elsewhen(~wrInitCount.willOverflowIfInc) {
              wrInitCount.increment()
              io.tcarray_out(g).start := True
            }.elsewhen(~io.tcarray_out(g).almost_full) {
              when(tcArray.io.res(g).valid) {
                goto(sSend)
              }.otherwise {
                goto(sPause)
              }
            }
          }
        }

        val sSend: State = new State {
          whenIsActive {
            io.tcarray_out(g).select := True
            tcArray.io.res(g).ready := True
            when(~tcArray.io.res(g).valid || io.tcarray_out(g).almost_full) {
              goto(sPause)
            }
          }
        }

        val sPause: State = new State {
          whenIsActive {
            io.tcarray_out(g).select := False
            when(tcArray.io.res(g).valid && ~io.tcarray_out(g).almost_full) {
              goto(sSend)
            }
          }
        }
      }
    }

    //perf counter
    val totalLatCounter = PerfCounter(
      32,
      calStart,
      tcArray.io.calFin & ~mbidxRdBoundQue.io.pop.valid & ~maRdBoundQue.io.pop.valid,
      calStart
    )
    val matBLoadCounter = PerfCounter(
      32,
      bufferSelCC(0) && idxGenRowSharedRdFsm.isActive(idxGenRowSharedRdFsm.sSend),
      bufferSelCC(0) && idxGenRowSharedRdFsm.isActive(idxGenRowSharedRdFsm.sIdle),
      bufferSelCC(0).rise()
    )

    io.lat_counter := Delay(
      perfCounterSel.mux(
        0 -> totalLatCounter.value,
        1 -> tcArray.io.computeLatCounter,
        2 -> matBLoadCounter.value,
        3 -> U(0)
      ),
      CTRL_REG_DELAY
    )

    // error detection
    io.err_info := Delay(tcArray.io.err_info, CTRL_REG_DELAY).resized
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
  val array_row = 7
  val array_col = 36
  val chain_len = 8
  val ridx_width = 12
  val cidx_width = 10

  gen.getConfigForSpecificPath(s"./src/generated_dense_core_r${array_row}c${array_col}cl${chain_len}")
    .withoutEnumString()
    .generate(new tensor_core_array_wrapper(
      array_col = array_col,
      array_row = array_row,
      chain_len = chain_len,
      idx_width = IdxWidth(ridx_width, cidx_width),
      num_hbms = 10
    ))
}