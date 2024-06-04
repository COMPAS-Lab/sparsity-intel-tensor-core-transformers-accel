package mvm

import spinal.core._
import spinal.lib._
import config.DefaultConfig
import spinal.lib.fsm._

import scala.math.pow

sealed trait RedRemoverDir
case object RemoverIn extends RedRemoverDir
case object RemoverOut extends RedRemoverDir

class RedundancyRemoverFrontend(num_inputs: Int, bitwidth: Int,
                                placeholder: BigInt, fifo_depth: Int) extends Component {
  val io = new Bundle {
    val upperIns, lowerIns = slave Flow(Vec(UInt(bitwidth bits), num_inputs / 2))
    val outs = master Flow(Vec(UInt(bitwidth bits), num_inputs * 2))
    val fifoPopSigLower, fifoPopSigUpper = in Vec(Bool(), num_inputs)
    // handshake wires signaling the finish of
    // a group
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

  private def rotate(in: Vec[UInt], rotAmount: UInt, dir: RedRemoverDir): Vec[UInt] = {
    val rotateInLen = if (dir == RemoverIn) in.length * 2 else in.length
    val rotateStgRes = Vec(Vec(UInt(bitwidth bits), rotateInLen), log2Up(rotateInLen) + 1)
    rotateStgRes.setName("sstage_rotate")

    if (dir == RemoverIn) {
      for (i <- 0 until rotateStgRes(0).length) {
        if (i < in.length) {
          rotateStgRes(0)(i) := in(i)
        } else {
          rotateStgRes(0)(i) := U(placeholder, bitwidth bits)
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
    val fifos: Array[StreamFifo[UInt]] = Array.fill(num_inputs)(StreamFifo(UInt(bitwidth bits), depth = fifo_depth))
    //input side
    val rotateInOffset = Reg(UInt(log2Up(num_inputs) bits), init = U(0))
    val rateIn = Bits(num_inputs / 2 bits)
    for (rateId <- 0 until rateIn.getWidth) {
      rateIn(rateId) := rotateInOffset.muxList(
        for (fid <- fifos.indices)
          yield (fid, fifos((rateId + fifos.length - fid) % fifos.length).io.occupancy > 2))
    }
    val combinedRateIn = ~rateIn
    rotateInOffset := Mux(io.lastGrpOut, U(0), (convertRate(combinedRateIn) + rotateInOffset) % num_inputs)
    val inRotateRes = rotate(io.upperIns.payload, rotateInOffset, RemoverIn)
    for (fid <- fifos.indices) {
      fifos(fid).io.push.payload <> inRotateRes(fid)
      fifos(fid).io.push.valid := io.upperIns.valid
    }

    //output side
    val rotateOutOffset = Reg(UInt(log2Up(num_inputs) bits), init = U(0))
    val rateOut = ~io.fifoPopSigUpper.asBits.reversed
    val fifoOuts = Vec(
      for(fid <- fifos.indices)
        yield Mux(fifos(fid).io.pop.valid & fifoPopEn, fifos(fid).io.pop.payload, U(placeholder)))

    rotateOutOffset := Mux(io.lastGrpOut,
      U(0),
      ((convertRate(rateOut) + rotateOutOffset) % num_inputs)(rotateOutOffset.getWidth - 1 downto 0))
    val outRotateRes = rotate(fifoOuts, rotateOutOffset, RemoverOut)
    for (fid <- 0 until num_inputs) {
      fifos(fid).io.pop.ready := rotateOutOffset.muxList(
        for (rId <- 0 until num_inputs)
          yield (rId, io.fifoPopSigUpper((fid + rId) % num_inputs))
      ) & fifoPopEn
      io.outs.payload(fid + num_inputs) := outRotateRes(fid)
    }
  }

  val botRemoverFrontend = new Area {
    val fifos: Array[StreamFifo[UInt]] = Array.fill(num_inputs)(StreamFifo(UInt(bitwidth bits), depth = fifo_depth))
    //input side
    val rotateInOffset = Reg(UInt(log2Up(num_inputs) bits), init = U(0))
    val rateIn = Bits(num_inputs / 2 bits)
    for (rateId <- 0 until rateIn.getWidth) {
      rateIn(rateId) := rotateInOffset.muxList(
        for (fid <- fifos.indices)
          yield (fid, fifos((rateId + fifos.length - fid) % fifos.length).io.occupancy > 2))
    }
    val combinedRateIn = ~rateIn
    rotateInOffset := Mux(io.lastGrpOut, U(0), (convertRate(combinedRateIn) + rotateInOffset) % num_inputs)
    val inRotateRes = rotate(io.lowerIns.payload, rotateInOffset, RemoverIn)
    for (fid <- fifos.indices) {
      fifos(fid).io.push.payload <> inRotateRes(fid)
      fifos(fid).io.push.valid := io.lowerIns.valid
    }

    //output side
    val rotateOutOffset = Reg(UInt(log2Up(num_inputs) bits), init = U(0))
    val rateOut = ~(io.fifoPopSigLower.asBits.reversed)
    val fifoOuts = Vec(
      for (fid <- fifos.indices)
        yield Mux(fifos(fid).io.pop.valid & fifoPopEn, fifos(fid).io.pop.payload, U(placeholder)))

    rotateOutOffset := Mux(
      io.lastGrpOut,
      U(0),
      ((convertRate(rateOut) + rotateOutOffset) % num_inputs)(rotateOutOffset.getWidth - 1 downto 0))
    val outRotateRes = rotate(fifoOuts, rotateOutOffset, RemoverOut)
    for (fid <- 0 until num_inputs) {
      fifos(fid).io.pop.ready := rotateOutOffset.muxList(
        for (rId <- 0 until num_inputs)
          yield (rId, io.fifoPopSigLower((fid + rId) % num_inputs))
      ) & fifoPopEn
      io.outs.payload(fid) := outRotateRes(fid)
    }
  }

  // ready signal
  val topFifoNotEmpty: Bool = Vec(for(i <- topRemoverFrontend.fifos) yield i.io.pop.valid).reduceBalancedTree(_ | _)
  val botFifoNotEmpty: Bool = Vec(for(i <- botRemoverFrontend.fifos) yield i.io.pop.valid).reduceBalancedTree(_ | _)
  io.sortIterFinished := ~(topFifoNotEmpty | botFifoNotEmpty)

  fifoPopEn := False
  io.outs.valid := False
  io.lastGrpOut := False
  val ctrlStateMachine = new StateMachine {
    val topFifoValid = Vec(for(i <- topRemoverFrontend.fifos) yield i.io.pop.valid).reduceBalancedTree(_ & _)
    val botFifoValid = Vec(for(i <- topRemoverFrontend.fifos) yield i.io.pop.valid).reduceBalancedTree(_ & _)
    val lastCompareWaitCounter = Counter(log2Up(num_inputs/2)+1)
    val sIdle: State = new State with EntryPoint {
      whenIsActive{
        fifoPopEn := False
//        when(topFifoValid & botFifoValid | Delay(io.lastGrpIn, 1, init=False)) (goto(sMerge))
        when(Delay(io.lastGrpIn, 1, init=False)) (goto(sMerge))
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

case class comp1OutsRes(bitwidth: Int) extends Bundle {
  val dat = UInt(bitwidth bits)
  val popA, popB = Bool()
}

class RedundancyRemoverBackend(num_outputs: Int, bitwidth: Int, placeholder: BigInt) extends Component {
  val io = new Bundle {
    val ins = in Vec(UInt(bitwidth bits), num_outputs * 2)
    val outs = out Vec(UInt(bitwidth bits), num_outputs)
    val stg1CompResUpper, stg1CompResLower = out Vec(Bool(), num_outputs)
  }

  assert(isPow2(num_outputs), "the module only supports ^2 outputs")

  private def comp1Outs(ina: UInt, inb: UInt, popLowerWhenEq: Boolean): comp1OutsRes = {
    // in the first stage comparison, we do not remove redundancy
    val res = Reg(UInt(ina.getWidth bits), init = U(0))
    val popA = Bool()
    val popB = Bool()

    val inaVal = ina(bitwidth-2 downto 0)
    val inbVal = inb(bitwidth-2 downto 0)

    // normal compare
    // A: lower in B: upper in
    res := Mux(inaVal < inbVal, inb, ina)
    when(ina === inb) {
      if (popLowerWhenEq) {
        popA := True
        popB := False
      } else {
        popA := False
        popB := True
      }
    }.otherwise {
      popA := inaVal > inbVal
      popB := inaVal < inbVal
    }

    val outRes = comp1OutsRes(bitwidth)
    outRes.dat := res
    outRes.popA := popA
    outRes.popB := popB
    outRes
  }

  private def comp2Outs(ina: UInt, inb: UInt, placeholder: BigInt): Vec[UInt] = {
    val outs = Vec(Reg(UInt(ina.getWidth bits), init = U(0)), 2)
    val inaVal = ina(bitwidth-2 downto 0)
    val inbVal = inb(bitwidth-2 downto 0)

    switch((ina.msb ## inb.msb).asBits, coverUnreachable = true) {
      is(B"2'00") {
        when(inaVal === inbVal) {
          // TODO: check here
          // regarding removed redundancy as smaller
          outs(0) := ina
          outs(1) := (U"1'b1" ## ina(bitwidth - 2 downto 0)).asUInt
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
          // TODO: check here
          outs(0) := Mux(ina.msb, inb, ina)
          outs(1) := Mux(ina.msb, ina, inb)
        } otherwise {
          outs(0) := Mux(inaVal > inbVal, ina, inb)
          outs(1) := Mux(inaVal > inbVal, inb, ina)
        }
      }
      default {
        outs(0) := U(placeholder)
        outs(1) := U(placeholder)
      }
    }
    outs
  }

  def singleStageComparison(stgIns: Vec[UInt], nStg: Int, placeholder: BigInt): Vec[UInt] = {
    val stgOuts = Vec(UInt(stgIns(0).getWidth bits), stgIns.length)
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

  private def firstStgComparison(stgIns: Vec[UInt]): Vec[comp1OutsRes] = {
    val stgOuts = Vec(comp1OutsRes(bitwidth), stgIns.length / 2)
    for (i <- 0 until stgIns.length / 2) {
      val popLowerWhenEq = i < (stgIns.length / 2)
      stgOuts(i) := comp1Outs(stgIns(i), stgIns(stgIns.length - 1 - i), popLowerWhenEq)
    }
    stgOuts
  }

  //for outputs greater than 4 the backend is used together with the frontend
  //so it contains an extra layer to reduce half of the input bandwidth from
  //the frontend
  val compRes = Vec(Vec(UInt(bitwidth bits), num_outputs), log2Up(num_outputs) + 1)
  // stage 1
  val stg1Outs = firstStgComparison(io.ins)
  for (i <- 0 until num_outputs) {compRes(0)(i) := stg1Outs(i).dat}
  // stage 2 - end
  for (stg <- 0 until log2Up(num_outputs)) {
    compRes(stg + 1) := singleStageComparison(compRes(stg), stg, placeholder)
  }

  for (i <- 0 until num_outputs) {
    io.stg1CompResLower(i) := stg1Outs(i).popA
    io.stg1CompResUpper(num_outputs - i - 1) := stg1Outs(i).popB
  }

//  if (num_outputs > 4) {
//    // fix placeholder-caused large value vanishing
//    val valVanishFixStg = Vec(UInt(bitwidth bits), compRes.last.size)
//    for (i <- 0 until valVanishFixStg.size / 2 - 1) {
//      val fixedCompRes = comp2Outs(compRes.last(i * 2 + 1), compRes.last(i * 2 + 2), placeholder)
//      valVanishFixStg(i * 2 + 1) := fixedCompRes(0)
//      valVanishFixStg(i * 2 + 2) := fixedCompRes(1)
//    }
//    valVanishFixStg(0) := Delay(compRes.last(0), 1, init = U(0))
//    valVanishFixStg.last := Delay(compRes.last.last, 1, init = U(0))
//
//    // outputs assignment
//    io.outs := valVanishFixStg
//  } else {
//    // for the outputs < 4, no need to fix the value vanishing issue
//    io.outs := compRes.last
//  }
  // not to replace
  io.outs := compRes.last
}

class RedundancyRemover(num_words: Int, bitwidth: Int, placeholder: BigInt) extends Component {
  val io = new Bundle {
    val upperIns, lowerIns = slave Flow(Vec(UInt(bitwidth bits), num_words / 2))
    val outs = master Flow(Vec(UInt(bitwidth bits), num_words))
    val lastGrpIn = in Bool()
    val sortIterFinished = out Bool()
    val lastGrpOut = out Bool()
  }

  assert(isPow2(num_words), "input size must be power of 2, but got " + num_words)
  val sortedOuts = Vec(Reg(UInt(bitwidth bits), init=U(0)), num_words)

  val frontend = new RedundancyRemoverFrontend(num_words, bitwidth, placeholder, fifo_depth = 32)
  val backend = new RedundancyRemoverBackend(num_words, bitwidth, placeholder)

  frontend.io.upperIns <> io.upperIns
  frontend.io.lowerIns <> io.lowerIns
  frontend.io.fifoPopSigUpper <> backend.io.stg1CompResUpper
  frontend.io.fifoPopSigLower <> backend.io.stg1CompResLower
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
    num_words = 8, bitwidth = 11, placeholder = BigInt("10000000000", 2)
  )).printPruned()
}
