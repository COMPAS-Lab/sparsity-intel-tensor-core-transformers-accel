package mylib

import config.DefaultConfig
import spinal.core._
import spinal.lib._
import intel_ips.banked_buffer

case class CacheBank(depth: Int, n_reps: Int, dwidth: Int, n_parallel_outs: Int, id_width: Int) extends Component {
  val io = new Bundle {
    val datLoadIn = slave Flow (UInt(dwidth bits))
    val datReadAddr = in Vec(UInt (log2Up(depth) + id_width bits), n_reps)
    val datReadOut = Vec(master Flow (UInt(dwidth * n_parallel_outs + id_width bits)), n_reps)
    val datReadEn = in Vec(Bool(), n_reps)
  }
  val cacheRdDelay = 3
  // generate brams
  val cache = Array.fill(n_reps)(new banked_buffer(dwidth = dwidth,
                                                   awidth = log2Up(depth),
                                                   n_parallel_vecs = n_parallel_outs,
                                                   id_width = id_width,
                                                   rd_delay = cacheRdDelay))
  val loadAddrPtr = Counter(log2Up(depth) bits)

  when(io.datLoadIn.fire) (loadAddrPtr.increment())

  for (r <- 0 until n_reps) {
    cache(r).io.wren := io.datLoadIn.valid
    cache(r).io.wraddress := loadAddrPtr
    cache(r).io.dat_in := io.datLoadIn.payload
    cache(r).io.rdaddress := io.datReadAddr(r)
    io.datReadOut(r).payload := cache(r).io.dat_out
    io.datReadOut(r).valid := Delay(io.datReadEn(r), cacheRdDelay)
  }
}

case class BankedMatCache(n_banks: Int,
                          n_reps: Int,
                          rep_bank_ids: Array[Int],
                          bank_depth: Int,
                          n_parallel_vecs: Int,
                          dwidth: Int) extends Component {
  val io = new Bundle {
    val datLoadIn = slave Flow (UInt(dwidth bits))
    // Replicated bank reads
    val datRdAddrRepBanks = Vec(Vec(slave Flow (UInt(log2Up(bank_depth) + log2Up(n_banks) bits)), n_reps), rep_bank_ids.length)
      val datRdOutRepBanks = Vec(Vec(master Flow (UInt(dwidth * n_parallel_vecs + log2Up(n_banks) bits)), n_reps), rep_bank_ids.length)
    // Unreplicated bank reads
    val datRdAddrUnrepBanks = Vec(slave Flow (UInt(log2Up(bank_depth) + log2Up(n_banks) bits)), n_banks - rep_bank_ids.length)
    val datRdOutUnrepBanks = Vec(master Flow (UInt(dwidth * n_parallel_vecs + log2Up(n_banks) bits)), n_banks - rep_bank_ids.length)
  }

  // generate banks
  val mems = Array.ofDim[CacheBank](n_banks)
  for (i <- 0 until n_banks) {
    if (rep_bank_ids contains (i)) {
      mems(i) = CacheBank(bank_depth, n_reps, dwidth, n_parallel_vecs, log2Up(n_banks))
    } else {
      mems(i) = CacheBank(bank_depth, 1, dwidth, n_parallel_vecs, log2Up(n_banks))
    }
  }

  // loading logic, self-increment once start
  val perBankLoadCounter = Counter(bank_depth)
  val currLoadingCounter = Counter(n_banks)

  when(io.datLoadIn.fire) {
    perBankLoadCounter.increment()
  }
  when(perBankLoadCounter.willOverflow) {
    currLoadingCounter.increment()
  }

  // connect ports
  for (i <- 0 until n_banks) {
    when(currLoadingCounter === i) {
      mems(i).io.datLoadIn <> io.datLoadIn
    } otherwise {
      mems(i).io.datLoadIn.setIdle()
    }
    if (rep_bank_ids contains(i)) {
      for (r <- 0 until n_reps) {
        mems(i).io.datReadAddr(r) <> io.datRdAddrRepBanks(i)(r).payload
        mems(i).io.datReadEn(r) <> io.datRdAddrRepBanks(i)(r).valid
        mems(i).io.datReadOut(r) <> io.datRdOutRepBanks(i)(r)
      }
    } else {
      mems(i).io.datReadAddr(0) <> io.datRdAddrUnrepBanks(i - rep_bank_ids.length).payload
      mems(i).io.datReadEn(0) <> io.datRdAddrUnrepBanks(i - rep_bank_ids.length).valid
      mems(i).io.datReadOut(0) <> io.datRdOutUnrepBanks(i - rep_bank_ids.length)
    }
  }
}