package mvm

import spinal.core._
import spinal.lib._
import config.DefaultConfig
import spinal.lib.fsm._

import scala.math.pow

sealed trait RedRemoverDir
case object RemoverIn extends RedRemoverDir
case object RemoverOut extends RedRemoverDir

class IndexData(bitwidth: Int, num_dest_chans: Int) extends Bundle {
  val idxData = UInt(bitwidth bits)
  val destId = Bits(num_dest_chans bits)

  override def clearAll(): IndexData.this.type = {
    this.idxData.clearAll()
    this.destId.clearAll()
    this
  }

  override def getZero: this.type = {
    val zeroData = new IndexData(bitwidth, num_dest_chans)
    zeroData.idxData.clearAll()
    zeroData.destId.clearAll()
    zeroData.asInstanceOf[this.type]
  }

  override def clone(): IndexData = new IndexData(bitwidth, num_dest_chans)
}

object IndexData {
  def apply(bitwidth: Int, num_dest_chans: Int): IndexData = {
    val newIdxData = new IndexData(bitwidth, num_dest_chans)
    newIdxData
  }

  def apply(bitwidth: Int, num_dest_chans: Int, placeholder: BigInt): IndexData = {
    val newIdxData = new IndexData(bitwidth, num_dest_chans)
    newIdxData.idxData := U(placeholder, bitwidth bits)
    newIdxData.destId.clearAll()
    newIdxData
  }

  def apply(idxData: UInt, destId: Bits): IndexData = {
    val newIdxData = new IndexData(idxData.getWidth, destId.getWidth)
    newIdxData.idxData := idxData
    newIdxData.destId := destId
    newIdxData
  }
}

class MergeSortRedundancyRemoverRepeater(bitwidth: Int, dest_width: Int,
                                         fifo_depth: Int) extends Component {
  val io = new Bundle {
    val idx_in = slave Stream (IndexData(bitwidth, dest_width))
    val idx_out = master Stream (IndexData(bitwidth, dest_width))
    val lastGrpIn = in Bool()
    val lastGrpOut = out Bool()
    val neighborFire = in Bool()
  }

  val coreFifo = StreamFifo(IndexData(bitwidth, dest_width), fifo_depth)

  coreFifo.io.push << io.idx_in
  io.idx_out.payload := coreFifo.io.pop.payload

  val isValidAligned = Reg(Bool(), init=False)
  val isLastCapped = Reg(Bool(), init=False)

  when(isValidAligned) {
    io.idx_out.valid := coreFifo.io.pop.valid
    coreFifo.io.pop.ready := io.idx_out.ready
    isValidAligned := coreFifo.io.pop.valid
  }.otherwise {
    io.idx_out.valid := False
    isValidAligned := coreFifo.io.pop.valid & io.neighborFire
    coreFifo.io.pop.ready := False
  }

  when(isLastCapped) {
    io.lastGrpOut := False
    when(coreFifo.io.pop.fire.fall()) {
      io.lastGrpOut := True
      isLastCapped := False
    }
  }.otherwise {
    isLastCapped := io.lastGrpIn
    io.lastGrpOut := False
  }
}

