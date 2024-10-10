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
    val seqIn = Vec(slave Stream(IndexData(bitwidth, num_ports)), num_ports)
    val seqOut = master Stream(IndexData(bitwidth, num_ports))
    val lastGrpIns = in Bits(num_ports bits)
    val lastGrpOut = out Bool()
  }

  def combineLastSig(sig0: Bool, sig1: Bool): Bool = {
    val res = Bool()
    val isSig0Rised, isSig1Rised = Reg(Bool(), init=False)

    when(isSig0Rised || isSig1Rised) {
      res := (isSig0Rised & sig1) | (isSig1Rised & sig0)
      when ((isSig0Rised & sig1) | (isSig1Rised & sig0)) {
        res := True
        isSig0Rised.clear()
        isSig1Rised.clear()
      }.otherwise {
        res := False
      }
    }.otherwise{
      when(sig0 & sig1) {
        res := True
      }.otherwise {
        res := False
        isSig0Rised := sig0
        isSig1Rised := sig1
      }
    }

    res
  }

  def stage(datElem: Vec[Stream[IndexData]], lastElem: Bits, level: Int): (Stream[IndexData], Bool) = {
    if (datElem.length == 1) return (datElem.head, lastElem(0))
    val logicCount = (datElem.length + 1) / 2
    val stageLogic = Vec(Stream(IndexData(bitwidth, num_ports)), logicCount)
    val stageLast = Bits(logicCount bits)

    for (i <- 0 until logicCount) {
      val stgRes = Stream(IndexData(bitwidth, num_ports))
      val stgLastRes = Bool()
      if (i * 2 + 1 < datElem.length) {
        val redRemover = new MergeSortRedundancyRemoverUnit(bitwidth, num_ports, placeholder, 32)
        redRemover.io.idx_ins(0) << datElem(i * 2)
        redRemover.io.idx_ins(1) << datElem(i * 2 + 1)
        redRemover.io.lastGrpIns := lastElem(i * 2 + 1) ## lastElem(i * 2)
        stgLastRes := redRemover.io.lastGrpOut
        stgRes << redRemover.io.idx_outs
      }
      else {
//        val redRepeater = new MergeSortRedundancyRemoverRepeater(bitwidth, num_ports, 32)
//        redRepeater.io.idx_in << datElem(i * 2)
//        redRepeater.io.lastGrpIn := lastElem(i * 2)
//        stgRes << redRepeater.io.idx_out
//        redRepeater.io.neighborFire := stageLogic(i-1).valid
//
//        stgLastRes := redRepeater.io.lastGrpOut

        stgRes.valid := datElem(i * 2).valid
        datElem(i * 2).ready := stgRes.ready
        stgRes.payload.idxData := Mux(
          Vec(for(s <- stageLogic) yield s.ready).asBits.andR,
          datElem(i * 2).payload.idxData,
          U"1'b1" @@ datElem(i * 2).payload.idxData(bitwidth-2 downto 0))
        stgRes.payload.destId := datElem(i * 2).payload.destId
        stgLastRes := lastElem(i * 2)
      }

      stageLogic(i) << stgRes
      stageLast(i) := stgLastRes
    }
    stage(stageLogic, stageLast, level + 1)
  }

  val idxGenRes = stage(io.seqIn, io.lastGrpIns, 0)

  io.seqOut << idxGenRes._1
  io.lastGrpOut := idxGenRes._2

}

object IndexGeneratorGen extends App {
  val config = new DefaultConfig
  config.defaultSpinalConfig.withoutEnumString().generate(new IndexGenerator(
    num_ports = 12, bitwidth = 9, placeholder = BigInt("111111111", 2)
  )).printPruned()
}