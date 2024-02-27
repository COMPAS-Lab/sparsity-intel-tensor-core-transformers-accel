package route_net

import spinal.core._
import spinal.lib._

class RouteNode(dwidth: Int, fifo_depth: Int) extends Component {
  val io = new Bundle {
    val datIn0, datIn1 = slave Flow(UInt(dwidth bits))
    val ctrl0, ctrl1 = in Bool()
    val datOut0, datOut1 = master Flow(UInt(dwidth bits))
  }

  val datIn0D1 = Delay(io.datIn0, 1)
  val datIn1D1 = Delay(io.datIn1, 1)

  val upperRouteArea = new Area {
    val dat0Fifo, dat1Fifo = StreamFifo(UInt(dwidth bits), fifo_depth)
    val fifoSelCounter = Counter(1 bits)
    dat0Fifo.io.pop.ready := Bool(true)
    dat1Fifo.io.pop.ready := Bool(true)

    when(io.ctrl0) {
      dat0Fifo.io.push <> datIn0D1.toStream(null)
      dat1Fifo.io.push.setIdle()
    }.otherwise {
      dat1Fifo.io.push <> datIn0D1.toStream(null)
      dat0Fifo.io.push.setIdle()
    }

    when(fifoSelCounter < 1) {
      io.datOut0 <> dat0Fifo.io.pop.asFlow
      when(dat0Fifo.io.pop.fire) {fifoSelCounter.increment()}
    }.otherwise {
      io.datOut0 <> dat1Fifo.io.pop.asFlow
      when(dat1Fifo.io.pop.fire) {fifoSelCounter.increment()}
    }
  }

  val lowerRouteArea = new Area {
    val dat0Fifo, dat1Fifo = StreamFifo(UInt(dwidth bits), fifo_depth)
    val fifoSelCounter = Counter(1 bits)
    dat0Fifo.io.pop.ready := Bool(true)
    dat1Fifo.io.pop.ready := Bool(true)

    when(io.ctrl1) {
      dat0Fifo.io.push <> datIn1D1.toStream(null)
      dat1Fifo.io.push.setIdle()
    }.otherwise {
      dat1Fifo.io.push <> datIn1D1.toStream(null)
      dat0Fifo.io.push.setIdle()
    }

    when(fifoSelCounter < 1) {
      io.datOut1 <> dat0Fifo.io.pop.asFlow
      when(dat0Fifo.io.pop.fire) {
        fifoSelCounter.increment()
      }
    }.otherwise {
      io.datOut1 <> dat1Fifo.io.pop.asFlow
      when(dat1Fifo.io.pop.fire) {
        fifoSelCounter.increment()
      }
    }
  }
}