class MergeSortRedundancyRemoverUnit(bitwidth: Int, dest_width: Int,
                                     placeholder: BigInt, fifo_depth: Int) extends Component {
  val io = new Bundle {
    val idx_ins = Vec(slave Stream(IndexData(bitwidth, dest_width)), 2)
    val idx_outs = master Stream(IndexData(bitwidth, dest_width))
    val lastGrpIns = in Bits(2 bits)
    val lastGrpOut = out Bool()
  }

  val fifos = Array.fill(2)(new StreamFifoIp(IndexData(bitwidth, dest_width), fifo_depth, "MLAB"))
  val fifoPopEn = Bool()

  io.idx_outs.setOutputAsReg()
  io.lastGrpOut.setOutputAsReg()

  // input logic
  for (fidx <- 0 until 2) {
    fifos(fidx).io.push.payload := io.idx_ins(fidx).payload
    fifos(fidx).io.push.valid := io.idx_ins(fidx).valid & (~io.idx_ins(fidx).payload.idxData.msb)
    io.idx_ins(fidx).ready := fifos(fidx).io.push.ready
  }

  // ctrl
  val ctrlStateMachine = new StateMachine {
    // make sure half of the fifo is loaded before start in case
    // one fifo can be drained during processing.
    //    val startThres = fifo_depth / 2
    val topChanValid, botChanValid = Reg(Bool(), init=False)
    val lastCompareFinished = Vec(for(f <- fifos) yield f.io.pop.valid).reduceBalancedTree((a, b) => a | b)
    val insRecved = Reg(Bits(2 bits), init=B"2'b00")
    val hasNoInput = Reg(Bool(), init=True)

    fifoPopEn := False

    val sIdle: State = new State with EntryPoint {
      whenIsActive{
        io.lastGrpOut := False
        fifoPopEn := False
        insRecved := io.lastGrpIns
        topChanValid := fifos(0).io.pop.valid
        botChanValid := fifos(1).io.pop.valid
        for (inRecv <- 0 until 2)
          insRecved(inRecv) := Mux(insRecved(inRecv), True, io.lastGrpIns(inRecv))
        when(insRecved.andR)(goto(sWait))
          .elsewhen(topChanValid & botChanValid)(goto(sMerge))
        when(hasNoInput) {
          hasNoInput := ~(fifos(0).io.push.valid | fifos(1).io.push.valid)
        }
      }
    }

    val sMerge: State = new State {
      whenIsActive{
        topChanValid.clear()
        botChanValid.clear()
        io.lastGrpOut := False
        fifoPopEn := True
        for (inRecv <- 0 until 2)
          insRecved(inRecv) := Mux(insRecved(inRecv), True, io.lastGrpIns(inRecv))
        when(insRecved.andR) {
          when(lastCompareFinished) {
            goto(sWait)
          }.otherwise{
            io.lastGrpOut := True
            goto(sIdle)
          }
        }
      }
    }

    val sWait: State = new State {
      onEntry {
        insRecved.clearAll()
      }
      whenIsActive{
        topChanValid.clear()
        botChanValid.clear()
        fifoPopEn := True
        when(~lastCompareFinished & (hasNoInput | io.idx_outs.fire)) {
          io.lastGrpOut := True
          hasNoInput := True
          goto(sIdle)
        }
      }
    }
  }

  when(fifoPopEn) {
    fifos.foreach(_.io.pop.ready := False)
    when(io.idx_outs.ready) {
      switch(fifos(0).io.pop.valid ## fifos(1).io.pop.valid) {
        is(B"2'b01") {
          val cachedLkAhdIn = io.idx_ins(0).payload.idxData
          val lookAheadRes = Delay(
            fifos(1).io.pop.payload.idxData(bitwidth-2 downto 0) > cachedLkAhdIn(bitwidth-2 downto 0), 1)

          when(Delay(io.idx_ins(0).valid, 1)) {
            when(lookAheadRes) {
              fifos(1).io.pop.ready := True
              io.idx_outs.valid := True
              io.idx_outs.payload := fifos(1).io.pop.payload
            }.otherwise {
              fifos(1).io.pop.ready := False
              io.idx_outs.valid := False
              io.idx_outs.payload := IndexData(bitwidth, dest_width, placeholder)
            }
          }.elsewhen(ctrlStateMachine.insRecved(0)) {
            fifos(1).io.pop.ready := True
            io.idx_outs.valid := True
            io.idx_outs.payload := fifos(1).io.pop.payload
          }.elsewhen(ctrlStateMachine.isActive(ctrlStateMachine.sWait)) {
            fifos(1).io.pop.ready := True
            io.idx_outs.valid := True
            io.idx_outs.payload := fifos(1).io.pop.payload
          } .otherwise {
            fifos(1).io.pop.ready := False
            io.idx_outs.valid := False
            io.idx_outs.payload := IndexData(bitwidth, dest_width, placeholder)
          }
        }

        is(B"2'b10") {
          val cachedLkAhdIn = io.idx_ins(1).payload.idxData
          val lookAheadRes = Delay(
            fifos(0).io.pop.payload.idxData(bitwidth-2 downto 0) > cachedLkAhdIn(bitwidth-2 downto 0), 1)

          when(Delay(io.idx_ins(1).valid, 1)) {
            when(lookAheadRes) {
              fifos(0).io.pop.ready := True
              io.idx_outs.valid := True
              io.idx_outs.payload := fifos(0).io.pop.payload
            }.otherwise {
              fifos(0).io.pop.ready := False
              io.idx_outs.valid := False
              io.idx_outs.payload := IndexData(bitwidth, dest_width, placeholder)
            }
          }.elsewhen(ctrlStateMachine.insRecved(1)) {
            fifos(0).io.pop.ready := True
            io.idx_outs.valid := True
            io.idx_outs.payload := fifos(0).io.pop.payload
          }.elsewhen(ctrlStateMachine.isActive(ctrlStateMachine.sWait)) {
            fifos(0).io.pop.ready := True
            io.idx_outs.valid := True
            io.idx_outs.payload := fifos(0).io.pop.payload
          } .otherwise {
            fifos(0).io.pop.ready := False
            io.idx_outs.valid := False
            io.idx_outs.payload := IndexData(bitwidth, dest_width, placeholder)
          }
        }

        is(B"2'b11") {
          io.idx_outs.valid := True
          when(fifos(0).io.pop.payload.idxData > fifos(1).io.pop.payload.idxData) {
            fifos(0).io.pop.ready := True
            io.idx_outs.payload := fifos(0).io.pop.payload
          }.elsewhen(fifos(0).io.pop.payload.idxData < fifos(1).io.pop.payload.idxData) {
            fifos(1).io.pop.ready := True
            io.idx_outs.payload := fifos(1).io.pop.payload
          }.otherwise {
            fifos.foreach(_.io.pop.ready := True)
            io.idx_outs.payload := IndexData(
              idxData = fifos(0).io.pop.payload.idxData,
              destId = Vec(for (f <- fifos) yield f.io.pop.payload.destId).reduceBalancedTree((a, b) => a | b)
            )
          }
        }

        default {
          io.idx_outs.valid := False
          io.idx_outs.payload := IndexData(bitwidth, dest_width, placeholder)
          fifos.foreach(_.io.pop.ready := False)
        }
      }
    }
  }.otherwise {
    io.idx_outs.valid := False
    io.idx_outs.payload := IndexData(bitwidth, dest_width, placeholder)
    fifos.foreach(_.io.pop.ready := False)
  }
}

