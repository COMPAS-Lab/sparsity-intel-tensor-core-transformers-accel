package mvm

import spinal.core._
import spinal.lib._
import config.DefaultConfig
import scala.math.pow

class IndexOutWidthConversion(num_inports: Int, num_outports: Int,
                              bitwidth: Int, dest_width: Int, placeholder: BigInt) extends Component {
  val io = new Bundle {
    val idxIn = slave Flow(Vec(IndexData(bitwidth, dest_width), num_inports))
    val idxOut = master Flow(Vec(IndexData(bitwidth, dest_width), num_outports))
    val lastGrpIn = in Bool()
    val lastGrpOut = out Bool()
  }

  assert(num_outports * 3 > num_inports, "invalid index out assignment")

  private def convertRate(s: Bits): UInt = {
    val interRes = Bits(s.getWidth + 1 bits)
    interRes(0) := ~s(0)
    for (i <- 1 until s.getWidth) {
      interRes(i) := s(i - 1) & ~s(i)
    }
    interRes(s.getWidth) := s.msb
    OHToUInt(interRes)
  }

  val widthConvertCoreReg = Vec(
    Reg(IndexData(bitwidth, dest_width), init=IndexData(bitwidth, dest_width).getZero), num_outports)
  val paddedIn = Vec(IndexData(bitwidth, dest_width), num_outports * 3)
  for (i <- paddedIn.indices) {
    val paddedInElem = if(i < num_inports) io.idxIn.payload(i) else IndexData(bitwidth, dest_width, placeholder)
    paddedIn(i) := paddedInElem
  }

  val rotateOffset = Reg(UInt(log2Up(num_outports * 3) bits)) init 0
  val nUniqueVals = Vec(for(i <- io.idxIn.payload) yield i.idxData.msb).asBits
  when(io.idxIn.valid) {
    when(io.lastGrpIn) {
      rotateOffset.clearAll()
    } otherwise {
      val tmpRotateOffset = UInt(rotateOffset.getWidth + 1 bits)
      tmpRotateOffset := rotateOffset +^ convertRate(~nUniqueVals)
      rotateOffset := (tmpRotateOffset % (num_outports * 3)).setWidth(rotateOffset.getWidth)
    }
  } otherwise {
    rotateOffset.clearAll()
  }

  val rotation = new Area {
    val shiftRegs = Vec(
      Vec(Reg(IndexData(bitwidth, dest_width), init=IndexData(bitwidth, dest_width, placeholder)), num_outports * 3),
      log2Up(num_outports * 3))
    val shiftMntPipe = Vec(Reg(UInt(rotateOffset.getWidth bits), init=U(0)), log2Up(num_outports * 3)-1)
    val delayedInValid = History(io.idxIn.valid, log2Up(num_outports * 3), init=False)
    val topElemSigs = Cat(
      List(
        ~shiftRegs.last(num_outports-1).idxData.msb,
        ~shiftRegs.last(num_outports*2-1).idxData.msb,
        ~shiftRegs.last(num_outports*3-1).idxData.msb
      )
    )
    val botElemSigs = Cat(
      List(
        ~shiftRegs.last(0).idxData.msb,
        ~shiftRegs.last(num_outports).idxData.msb,
        ~shiftRegs.last(num_outports*2).idxData.msb
      )
    )

    val lastStgLoadSig = new Area {
      val lastGrpDelayed = Delay(io.lastGrpIn, log2Up(num_outports*3), init=False)
      val loadSig = Bits(3 bits)
      switch(topElemSigs) {
        is(B"001", B"011") {loadSig := B"001"}
        is(B"010", B"110") {loadSig := B"010"}
        is(B"100", B"101") {loadSig := B"100"}
        is(B"000") {
          when(lastGrpDelayed) {
            loadSig := botElemSigs
          } otherwise {
            loadSig := B"000"
          }
        }
        default {loadSig := B"000"}
      }
    }

    for (stg <- 0 until log2Up(num_outports * 3)) {
      for (i <- 0 until num_outports * 3) {
        val rotateSelected = IndexData(bitwidth, dest_width)
        if (stg == 0) {
          // first stage of the rotation
          rotateSelected := Mux(rotateOffset(0),
            paddedIn((num_outports*3 + i - 1) % (num_outports*3)), paddedIn(i))
        } else {
          // other stages
          val targetCell = (i + num_outports*3 - pow(2, stg).toInt) % (num_outports*3)
          rotateSelected := Mux(shiftMntPipe(stg - 1)(stg),
            shiftRegs(stg - 1)(targetCell), shiftRegs(stg - 1)(i))
        }
        when(delayedInValid(stg)) {
          if (stg == log2Up(num_outports * 3) -1) {
            if (i < num_outports) {
              when(lastStgLoadSig.loadSig === B"001") {
                shiftRegs(stg)(i) := rotateSelected
              } otherwise {
                when(~rotateSelected.idxData.msb)(shiftRegs(stg)(i) := rotateSelected)
              }
            } else if (i < num_outports * 2) {
              when(lastStgLoadSig.loadSig === B"010") {
                shiftRegs(stg)(i) := rotateSelected
              } otherwise {
                when(~rotateSelected.idxData.msb)(shiftRegs(stg)(i) := rotateSelected)
              }
            } else {
              when(lastStgLoadSig.loadSig === B"100") {
                shiftRegs(stg)(i) := rotateSelected
              } otherwise {
                when(~rotateSelected.idxData.msb)(shiftRegs(stg)(i) := rotateSelected)
              }
            }
          } else {
            shiftRegs(stg)(i) := rotateSelected
          }
        } otherwise {
          shiftRegs(stg)(i) := IndexData(bitwidth, dest_width, placeholder)
        }
      }

      if(stg == 0) {
        when(io.idxIn.valid) {
          shiftMntPipe(0) := rotateOffset
        } otherwise {
          shiftMntPipe(0).clearAll()
        }
      } else if (stg + 1 < log2Up(num_outports * 3)) {
        shiftMntPipe(stg) := shiftMntPipe(stg - 1)
      }
    }
  }

  //out control
  val outValid = Reg(Bool()) init False
  switch(rotation.lastStgLoadSig.loadSig) {
    is (B"001") {
      for (i <- 0 until num_outports) {widthConvertCoreReg(i) := rotation.shiftRegs.last(i)}
      outValid := True
    }
    is (B"010") {
      for (i <- 0 until num_outports) {widthConvertCoreReg(i) := rotation.shiftRegs.last(i + num_outports)}
      outValid := True
    }
    is (B"100") {
      for (i <- 0 until num_outports) {widthConvertCoreReg(i) := rotation.shiftRegs.last(i + num_outports * 2)}
      outValid := True
    }
    default {
      widthConvertCoreReg.foreach(_ := IndexData(bitwidth, dest_width, placeholder))
      outValid := False
    }
  }

  io.idxOut.valid := outValid
  io.idxOut.payload := widthConvertCoreReg
  io.lastGrpOut := Delay(rotation.lastStgLoadSig.lastGrpDelayed, 1, init=False)
}

