package mvm

import spinal.core._
import spinal.lib._
import config.DefaultConfig
import scala.math.pow

sealed trait RedRemoverDir
case object RemoverIn extends RedRemoverDir
case object RemoverOut extends RedRemoverDir

class RedundancyRemoverFrontend(num_inputs: Int, bitwidth: Int, placeholder: BigInt) extends Component {
  val io = new Bundle {
    val upperIns, lowerIns = in Vec(UInt(bitwidth bits), num_inputs / 2)
    val outs = out Vec(UInt(bitwidth bits), num_inputs * 2)
    val fifoPopSig = in Vec(Bool(), num_inputs)
  }

  assert(isPow2(num_inputs), "the module only supports ^2 outputs")

  private def convertRate(s: Bits): UInt = {
    val interRes = Bits(s.getWidth + 1 bits)
    interRes(0) := ~s(0)
    for (i <- 1 until s.getWidth) {
      interRes(i) := s(i - 1) && ~s(i)
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

  val topRemoverFrontend = new Area {
    val fifos = Array.fill(num_inputs)(StreamFifo(UInt(bitwidth bits), depth = 16))
    //input side
    val rotateInOffset = Reg(UInt(log2Up(num_inputs) bits), init = U(0))
    val rateIn = Bits(num_inputs / 2 bits)
    for (rateId <- 0 until rateIn.getWidth) {
      rateIn(rateId) := rotateInOffset.muxList(
        for (fid <- fifos.indices)
          yield (fid, fifos((rateId + fifos.length - fid) % fifos.length).io.push.ready))
    }
    rotateInOffset := (convertRate(~rateIn) + rotateInOffset) % num_inputs
    val inRotateRes = rotate(io.upperIns, rotateInOffset, RemoverIn)
    for (fid <- fifos.indices) {
      fifos(fid).io.push.payload <> inRotateRes(fid)
      fifos(fid).io.push.valid <> inRotateRes(fid).msb
    }

    //output side
    val rotateOutOffset = Reg(UInt(log2Up(num_inputs) bits), init = U(0))
    val rateOut = io.fifoPopSig.asBits
    val fifoOuts = Vec(
      for(fid <- fifos.indices) yield Mux(fifos(fid).io.pop.valid, fifos(fid).io.pop.payload, U(placeholder)))

    rotateOutOffset := ((convertRate(rateOut) + rotateOutOffset) % num_inputs)(rotateOutOffset.getWidth - 1 downto 0)
    val outRotateRes = rotate(fifoOuts, rotateOutOffset, RemoverOut)
    for (fid <- 0 until num_inputs) {
      fifos(fid).io.pop.ready := rotateOutOffset.muxList(
        for (rId <- 0 until num_inputs)
          yield (rId, io.fifoPopSig((num_inputs - 1 + rId) % num_inputs))
      )
      io.outs(fid + num_inputs) <> outRotateRes(fid)
    }
  }

  val botRemoverFrontend = new Area {
    val fifos = Array.fill(num_inputs)(StreamFifo(UInt(bitwidth bits), depth = 16))
    //input side
    val rotateInOffset = Reg(UInt(log2Up(num_inputs) bits), init = U(0))
    val rateIn = Bits(num_inputs / 2 bits)
    for (rateId <- 0 until rateIn.getWidth) {
      rateIn(rateId) := rotateInOffset.muxList(
        for (fid <- fifos.indices)
          yield (fid, fifos((rateId + fifos.length - fid) % fifos.length).io.push.ready))
    }
    rotateInOffset := (convertRate(~rateIn) + rotateInOffset) % num_inputs
    val inRotateRes = rotate(io.lowerIns, rotateInOffset, RemoverIn)
    for (fid <- fifos.indices) {
      fifos(fid).io.push.payload <> inRotateRes(fid)
      fifos(fid).io.push.valid <> inRotateRes(fid).msb
    }

    //output side
    val rotateOutOffset = Reg(UInt(log2Up(num_inputs) bits), init = U(0))
    val rateOut = ~io.fifoPopSig.asBits
    val fifoOuts = Vec(
      for(fid <- fifos.indices) yield Mux(fifos(fid).io.pop.valid, fifos(fid).io.pop.payload, U(placeholder)))

    rotateOutOffset := ((convertRate(rateOut) + rotateOutOffset) % num_inputs)(rotateOutOffset.getWidth - 1 downto 0)
    val outRotateRes = rotate(fifoOuts, rotateOutOffset, RemoverOut)
    for (fid <- 0 until num_inputs) {
      fifos(fid).io.pop.ready := rotateOutOffset.muxList(
        for (rId <- 0 until num_inputs)
          yield (rId, ~io.fifoPopSig((rId + num_inputs) % num_inputs))
      )
      io.outs(fid) <> outRotateRes(fid)
    }
  }
}

case class comp1OutsRes(bitwidth: Int) extends Bundle {
  val dat = UInt(bitwidth bits)
  val compFlag = Bool()
}

class RedundancyRemoverBackend(num_outputs: Int, bitwidth: Int, placeholder: BigInt) extends Component {
  val io = new Bundle {
    val ins = in Vec(UInt(bitwidth bits), num_outputs * 2)
    val outs = out Vec(UInt(bitwidth bits), num_outputs)
    val stg1CompRes = out Vec(Bool(), num_outputs)
  }

  assert(isPow2(num_outputs), "the module only supports ^2 outputs")

  private def comp1Outs(ina: UInt, inb: UInt): comp1OutsRes = {
    val res = Reg(UInt(ina.getWidth bits), init = U(0))
    val compFlag = Bool()
    res := Mux(ina > inb, ina, inb)
    compFlag := ~(ina < inb)
    val outRes = comp1OutsRes(bitwidth)
    outRes.dat := res
    outRes.compFlag := compFlag
    outRes
  }

  def comp2Outs(ina: UInt, inb: UInt, placeholder: BigInt): Vec[UInt] = {
    val outs = Vec(Reg(UInt(ina.getWidth bits), init = U(0)), 2)
    when (ina.msb === True || inb.msb === True) {
      outs(0) := ina
      outs(1) := inb
    } elsewhen (ina === inb) {
      outs(0) := U(placeholder)
      outs(1) := ina
    } elsewhen (ina > inb) {
      outs(0) := inb
      outs(1) := ina
    } otherwise {
      outs(0) := ina
      outs(1) := inb
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
      stgOuts(i) := comp1Outs(stgIns(i), stgIns(stgIns.length - 1 - i))
    }
    stgOuts
  }

  //for outputs greater than 4 the backend is used together with the frontend
  //so it contains an extra layer to reduce half of the input bandwidth from
  //the frontend
  val compRes = Vec(Vec(Reg(UInt(bitwidth bits), init=U(0)), num_outputs), log2Up(num_outputs) + 1)
  // stage 1
  val stg1Outs = firstStgComparison(io.ins)
  for (i <- 0 until num_outputs) {compRes(0)(i) := stg1Outs(i).dat}
  // stage 2 - end
  for (stg <- 0 until log2Up(num_outputs)) {
    compRes(stg + 1) := singleStageComparison(compRes(stg), stg, placeholder)
  }

  io.outs := compRes.last
  for (i <- io.stg1CompRes.indices) {io.stg1CompRes(i) := stg1Outs(i).compFlag}
}

class RedundancyRemover(num_words: Int, bitwidth: Int, placeholder: BigInt) extends Component {
  val io = new Bundle {
    val upperIns, lowerIns = in Vec(UInt(bitwidth bits), num_words / 2)
    val outs = out Vec(UInt(bitwidth bits), num_words)
  }

  assert(isPow2(num_words), "input size must be power of 2, but got " + num_words)
  val sortedOuts = Vec(Reg(UInt(bitwidth bits), init=U(0)), num_words)

  val frontend = new RedundancyRemoverFrontend(num_words, bitwidth, placeholder)
  val backend = new RedundancyRemoverBackend(num_words, bitwidth, placeholder)

  frontend.io.upperIns <> io.upperIns
  frontend.io.lowerIns <> io.lowerIns
  frontend.io.fifoPopSig <> backend.io.stg1CompRes
  frontend.io.outs <> backend.io.ins
  sortedOuts := backend.io.outs

  val redundancyMover = new RedundancyMover(num_words, bitwidth)
  redundancyMover.io.inputSeq := sortedOuts
  io.outs <> Delay(redundancyMover.io.outputSeq, 1)
}

object RedundancyRemoverGen extends App {
  val config = new DefaultConfig
  config.defaultSpinalConfig.withoutEnumString().generate(new RedundancyRemover(
    num_words = 16, bitwidth = 11, placeholder = BigInt("10000000000", 2)
  )).printPruned()
}