class RedundancyRemoverFrontend(num_inputs: Int, bitwidth: Int, dest_width: Int,
                                placeholder: BigInt, fifo_depth: Int) extends Component {
  val io = new Bundle {
    val upperIns, lowerIns = slave Flow(Vec(IndexData(bitwidth, dest_width), num_inputs / 2))
    val outs = master Flow(Vec(IndexData(bitwidth, dest_width), num_inputs * 2))
    val fifoPopSigLower, fifoPopSigUpper = in Vec(Bool(), num_inputs)
    val markRedBitLower, markRedBitUpper = in Vec(Bool(), num_inputs)
    // handshake wires signaling the finish of a group
    val lastGrpIn = in Bool()
    val sortIterFinished = out Bool()
    val lastGrpOut = out Bool()
  }

  assert(isPow2(num_inputs), "the module only supports ^2 outputs")

  private def convertRate(s: Bits): UInt = {
    val interRes = Bits(s.getWidth + 1 bits)
    interRes(0) := ~s(0)
    for (i <- 1 until s.getWidth) {
      interRes(i) := s(i - 1) & ~s(i)
    }
    interRes(s.getWidth) := s.msb
    OHToUInt(interRes)
  }

  private def rotate(in: Vec[IndexData], rotAmount: UInt, dir: RedRemoverDir): Vec[IndexData] = {
    val rotateInLen = if (dir == RemoverIn) in.length * 2 else in.length
    val rotateStgRes = Vec(Vec(IndexData(bitwidth, dest_width), rotateInLen), log2Up(rotateInLen) + 1)
    rotateStgRes.setName("sstage_rotate")

    if (dir == RemoverIn) {
      for (i <- 0 until rotateStgRes(0).length) {
        if (i < in.length) {
          rotateStgRes(0)(i) := in(i)
        } else {
          rotateStgRes(0)(i) := IndexData(bitwidth, dest_width, placeholder)
        }
      }
    } else {
      rotateStgRes(0) := in
    }

    for (stg <- 1 until log2Up(rotateInLen) + 1) {
      for (i <- 0 until rotateInLen) {
        val targetCell = (i + rotateInLen - pow(2, stg-1).toInt) % rotateInLen
        rotateStgRes(stg)(i) := Mux(rotAmount(stg-1), rotateStgRes(stg-1)(targetCell), rotateStgRes(stg-1)(i))
      }
    }
    rotateStgRes.last
  }

  val fifoPopEn = Bool()
  val topRemoverFrontend = new Area {
    val fifos: Array[StreamFifo[IndexData]] =
      Array.fill(num_inputs)(StreamFifo(IndexData(bitwidth, dest_width), depth = fifo_depth))
    val isChangingRedBit = Array.fill(num_inputs)(Reg(Bool(), init=False))
    //input side
    val rotateInOffset = Reg(UInt(log2Up(num_inputs) bits), init = U(0))
    val rateIn = Bits(num_inputs / 2 bits)
    for (rateId <- 0 until rateIn.getWidth) {
      rateIn(rateId) := rotateInOffset.muxList(
        for (fid <- fifos.indices)
          yield (fid, ~fifos((rateId + fifos.length - fid) % fifos.length).io.push.ready))
    }
    val combinedRateIn = Mux(io.upperIns.valid, ~rateIn, B(0))
    rotateInOffset := Mux(io.lastGrpOut, U(0), (convertRate(combinedRateIn) + rotateInOffset) % num_inputs)
    val inRotateRes = rotate(io.upperIns.payload, rotateInOffset, RemoverIn)
    for (fid <- fifos.indices) {
      fifos(fid).io.push.payload <> inRotateRes(fid)
      fifos(fid).io.push.valid := io.upperIns.valid & (fifos(fid).io.push.payload.idxData =/= U(placeholder))
    }

    //output side
    val rotateOutOffset = Reg(UInt(log2Up(num_inputs) bits), init = U(0))
    val rateOut = ~io.fifoPopSigUpper.asBits.reversed
    val fifoOuts = Vec(
      for(fid <- fifos.indices)
        yield IndexData(
          idxData = Mux(fifos(fid).io.pop.valid & fifoPopEn,
            ((isChangingRedBit(fid) | fifos(fid).io.pop.payload.idxData.msb)
              ## fifos(fid).io.pop.payload.idxData(bitwidth-2 downto 0)).asUInt,
            U(placeholder)),
          destId = fifos(fid).io.pop.payload.destId
        )
    )

    rotateOutOffset := Mux(io.lastGrpOut, U(0),
      ((convertRate(rateOut) + rotateOutOffset) % num_inputs)(rotateOutOffset.getWidth - 1 downto 0))
    val outRotateRes = rotate(fifoOuts, rotateOutOffset, RemoverOut)
    for (fid <- 0 until num_inputs) {
      fifos(fid).io.pop.ready := rotateOutOffset.muxList(
        for (rId <- 0 until num_inputs)
          yield (rId, io.fifoPopSigUpper((fid + rId) % num_inputs))
      ) & fifoPopEn
      isChangingRedBit(fid) := rotateOutOffset.muxList(
        for (rId <- 0 until num_inputs)
          yield (rId, io.markRedBitUpper((fid + rId) % num_inputs))
      ) & fifoPopEn
      io.outs.payload(fid + num_inputs) := outRotateRes(fid)
    }
  }

  val botRemoverFrontend = new Area {
    val fifos: Array[StreamFifo[IndexData]] =
      Array.fill(num_inputs)(StreamFifo(IndexData(bitwidth, dest_width), depth = fifo_depth))
    val isChangingRedBit = Array.fill(num_inputs)(Reg(Bool(), init=False))
    //input side
    val rotateInOffset = Reg(UInt(log2Up(num_inputs) bits), init = U(0))
    val rateIn = Bits(num_inputs / 2 bits)
    for (rateId <- 0 until rateIn.getWidth) {
      rateIn(rateId) := rotateInOffset.muxList(
        for (fid <- fifos.indices)
          yield (fid, ~fifos((rateId + fifos.length - fid) % fifos.length).io.push.ready))
    }
    val combinedRateIn = Mux(io.lowerIns.valid, ~rateIn, B(0))
    rotateInOffset := Mux(io.lastGrpOut, U(0), (convertRate(combinedRateIn) + rotateInOffset) % num_inputs)
    val inRotateRes = rotate(io.lowerIns.payload, rotateInOffset, RemoverIn)
    for (fid <- fifos.indices) {
      fifos(fid).io.push.payload <> inRotateRes(fid)
      fifos(fid).io.push.valid := io.lowerIns.valid & (fifos(fid).io.push.payload.idxData =/= U(placeholder))
    }

    //output side
    val rotateOutOffset = Reg(UInt(log2Up(num_inputs) bits), init = U(0))
    val rateOut = ~(io.fifoPopSigLower.asBits.reversed)
    val fifoOuts = Vec(
      for(fid <- fifos.indices)
        yield IndexData(
          idxData = Mux(
            fifos(fid).io.pop.valid & fifoPopEn,
            ((isChangingRedBit(fid) | fifos(fid).io.pop.payload.idxData.msb)
              ## fifos(fid).io.pop.payload.idxData(bitwidth-2 downto 0)).asUInt,
            U(placeholder)),
          destId = Mux(isChangingRedBit(fid), B(0), fifos(fid).io.pop.payload.destId)
        )
    )

    rotateOutOffset := Mux(io.lastGrpOut, U(0),
      ((convertRate(rateOut) + rotateOutOffset) % num_inputs)(rotateOutOffset.getWidth - 1 downto 0))
    val outRotateRes = rotate(fifoOuts, rotateOutOffset, RemoverOut)
    for (fid <- 0 until num_inputs) {
      fifos(fid).io.pop.ready := rotateOutOffset.muxList(
        for (rId <- 0 until num_inputs)
          yield (rId, io.fifoPopSigLower((fid + rId) % num_inputs))
      ) & fifoPopEn
      isChangingRedBit(fid) := rotateOutOffset.muxList(
        for (rId <- 0 until num_inputs)
          yield (rId, io.markRedBitLower((fid + rId) % num_inputs))
      ) & fifoPopEn
      io.outs.payload(fid) := outRotateRes(fid)
    }
  }

  // ready signal, might be deprecated
  val topFifoNotEmpty: Bool = Vec(for(i <- topRemoverFrontend.fifos) yield i.io.pop.valid).reduceBalancedTree(_ | _)
  val botFifoNotEmpty: Bool = Vec(for(i <- botRemoverFrontend.fifos) yield i.io.pop.valid).reduceBalancedTree(_ | _)
  io.sortIterFinished := ~(topFifoNotEmpty | botFifoNotEmpty)

  fifoPopEn := False
  io.outs.valid := False
  io.lastGrpOut := False
  val ctrlStateMachine = new StateMachine {
    // make sure half of the fifo is loaded before start in case
    // one fifo can be drained during processing.
    val startThres = fifo_depth / 2
    val topFifoValid = Vec(for(i <- topRemoverFrontend.fifos) yield i.io.occupancy > startThres).reduceBalancedTree(_ & _)
    val botFifoValid = Vec(for(i <- botRemoverFrontend.fifos) yield i.io.occupancy > startThres).reduceBalancedTree(_ & _)
    val lastCompareWaitCounter = Counter(log2Up(num_inputs/2)+1)
    val sIdle: State = new State with EntryPoint {
      whenIsActive{
        fifoPopEn := False
        when(topFifoValid & botFifoValid | Delay(io.lastGrpIn, 1, init=False)) (goto(sMerge))
//        when(Delay(io.lastGrpIn, 1, init=False)) (goto(sMerge))
      }
    }

    val sMerge: State = new State {
      whenIsActive{
        fifoPopEn := True
        io.outs.valid := True
        when(io.sortIterFinished) {
          goto(sWait)
          io.outs.valid := False
        }
      }
    }

    val sWait: State = new State {
      whenIsActive{
        fifoPopEn := True
        lastCompareWaitCounter.increment()
        when(lastCompareWaitCounter.willOverflow) {
          io.lastGrpOut := True
          goto(sIdle)
        }
      }
    }
  }
}

case class comp1OutsRes(bitwidth: Int, dest_width: Int) extends Bundle {
  val dat = IndexData(bitwidth, dest_width)
  val popLower, popUpper = Bool()
  val markRedLower, markRedUpper = Bool()
}

class RedundancyRemoverBackend(num_outputs: Int, bitwidth: Int, dest_width: Int,
                               placeholder: BigInt) extends Component {
  val io = new Bundle {
    val ins = in Vec(IndexData(bitwidth, dest_width), num_outputs * 2)
    val outs = out Vec(IndexData(bitwidth, dest_width), num_outputs)
    val stg1CompResUpper, stg1CompResLower, stg1EqualResUpper, stg1EqualResLower= out Vec(Bool(), num_outputs)
  }

  assert(isPow2(num_outputs), "the module only supports ^2 outputs")

  private def comp1Outs(ina: IndexData, inb: IndexData,
                        popLowerWhenEq: Boolean): comp1OutsRes = {
    val outRes = comp1OutsRes(bitwidth, dest_width)
    // in the first stage comparison, we do not remove redundancy
    val res = Reg(IndexData(bitwidth, dest_width), init = IndexData(bitwidth, dest_width).getZero)
    val inaVal = ina.idxData(bitwidth-2 downto 0)
    val inbVal = inb.idxData(bitwidth-2 downto 0)

    outRes.dat := res
    outRes.markRedLower := False
    outRes.markRedUpper := False
    // normal compare
    // A: lower in B: upper in
    when(inaVal === inbVal) {
      when(ina.idxData === U(placeholder)) {
        // both a and b are placeholders
        outRes.popLower := False
        outRes.popUpper := False
        res := ina
      } otherwise {
        when(ina.idxData.msb ^ inb.idxData.msb) {
          // one of a and b is a placeholder, but their values are
          // the same
          outRes.popLower := ~ina.idxData.msb & inb.idxData.msb
          outRes.popUpper := ina.idxData.msb & ~inb.idxData.msb
          res := Mux(ina.idxData.msb, inb, ina)
        } otherwise {
          //none of a and b is a placeholder, need to merge
          if (popLowerWhenEq) {
            outRes.popLower := True
            outRes.popUpper := False
            outRes.markRedUpper := True
            res := IndexData(ina.idxData, ina.destId | inb.destId)
          } else {
            outRes.popLower := False
            outRes.popUpper := True
            outRes.markRedLower := True
            res := IndexData(inb.idxData, ina.destId | inb.destId)
          }
        }
      }
    }.otherwise {
      // input values are different
      when(ina.idxData === U(placeholder)) {
        res := inb
        outRes.popLower := False
        outRes.popUpper := True
      } elsewhen (inb.idxData === U(placeholder)) {
        res := ina
        outRes.popLower := True
        outRes.popUpper := False
      } otherwise {
        outRes.popLower := inaVal > inbVal
        outRes.popUpper := inaVal < inbVal
        res := Mux(inaVal < inbVal, inb, ina)
      }
    }

    outRes
  }

  private def comp2Outs(ina: IndexData, inb: IndexData, placeholder: BigInt): Vec[IndexData] = {
    val outs = Vec(Reg(IndexData(bitwidth, dest_width),
      init = IndexData(bitwidth, dest_width).getZero), 2)
    val inaVal = ina.idxData(bitwidth-2 downto 0)
    val inbVal = inb.idxData(bitwidth-2 downto 0)

    switch((ina.idxData.msb ## inb.idxData.msb).asBits, coverUnreachable = true) {
      is(B"2'00") {
        when(inaVal === inbVal) {
          // TODO: check here
          // regarding removed redundancy as smaller
          outs(0) := IndexData(ina.idxData, ina.destId | inb.destId)
          outs(1) := IndexData((U"1'b1" ## inaVal).asUInt, B(0, dest_width bits))
        } otherwise {
          outs(0) := Mux(inaVal > inbVal, ina, inb)
          outs(1) := Mux(inaVal > inbVal, inb, ina)
        }
      }
      is(B"2'11") {
        outs(0) := Mux(inaVal > inbVal, ina, inb)
        outs(1) := Mux(inaVal > inbVal, inb, ina)
      }
      is(B"2'01", B"2'10") {
        when(inaVal === inbVal) {
          outs(0) := Mux(ina.idxData.msb, inb, ina)
          outs(1) := Mux(ina.idxData.msb, ina, inb)
        } otherwise {
          outs(0) := Mux(inaVal > inbVal, ina, inb)
          outs(1) := Mux(inaVal > inbVal, inb, ina)
        }
      }
      default {
        outs(0) := IndexData(bitwidth, dest_width, placeholder)
        outs(1) := IndexData(bitwidth, dest_width, placeholder)
      }
    }
    outs
  }

  def singleStageComparison(stgIns: Vec[IndexData], nStg: Int, placeholder: BigInt): Vec[IndexData] = {
    val stgOuts = Vec(IndexData(bitwidth, dest_width), stgIns.length)
    val nGrps = pow(2, nStg).intValue()
    for (grpIdx <- 0 until nGrps) {
      for (idxInGrp <- 0 until stgIns.length / nGrps / 2) {
        val firstIdx = grpIdx * stgIns.length / nGrps + idxInGrp
        val secondIdx = firstIdx + stgIns.length / nGrps / 2
        val res = comp2Outs(stgIns(firstIdx), stgIns(secondIdx), placeholder)
        stgOuts(firstIdx) := res(0)
        stgOuts(secondIdx) := res(1)
      }
    }
    stgOuts
  }

  private def firstStgComparison(stgIns: Vec[IndexData]): Vec[comp1OutsRes] = {
    val stgOuts = Vec(comp1OutsRes(bitwidth, dest_width), stgIns.length / 2)
    for (i <- 0 until stgIns.length / 2) {
      val popLowerWhenEq = i < (stgIns.length / 4)
      stgOuts(i) := comp1Outs(stgIns(i), stgIns(stgIns.length - 1 - i), popLowerWhenEq)
    }
    stgOuts
  }

  //for outputs greater than 4 the backend is used together with the frontend
  //so it contains an extra layer to reduce half of the input bandwidth from
  //the frontend
  val compRes = Vec(Vec(IndexData(bitwidth, dest_width), num_outputs), log2Up(num_outputs) + 1)
  // stage 1
  val stg1Outs = firstStgComparison(io.ins)
  for (i <- 0 until num_outputs) {compRes(0)(i) := stg1Outs(i).dat}
  // stage 2 - end
  for (stg <- 0 until log2Up(num_outputs)) {
    compRes(stg + 1) := singleStageComparison(compRes(stg), stg, placeholder)
  }

  for (i <- 0 until num_outputs) {
    io.stg1CompResLower(i) := stg1Outs(i).popLower
    io.stg1CompResUpper(num_outputs - i - 1) := stg1Outs(i).popUpper
    io.stg1EqualResLower(i) := stg1Outs(i).markRedLower
    io.stg1EqualResUpper(num_outputs - i - 1) := stg1Outs(i).markRedUpper
  }

  io.outs := compRes.last
}

class RedundancyRemover(num_words: Int, bitwidth: Int, dest_width: Int,
                        placeholder: BigInt, frontend_fifo_depth: Int) extends Component {
  val io = new Bundle {
    val upperIns, lowerIns = slave Flow(Vec(IndexData(bitwidth, dest_width), num_words / 2))
    val outs = master Flow(Vec(IndexData(bitwidth, dest_width), num_words))
    val lastGrpIn = in Bool()
    val sortIterFinished = out Bool()
    val lastGrpOut = out Bool()
  }

  assert(isPow2(num_words), "input size must be power of 2, but got " + num_words)
  val sortedOuts: Vec[IndexData] = Vec(Reg(IndexData(bitwidth, dest_width),
    init=IndexData(bitwidth, dest_width).getZero), num_words)

  // TODO: according to the paper https://ieeexplore.ieee.org/document/7544757,
  // fifo depth 16 keeps a small enough stall rate;
  // but we may need to add stall and back pressure to prevent from potential
  // content loss
  val frontend = new RedundancyRemoverFrontend(num_words, bitwidth, dest_width,
    placeholder, frontend_fifo_depth)
  val backend = new RedundancyRemoverBackend(num_words, bitwidth, dest_width, placeholder)

  frontend.io.upperIns <> io.upperIns
  frontend.io.lowerIns <> io.lowerIns
  frontend.io.fifoPopSigUpper <> backend.io.stg1CompResUpper
  frontend.io.markRedBitUpper <> backend.io.stg1EqualResUpper
  frontend.io.fifoPopSigLower <> backend.io.stg1CompResLower
  frontend.io.markRedBitLower <> backend.io.stg1EqualResLower
  backend.io.ins := frontend.io.outs.payload
  frontend.io.sortIterFinished <> io.sortIterFinished
  frontend.io.lastGrpIn <> io.lastGrpIn
  sortedOuts := backend.io.outs

  io.outs.payload := sortedOuts
  io.outs.valid := Delay(frontend.io.outs.valid, log2Up(num_words) + 2, init = False)
  io.lastGrpOut := Delay(frontend.io.lastGrpOut, 1, init = False)

}

object RedundancyRemoverGen extends App {
  val config = new DefaultConfig
  config.defaultSpinalConfig.withoutEnumString().generate(new RedundancyRemover(
    num_words = 8, bitwidth = 11, dest_width = 12,
    placeholder = BigInt("10000000000", 2), frontend_fifo_depth=16
  )).printPruned()
}