class IndexGenerator(num_ports: Int, bitwidth: Int, placeholder: BigInt) extends Component {
  val io = new Bundle {
    val seqIn = Vec(slave Flow(IndexData(bitwidth, num_ports)), num_ports)
    val seqOut = master Flow(Vec(IndexData(bitwidth, num_ports), num_ports))
    val lastGrpIn = in Bool()
    val lastGrpOut = out Bool()
  }

  private def combineLastGrpOut(grpInA: Bool, grpInB: Bool): Bool = {
    val grpOut = Bool()
    val grpOutFlag = Reg(UInt(2 bits)) init 0

    grpOut := False

    when(grpOutFlag === U"2'd0") {
      when(grpInA & grpInB) {
        grpOutFlag := U"2'd0"
        grpOut := True
      }.elsewhen(grpInA | grpInB) {
        grpOutFlag := U"2'd1"
      }.otherwise {
        grpOutFlag := U"2'd0"
      }
    }.elsewhen(grpOutFlag === U"2'd1") {
      when(grpInA | grpInB) {
        grpOutFlag := U"2'd0"
        grpOut := True
      }
    }
    grpOut
  }

  val totalIns = pow(2, log2Up(num_ports)).toInt
  val nStgs = log2Up(num_ports)
  val interRes = Vec(Vec(IndexData(bitwidth, num_ports), totalIns), nStgs - 1)

  // declare redremovers
  val removers = List.tabulate(nStgs)(
    i => Array.fill(pow(2, nStgs-i-1).toInt)(
      new RedundancyRemover(pow(2, i+1).toInt, bitwidth, num_ports, placeholder, 16)))

