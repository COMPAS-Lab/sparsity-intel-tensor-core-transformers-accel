package route_net

import config.DefaultConfig
import spinal.core._
import spinal.lib._
case class MemReqRouteNet (dwidth: Int, node_depth: Int) extends Component {
  val io = new Bundle {
    val ins = Vec(slave Flow(UInt(dwidth bits)), 20)
    val outs = Vec(master Flow(UInt(dwidth bits)), 20)
  }

  // decode inputs to route id
  // FIXME: hardcoded sequence length for encoding the route dest
  // FIXME: hardcoded number of inputs and outputs
  val routeIds = Vec(Reg(UInt(log2Up(20) bits)), 20)
  val insWithId = Vec(Flow(UInt(dwidth + log2Up(20) bits)), 20)

  for ((routeId, in, codedIn) <- (routeIds, io.ins, insWithId).zipped) {
    for(i <- 0 until routeId.getWidth) {
      routeId(i) := in.payload >= 4096/20 * i && in.payload < 4096/20 * (i + 1)
    }
    codedIn.payload := Cat(in.payload, routeId).asUInt
    codedIn.valid := Delay(in.valid, 1)
  }

  // level 1
  val memReqRouteNetL1 = Array.fill(10)(new RouteNode(dwidth + log2Up(20) - 1, node_depth))
  for(i <- 0 until 10) {
    val currPayloadWidth = insWithId(i).payload.getWidth
    memReqRouteNetL1(i).io.ctrl0 := insWithId(i * 2).payload(0)
    memReqRouteNetL1(i).io.ctrl1 := insWithId(i * 2 + 1).payload(0)
    memReqRouteNetL1(i).io.datIn0.payload :=
      insWithId(i * 2).payload(currPayloadWidth-1 downto 1)
    memReqRouteNetL1(i).io.datIn0.valid := insWithId(i * 2).valid
    memReqRouteNetL1(i).io.datIn1.payload :=
      insWithId(i * 2 + 1).payload(currPayloadWidth-1 downto 1)
    memReqRouteNetL1(i).io.datIn1.valid := insWithId(i * 2 + 1).valid
  }

  // level 2
  val memReqRouteNetL2 = Array.fill(10)(new RouteNode(dwidth + log2Up(20) - 2, node_depth))
  for(i <- 0 until 10) {
    val currPayloadWidth = memReqRouteNetL1(i).io.datOut0.payload.getWidth
    memReqRouteNetL2(i).io.ctrl0 := memReqRouteNetL1(i).io.datOut0.payload(0)
    memReqRouteNetL2(i).io.ctrl1 := memReqRouteNetL1((i+5)%10).io.datOut1.payload(0)
    memReqRouteNetL2(i).io.datIn0.payload :=
      memReqRouteNetL1(i).io.datOut0.payload(currPayloadWidth-1 downto 1)
    memReqRouteNetL2(i).io.datIn1.payload :=
      memReqRouteNetL1((i+5)%10).io.datOut1.payload(currPayloadWidth-1 downto 1)
    memReqRouteNetL2(i).io.datIn0.valid := memReqRouteNetL1(i).io.datOut0.valid
    memReqRouteNetL2(i).io.datIn1.valid := memReqRouteNetL1((i+5)%10).io.datOut1.valid
  }

  // level 3
  val memReqRouteNetL3 = Array.fill(10)(new RouteNode(dwidth + log2Up(20) - 3, node_depth))
  for (i <- 0 until 5) {
    val currPayloadWidth = memReqRouteNetL2(i).io.datOut0.payload.getWidth
    memReqRouteNetL3(i).io.ctrl0 := memReqRouteNetL2(i).io.datOut0.payload(0)
    memReqRouteNetL3(i).io.ctrl1 := memReqRouteNetL2((i+3)%5).io.datOut1.payload(0)
    memReqRouteNetL3(i).io.datIn0.payload :=
      memReqRouteNetL2(i).io.datOut0.payload(currPayloadWidth-1 downto 1)
    memReqRouteNetL3(i).io.datIn1.payload :=
      memReqRouteNetL2((i+3) % 5).io.datOut1.payload(currPayloadWidth-1 downto 1)
    memReqRouteNetL3(i).io.datIn0.valid := memReqRouteNetL2(i).io.datOut0.valid
    memReqRouteNetL3(i).io.datIn1.valid := memReqRouteNetL2((i+3)%5).io.datOut1.valid
  }

  for (i <- 5 until 10) {
    val currPayloadWidth = memReqRouteNetL2(i).io.datOut0.payload.getWidth
    memReqRouteNetL3(i).io.ctrl0 := memReqRouteNetL2(i).io.datOut0.payload(0)
    memReqRouteNetL3(i).io.ctrl1 := memReqRouteNetL2((i + 3) % 5 + 5).io.datOut1.payload(0)
    memReqRouteNetL3(i).io.datIn0.payload :=
      memReqRouteNetL2(i).io.datOut0.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL3(i).io.datIn1.payload :=
      memReqRouteNetL2((i + 3) % 5).io.datOut1.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL3(i).io.datIn0.valid := memReqRouteNetL2(i).io.datOut0.valid
    memReqRouteNetL3(i).io.datIn1.valid := memReqRouteNetL2((i + 3) % 5 + 5).io.datOut1.valid
  }

  // level 4
  val memReqRouteNetL4 = Array.fill(10)(new RouteNode(dwidth + log2Up(20) - 4, node_depth))
  for (i <- 0 until 2) {
    val currPayloadWidth = memReqRouteNetL3(i).io.datOut0.payload.getWidth
    memReqRouteNetL4(i).io.ctrl0 := memReqRouteNetL3(i).io.datOut0.payload(0)
    memReqRouteNetL4(i).io.ctrl1 := memReqRouteNetL3((i + 1) % 2).io.datOut1.payload(0)
    memReqRouteNetL4(i).io.datIn0.payload :=
      memReqRouteNetL3(i).io.datOut0.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL4(i).io.datIn1.payload :=
      memReqRouteNetL3((i + 1) % 2).io.datOut1.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL4(i).io.datIn0.valid := memReqRouteNetL3(i).io.datOut0.valid
    memReqRouteNetL4(i).io.datIn1.valid := memReqRouteNetL3((i + 1) % 2).io.datOut1.valid
  }

  for (i <- 2 until 5) {
    val currPayloadWidth = memReqRouteNetL3(i).io.datOut0.payload.getWidth
    memReqRouteNetL4(i).io.ctrl0 := memReqRouteNetL3(i).io.datOut0.payload(0)
    memReqRouteNetL4(i).io.ctrl1 := memReqRouteNetL3((i-2+1) % 3 + 2).io.datOut1.payload(0)
    memReqRouteNetL4(i).io.datIn0.payload :=
      memReqRouteNetL2(i).io.datOut0.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL4(i).io.datIn1.payload :=
      memReqRouteNetL2((i-2+1) % 3 + 2).io.datOut1.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL4(i).io.datIn0.valid := memReqRouteNetL2(i).io.datOut0.valid
    memReqRouteNetL4(i).io.datIn1.valid := memReqRouteNetL2((i-2+1) % 3 + 2).io.datOut1.valid
  }

  for (i <- 5 until 7) {
    val currPayloadWidth = memReqRouteNetL3(i).io.datOut0.payload.getWidth
    memReqRouteNetL4(i).io.ctrl0 := memReqRouteNetL3(i).io.datOut0.payload(0)
    memReqRouteNetL4(i).io.ctrl1 := memReqRouteNetL3((i-5+1) % 2 + 5).io.datOut1.payload(0)
    memReqRouteNetL4(i).io.datIn0.payload :=
      memReqRouteNetL3(i).io.datOut0.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL4(i).io.datIn1.payload :=
      memReqRouteNetL3((i-5+1) % 2 + 5).io.datOut1.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL4(i).io.datIn0.valid := memReqRouteNetL3(i).io.datOut0.valid
    memReqRouteNetL4(i).io.datIn1.valid := memReqRouteNetL3((i-5+1) % 2 + 5).io.datOut1.valid
  }

  for (i <- 7 until 10) {
    val currPayloadWidth = memReqRouteNetL3(i).io.datOut0.payload.getWidth
    memReqRouteNetL4(i).io.ctrl0 := memReqRouteNetL3(i).io.datOut0.payload(0)
    memReqRouteNetL4(i).io.ctrl1 := memReqRouteNetL3((i - 7 + 1) % 3 + 7).io.datOut1.payload(0)
    memReqRouteNetL4(i).io.datIn0.payload :=
      memReqRouteNetL3(i).io.datOut0.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL4(i).io.datIn1.payload :=
      memReqRouteNetL3((i - 7 + 1) % 3 + 7).io.datOut1.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL4(i).io.datIn0.valid := memReqRouteNetL3(i).io.datOut0.valid
    memReqRouteNetL4(i).io.datIn1.valid := memReqRouteNetL3((i - 7 + 1) % 3 + 7).io.datOut1.valid
  }

  // level 5
  val memReqRouteNetL5 = Array.fill(10)(new RouteNode(dwidth + log2Up(20) - 5, node_depth))
  for (i <- List(0, 1, 5, 6)) {
    val currPayloadWidth = memReqRouteNetL4(i).io.datOut0.payload.getWidth
    memReqRouteNetL5(i).io.ctrl0 := memReqRouteNetL4(i).io.datOut0.payload(0)
    memReqRouteNetL5(i).io.ctrl1 := memReqRouteNetL4(i).io.datOut1.payload(0)
    memReqRouteNetL5(i).io.datIn0.payload :=
      memReqRouteNetL4(i).io.datOut0.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL5(i).io.datIn1.payload :=
      memReqRouteNetL4(i).io.datOut1.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL5(i).io.datIn0.valid := memReqRouteNetL4(i).io.datOut0.valid
    memReqRouteNetL5(i).io.datIn1.valid := memReqRouteNetL4(i).io.datOut1.valid
  }

  for (i <- 2 until 5) {
    val currPayloadWidth = memReqRouteNetL4(i).io.datOut0.payload.getWidth
    memReqRouteNetL5(i).io.ctrl0 := memReqRouteNetL3(i).io.datOut0.payload(0)
    memReqRouteNetL5(i).io.ctrl1 := memReqRouteNetL3(i % 3 + 2).io.datOut1.payload(0)
    memReqRouteNetL5(i).io.datIn0.payload :=
      memReqRouteNetL2(i).io.datOut0.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL5(i).io.datIn1.payload :=
      memReqRouteNetL2(i % 3 + 2).io.datOut1.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL5(i).io.datIn0.valid := memReqRouteNetL2(i).io.datOut0.valid
    memReqRouteNetL5(i).io.datIn1.valid := memReqRouteNetL2(i % 3 + 2).io.datOut1.valid
  }

  for (i <- 7 until 10) {
    val currPayloadWidth = memReqRouteNetL4(i).io.datOut0.payload.getWidth
    memReqRouteNetL5(i).io.ctrl0 := memReqRouteNetL4(i).io.datOut0.payload(0)
    memReqRouteNetL5(i).io.ctrl1 := memReqRouteNetL4((i - 7 + 2) % 3 + 7).io.datOut1.payload(0)
    memReqRouteNetL5(i).io.datIn0.payload :=
      memReqRouteNetL4(i).io.datOut0.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL5(i).io.datIn1.payload :=
      memReqRouteNetL4((i - 7 + 2) % 3 + 7).io.datOut1.payload(currPayloadWidth - 1 downto 1)
    memReqRouteNetL5(i).io.datIn0.valid := memReqRouteNetL4(i).io.datOut0.valid
    memReqRouteNetL5(i).io.datIn1.valid := memReqRouteNetL4((i - 7 + 2) % 3 + 7).io.datOut1.valid
  }

  // To output
  for (i <- 0 until 10) {
    io.outs(i*2) <> memReqRouteNetL5(i).io.datOut0
    io.outs(i*2+1) <> memReqRouteNetL5(i).io.datOut1
  }
}

object MemReqRouteNetGen {
  def main(args: Array[String]): Unit = {
    val gen = new DefaultConfig
    gen.defaultSpinalConfig.withoutEnumString().generate(
      new MemReqRouteNet(16, 32)
      )
  }
}