  for (stg <- 0 until nStgs) {
    val nRemoverInputs: Int = pow(2, stg+1).toInt
    if (stg == 0) {
      // deal with irregularity in the first stage
      // TODO: current hw generation logic does not support odd number of inputs
      for (currInIdx <- removers(stg).indices) {
        if ((currInIdx*2) < num_ports) {
          removers(stg)(currInIdx).io.upperIns.payload(0) <> io.seqIn(currInIdx * nRemoverInputs).payload
          removers(stg)(currInIdx).io.lowerIns.payload(0) <> io.seqIn(currInIdx * nRemoverInputs + 1).payload
          removers(stg)(currInIdx).io.upperIns.valid <> io.seqIn(currInIdx * nRemoverInputs).valid
          removers(stg)(currInIdx).io.lowerIns.valid <> io.seqIn(currInIdx * nRemoverInputs + 1).valid
          removers(stg)(currInIdx).io.lastGrpIn <> io.lastGrpIn
        }
      }
    } else {
      val equivInputRangeFactor = pow(2, stg+1).toInt
      for (currInIdx <- removers(stg).indices) {
        val equivInputRange = List(equivInputRangeFactor * currInIdx, equivInputRangeFactor * (currInIdx + 1))
        if (equivInputRange.last <= num_ports) {
          removers(stg)(currInIdx).io.upperIns <> removers(stg-1)(currInIdx * 2).io.outs
          removers(stg)(currInIdx).io.lowerIns <> removers(stg-1)(currInIdx * 2 + 1).io.outs
          removers(stg)(currInIdx).io.lastGrpIn <> combineLastGrpOut(
            removers(stg-1)(currInIdx * 2).io.lastGrpOut, removers(stg-1)(currInIdx * 2 + 1).io.lastGrpOut
          )
        } else if ((equivInputRange.sum / 2).toInt == num_ports) {
          removers(stg)(currInIdx).io.upperIns <> removers(stg-1)(currInIdx * 2).io.outs
          removers(stg)(currInIdx).io.lastGrpIn <> removers(stg-1)(currInIdx * 2).io.lastGrpOut
          removers(stg)(currInIdx).io.lowerIns <> removers(stg-1)(currInIdx * 2).io.outs
        } else if ((equivInputRange.sum / 2).toInt < num_ports) {
          removers(stg)(currInIdx).io.upperIns <> removers(stg-1)(currInIdx * 2).io.outs
          removers(stg)(currInIdx).io.lowerIns <> removers(stg-1)(currInIdx * 2 + 1).io.outs
          removers(stg)(currInIdx).io.lastGrpIn <> combineLastGrpOut(
            removers(stg-1)(currInIdx * 2).io.lastGrpOut, removers(stg-1)(currInIdx * 2 + 1).io.lastGrpOut
          )
        }
      }
    }
  }

  private val actualOutSize: Int = removers.last(0).io.outs.payload.size
  val redundancyMover = new RedundancyMover(actualOutSize, bitwidth, num_ports, placeholder)
  for (i <- removers.last(0).io.outs.payload.indices) {
    redundancyMover.io.inputSeq(i) := Mux(
      removers.last(0).io.outs.payload(i).idxData.msb,
      IndexData(bitwidth, num_ports, placeholder),
      removers.last(0).io.outs.payload(i))
  }

  val uniqueOut = Flow(Vec(IndexData(bitwidth, num_ports), pow(2, log2Up(num_ports)).toInt))
  val uniqueLastGrp = Delay(removers.last(0).io.lastGrpOut, log2Up(actualOutSize), init = False)

  uniqueOut.payload := redundancyMover.io.outputSeq
  uniqueOut.valid := Delay(removers.last(0).io.outs.valid, log2Up(actualOutSize), init = False)
//  io.seqOut.payload := redundancyMover.io.outputSeq
//  io.seqOut.valid := Delay(removers.last(0).io.outs.valid, log2Up(actualOutSize), init = False)
//  io.lastGrpOut := Delay(removers.last(0).io.lastGrpOut, log2Up(actualOutSize), init = False)

  val idxOutWidthConversion = new IndexOutWidthConversion(actualOutSize, num_ports, bitwidth, num_ports, placeholder)
  idxOutWidthConversion.io.idxIn << uniqueOut
  idxOutWidthConversion.io.lastGrpIn <> uniqueLastGrp
  io.seqOut << idxOutWidthConversion.io.idxOut
  io.lastGrpOut <> idxOutWidthConversion.io.lastGrpOut

  // analyze latency
  var lat = 0.0
  for (i <- 0 until nStgs) {
    lat += LatencyAnalysis(removers(i)(0).io.lowerIns.payload(0).idxData, removers(i)(0).io.outs.payload(0).idxData)
  }
  lat += LatencyAnalysis(redundancyMover.io.inputSeq(0).idxData, redundancyMover.io.outputSeq(0).idxData)
  println("latency: " + lat)
}

object IndexGeneratorGen extends App {
  val config = new DefaultConfig
  config.defaultSpinalConfig.withoutEnumString().generate(new IndexGenerator(
    num_ports = 12, bitwidth = 9, placeholder = BigInt("111111111", 2)
  )).printPruned()
}