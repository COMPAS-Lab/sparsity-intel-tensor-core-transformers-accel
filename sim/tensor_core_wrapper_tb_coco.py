
import json, os
from pathlib import Path
from enum import Enum
import itertools
import numpy as np

import cocotb
# from cocotb.runner import get_runner
from cocotb.binary import BinaryValue
from cocotb.handle import SimHandleBase
from cocotb.triggers import (
    RisingEdge, 
    FallingEdge, 
    Timer, 
    Combine, 
    ReadOnly, 
    with_timeout
)
from cocotb.clock import Clock
from tb.bfp_mat_gen import (
    BfpType,
    BFP,
    mat_a_gen, 
    mat_b_gen,  
    prepare_onchip_input_files,
    prepare_onchip_idx_file,
    prepare_onchip_matb_file,
    update_or_create_json,
    hex_to_float
)

def hex_to_bin(x: str, n_bits: int):
    return bin(int(x, 16))[2:].zfill(n_bits)

async def clkCycles(clk, n_cycles):
    for _ in range(n_cycles):
        await RisingEdge(clk)

async def Equal(signals, values):
    triggered = all([s != v for s, v in zip(signals, values)])
    while triggered:
        cond = [s != v for s, v in zip(signals, values)]
        triggered = all(cond)
        await Timer(1, units="ns")

class hbm_chan:
    class direction(Enum):
        HBM_IN = 0
        HBM_OUT = 1

    def __init__(self, dut: SimHandleBase, hbm_id: int, hbm_dir: direction):
        self.dut = dut
        self.hbm_id = hbm_id
        self.hbm_dir = hbm_dir
    
    async def init_hbm_chan(self, hbm_id_offset):
        exec(f"self.dut.hbm_{self.hbm_id + hbm_id_offset}_ready.value = 1")

        if self.hbm_dir == self.direction.HBM_IN:
            exec(f"self.dut.port_error_tcarray_in_{self.hbm_id}.value = 0")
            exec(f"self.dut.data_tcarray_in_{self.hbm_id}.value = 0")
            exec(f"self.dut.almost_empty_tcarray_in_{self.hbm_id}.value = 0")

        if self.hbm_dir == self.direction.HBM_OUT:
            exec(f"self.dut.port_error_tcarray_out_{self.hbm_id}.value = 0")
            exec(f"self.dut.almost_full_tcarray_out_{self.hbm_id}.value = 0")

class tensor_core_array_wrapper_dut:
    # NOTE: make sure the following hw config is the same as what is defined in 
    # src/main/scala/mvm/tensor_core_array_wrapper.scala
    _hw_row = 6
    _hw_col = 12
    _hw_chainlen = 8
    _hw_ridx_size = 12
    _hw_cidx_size = 10

    def __init__(
            self, 
            dut: SimHandleBase, 
            n_hbm_in_chan: int, 
            n_hbm_out_chan: int,
            data_dir: str,
            debug=False):
        
        self.dut = dut
        self.hbm_in_chans = [hbm_chan(dut, i, hbm_chan.direction.HBM_IN) for i in range(n_hbm_in_chan)]
        self.hbm_out_chans = [hbm_chan(dut, i, hbm_chan.direction.HBM_OUT) for i in range(n_hbm_out_chan)]
        self.debug = debug
        self.data_dir = data_dir
        self.mat_a_np = None
        self.mat_b_np = None
        self.ref_res_np = None
        self.sim_res = None

    def init_test_stimulus(self, hidx: int):
        
        hw_config_path = self.data_dir + f"/hwconfig_h{hidx}.json"
        with open(hw_config_path, "r") as f:
            hw_config = json.load(f)

        self.mat_a_bounds = list(hw_config["mat a size"])
        self.idx_bounds = list(hw_config["idx_len"])
        self.lb_idx_list = list(range(len(hw_config["idx_len"])))
        self.mat_b_bound = int(hw_config["mat b size"])
        self.mat_b_vec_size = int(hw_config["mat b vec size"])

        mat_a_data_hbm = [[] for _ in range(len(self.hbm_in_chans))]
        idx_data_hbm = []
        mat_b_data_hbm = []
        for lb in self.lb_idx_list:
            for hbm_idx in range(len(self.hbm_in_chans)-1):
                mat_a_fpath = self.data_dir + f"/onchip_mat_a_hbm{hbm_idx}_h{hidx}_lb{lb}.mem"
                with open(mat_a_fpath, "r") as fp:
                    mat_a_data_hbm[hbm_idx] += [l.strip() for l in fp.readlines()]

            idx_fpath = self.data_dir + f"/onchip_idx_hbm_h{hidx}_lb{lb}.mem"
            with open(idx_fpath, "r") as fp:
                idx_data_hbm += [l.strip() for l in fp.readlines()]

        mat_b_fpath = self.data_dir + f"/onchip_mat_b_hbm.mem"
        with open(mat_b_fpath, "r") as fp:
            mat_b_data_hbm += [l.strip() for l in fp.readlines()]

        self.mat_a_data_hbm = mat_a_data_hbm
        self.idx_data_hbm = idx_data_hbm
        self.mat_b_data_hbm = mat_b_data_hbm

        self.dut._log.info(f"Loaded stimulus file for {hw_config_path}, {len(self.lb_idx_list)} large blocks in total")

    def init_test_stimulus_wo_intermed_data(self, hidx: int, 
                                            inst_id: str, attn_data_path: str, 
                                            inter_config_path: str):

        mat_a_np, mat_a_data_list = mat_a_gen(
                            inst_id,
                            BFP(BfpType.BFP_12), 
                            self._hw_col, 
                            ridx_size=self._hw_ridx_size, 
                            cidx_size=self._hw_cidx_size, 
                            bfp_friendly_dat=False,
                            hidx_list=[hidx],
                            disable_file_writting = True,
                            in_data_path=Path(attn_data_path),
                            out_data_path=Path(inter_config_path))
    
        mat_b_np, mat_b_data_list = mat_b_gen(
                            self._hw_chainlen, 
                            BFP(BfpType.BFP_12), 0, self._hw_row, 
                            disable_file_writting=True, 
                            out_data_path=Path(inter_config_path))

        # get data from generated list of mat a and b
        n_lbs = len(mat_a_data_list[hidx].keys())
        self.dut._log.info(f"number of large blocks: {n_lbs}")

        input_data = prepare_onchip_input_files(
            Path(inter_config_path),
            mat_a_data_list,
            self._hw_col,
            hidx,
            n_lbs,
            disable_file_writting=True
        )
        idx_data = prepare_onchip_idx_file(
            Path(inter_config_path),
            mat_a_data_list,
            self._hw_col,
            self._hw_cidx_size,
            hidx,
            n_lbs,
            disable_file_writting=True,
        )
        matb_data = prepare_onchip_matb_file(
            Path(inter_config_path),
            mat_b_data_list,
            disable_file_writting=True,
            head_idx=hidx
        )
        
        hw_config_path = self.data_dir + f"/hwconfig_h{hidx}.json"
        with open(hw_config_path, "r") as f:
            hw_config = json.load(f)

        self.mat_a_bounds = list(hw_config["mat a size"])
        self.idx_bounds = list(hw_config["idx_len"])
        self.lb_idx_list = list(range(len(hw_config["idx_len"])))
        self.mat_b_bound = int(hw_config["mat b size"])
        self.mat_b_vec_size = int(hw_config["mat b vec size"])

        # flatten idx and mat a data
        self.mat_a_data_hbm = [[] for _ in range(len(input_data[0]))]
        self.idx_data_hbm = []
        for lb in self.lb_idx_list:
            self.idx_data_hbm += idx_data[lb]
            for hbm_idx in range(len(input_data[0])):
                self.mat_a_data_hbm[hbm_idx] += input_data[lb][hbm_idx]

        self.mat_b_data_hbm = matb_data
        self.mat_b_np = mat_b_np
        # get n_rows from mat_b_np, pad mat_a_np's cols to the same size
        n_rows = self.mat_b_np.shape[0]
        self.mat_a_np = np.zeros((mat_a_np[hidx].shape[0], n_rows), dtype=mat_b_np.dtype)
        self.mat_a_np[:, :mat_a_np[hidx].shape[1]] = mat_a_np[hidx]
        self.ref_res_np = np.dot(self.mat_a_np, self.mat_b_np)

        self.dut._log.info(f"Loaded stimulus file for {hw_config_path}, {len(self.lb_idx_list)} large blocks in total")

    async def init_inputs(self):
        # init inputs
        self.dut.clrn.value = 1
        self.dut.tc_ctrl.value = 0
        self.dut.mbvec_size.value = 0
        self.dut.lat_counter.value = 0
        self.dut.mbidx_rd_bound.value = 0
        self.dut.ma_rd_bound.value = 0
        self.dut.buf_ld_sel.value = 0

        for hins in self.hbm_in_chans:
            await hins.init_hbm_chan(0)

        for houts in self.hbm_out_chans:
            await houts.init_hbm_chan(len(self.hbm_in_chans))

    async def issue_soft_rst(self, hold_time: int):
        # soft reset
        self.dut.tc_ctrl[1].value = 1
        await Timer(hold_time, units="ns")
        self.dut.tc_ctrl[1].value = 0
        self.dut._log.info("soft rst finished")

    async def submit_jobs(self):
        self.dut.tc_ctrl.value = 0
        
        for idx_bound, mata_bound in zip(self.idx_bounds, self.mat_a_bounds):
            self.dut.mbidx_rd_bound.value = idx_bound
            self.dut.ma_rd_bound.value = mata_bound
            await clkCycles(self.dut.clk, 5)
            self.dut.tc_ctrl[3].value = 1
            await clkCycles(self.dut.clk, 5)
            self.dut.tc_ctrl[3].value = 0
            await clkCycles(self.dut.clk, 5)

        await clkCycles(self.dut.clk, 1)
        self.dut.mbidx_rd_bound.value = 0
        self.dut.ma_rd_bound.value = 0

    async def load_idx_process(self):
        self.dut._log.info("load idx process started")
        self.dut.buf_ld_sel.value = 0

        await clkCycles(self.dut.clk, 2)

        self.dut.tc_ctrl[0].value = 1
        await clkCycles(self.dut.clk, 2)
        self.dut.tc_ctrl[0].value = 0

        await RisingEdge(self.dut.start_tcarray_in_0)
        await FallingEdge(self.dut.start_tcarray_in_0)
        await Timer(1, "ns")
        self.dut.almost_empty_tcarray_in_0.value = 1

        await clkCycles(self.dut.clk, 150)
        self.dut.almost_empty_tcarray_in_0.value = 0

        for rd_ptr in range(sum(self.idx_bounds)):
            await Timer(1, "ns")
            self.dut.data_tcarray_in_0.value = \
                BinaryValue(hex_to_bin(self.idx_data_hbm[rd_ptr], 256), n_bits=256)
            await Equal([self.dut.select_tcarray_in_0], [1])
            await clkCycles(self.dut.clk, 1)

        self.dut.almost_empty_tcarray_in_0.value = 1
    
    async def load_mat_a_process(self):
        self.dut._log.info("load mat a process started")
        start_tcarray_in, select_tcarray_in = [], []
        n_mat_a_hbm_chans = len(self.mat_a_data_hbm)
        for idx in range(n_mat_a_hbm_chans):
            exec(f"start_tcarray_in += [self.dut.start_tcarray_in_{idx+1}]")
            exec(f"select_tcarray_in += [self.dut.select_tcarray_in_{idx+1}]")

        start_tcarray_in_rising_edge = [RisingEdge(i) for i in start_tcarray_in]
        start_tcarray_in_falling_edge = [FallingEdge(i) for i in start_tcarray_in]
        await Combine(*start_tcarray_in_rising_edge)
        await Combine(*start_tcarray_in_falling_edge)

        await Timer(1, "ns")
        for idx in range(n_mat_a_hbm_chans):
            exec(f"self.dut.almost_empty_tcarray_in_{idx+1}.value = 1")

        await clkCycles(self.dut.clk, 120)
        for idx in range(n_mat_a_hbm_chans):
            exec(f"self.dut.almost_empty_tcarray_in_{idx+1}.value = 0")

        for col_ptr in range(sum(self.mat_a_bounds)):
            await Timer(1, "ns")
            for idx in range(n_mat_a_hbm_chans):
                exec(f"self.dut.data_tcarray_in_{idx+1}.value = " + 
                     f"BinaryValue(hex_to_bin(self.mat_a_data_hbm[{idx}][col_ptr], 256), n_bits=256)")
            
            await Equal(select_tcarray_in, [1] * n_mat_a_hbm_chans)
            await clkCycles(self.dut.clk, 1)

    async def load_mat_b_process(self):
        self.dut._log.info("load mat b process started")

        self.dut.mbidx_rd_bound.value = self.mat_b_bound
        self.dut.mbvec_size.value = self.mat_b_vec_size

        # switch to load mat b mode
        self.dut.buf_ld_sel.value = 1
        await clkCycles(self.dut.clk, 10)

        # start mat b loading
        self.dut.tc_ctrl[0].value = 1
        await clkCycles(self.dut.clk, 1)
        self.dut.tc_ctrl[0].value = 0

        await RisingEdge(self.dut.start_tcarray_in_0)
        await FallingEdge(self.dut.start_tcarray_in_0)
        await Timer(1, "ns")
        self.dut.almost_empty_tcarray_in_0.value = 1
        await clkCycles(self.dut.clk, 150)
        self.dut.almost_empty_tcarray_in_0.value = 0
        await clkCycles(self.dut.clk, 1)

        for rd_ptr in range(self.mat_b_bound):
            await Timer(1, "ns")
            self.dut.data_tcarray_in_0.value = \
                BinaryValue(hex_to_bin(self.mat_b_data_hbm[rd_ptr], 256), n_bits=256)
            await Equal([self.dut.select_tcarray_in_0], [1])
            await clkCycles(self.dut.clk, 1)

        await clkCycles(self.dut.clk, 20)
        self.dut.buf_ld_sel.value = 0

    async def start_cal(self):
        self.dut._log.info("calc started")
        await Equal([self.dut.buf_ld_sel, self.dut.tc_ctrl[0]], [0, 1])
        await clkCycles(self.dut.clk, 1)
        await RisingEdge(self.dut.select_tcarray_in_0)

        await clkCycles(self.dut.clk, 10)
        await Timer(1, "ns")
        self.dut.tc_ctrl[2].value = 1
        await clkCycles(self.dut.clk, 10)
        await Timer(1, "ns")
        self.dut.tc_ctrl[2].value = 0

    async def wait_compute_finish(self, hidx: int):
        for f in range(len(self.lb_idx_list)):
            self.dut._log.info(f"waiting for {f} th tile to finish...")
            await with_timeout(
                Equal([self.dut.softClrnArea_tcArray_io_calFin], [1]), 500, "us")
            await clkCycles(self.dut.clk, 2)

        await clkCycles(self.dut.clk, 20)

        self.dut._log.info(f"MatMul finished")
        self.dut._log.info(
            f"total lat counter: {self.dut.softClrnArea_totalLatCounter_value.value.integer}")
        self.dut._log.info(
            f"compute lat counter: {self.dut.softClrnArea_tcArray_io_computeLatCounter.value.integer}")
        self.dut._log.info(
            f"mat b load counter: {self.dut.softClrnArea_matBLoadCounter_value.value.integer}")

        hw_config_path = self.data_dir + f"/hwconfig_h{hidx}.json"
        hw_config = {}
        hw_config["total_lat_counter_res"] = self.dut.softClrnArea_totalLatCounter_value.value.integer
        hw_config["compute_lat_counter_res"] = self.dut.softClrnArea_tcArray_io_computeLatCounter.value.integer
        update_or_create_json(hw_config_path, hw_config)
        
    def calc_bdwidth(self, n_hw_cols: int):

        def cycles_to_bd(n_cycles, data_transfer):
            FREQ = 300.0

            time_period = 1. / (FREQ * 1e6)
            total_time = n_cycles * time_period
            bandwidth = (data_transfer / total_time) / 1e9
            return bandwidth
        
        if self.debug:
            mata_in_sum = 0
            for c in range(n_hw_cols):
                exec(f"mata_in_sum += self.dut.softClrnArea_tcArray.debug_sp_incounter_c{c}_value.value.integer")
            
            # 88 is the output width and 12 is the ridx width
            mata_in_sum *= (88 + 12) / 8
            running_lat = self.dut.softClrnArea_tcArray_io_computeLatCounter.value.integer
            mata_in_req_bd = cycles_to_bd(running_lat, mata_in_sum)

            matb_out_sum = self.dut.softClrnArea_tcArray.debug_out_counter_value.value.integer
            matb_out_req_bd = cycles_to_bd(running_lat, matb_out_sum)

            self.dut._log.info(f"Mat A input bandwidth: {mata_in_req_bd:.2f} GB/s")
            self.dut._log.info(f"Output bandwidth: {matb_out_req_bd:.2f} GB/s")

        return

    async def get_mat_res_output(self, res_shape: tuple):
        res_r, res_c = res_shape
        last_hw_row = self._hw_row - 1
        
        res_buffer = [[float("inf")] * res_c] * res_r
        res_col_counter = 0
        curr_res_row_counter = 0
        tc_array_res_blkdata, tc_array_res_ridx = 0., 0
        tc_array_res_valid = 0
        # check valid signal every clock cycle
        while curr_res_row_counter < res_r - 1:
            await clkCycles(self.dut.clk, 1)
            # yield to wait for internal module signal propagation
            await Timer(9, units="ns")

            tc_core = getattr(self.dut.softClrnArea_tcArray, f"u_tc_core_r_{last_hw_row}_c_0")
            tc_array_res_valid = tc_core.io_res_valid.value.integer
            if tc_array_res_valid == 1:
                for tc_r in range(self._hw_row):
                    tc_array_res_cidx = res_col_counter * self._hw_row + tc_r
                    for tc_c in range(self._hw_col):
                        curr_tc_core = getattr(self.dut.softClrnArea_tcArray, f"u_tc_core_r_{tc_r}_c_{tc_c}")
                        curr_last_row_tc_core = getattr(self.dut.softClrnArea_tcArray, f"u_tc_core_r_{last_hw_row}_c_{tc_c}")
                        for tc_tcc_col in range(3):
                            curr_tc_core_col = getattr(curr_tc_core, f"io_res_payload_{tc_tcc_col}_blkData")
                            tc_array_res_blkdata = hex_to_float(f"{curr_tc_core_col.value.integer:x}".ljust(32 // 4, "0"))
                            tc_array_res_ridx = curr_last_row_tc_core.io_res_payload_0_rIdx.value.integer * 3 + tc_tcc_col

                            # pad zeros to the tail to make it 32-bit
                            # self.dut._log.info(f"tc_array_res_blkdata({tc_r}, {tc_c}, {tc_tcc_col}): {tc_array_res_blkdata:.3f}")
                            # self.dut._log.info(f"tc_array_res_ridx: {tc_array_res_ridx}")
                            # self.dut._log.info(f"tc_array_res_cidx: {tc_array_res_cidx}")
                            # self.dut._log.info(f"tc_tcc_col: {tc_tcc_col}")
                            res_buffer[tc_array_res_ridx][tc_array_res_cidx] = tc_array_res_blkdata
                    
                    curr_res_row_counter = tc_array_res_ridx
                
                if tc_array_res_cidx == res_c - 1:
                    res_col_counter = 0
                else:
                    res_col_counter += 1

        self.sim_res = np.array(res_buffer)

@cocotb.test()
async def tensor_core_array_wrapper_test(dut):

    # specify sequece id and head index here
    inst_id = "iiSeqInst0139"
    hidx = 846
    # provide attention data extracted from huggingface models here
    attn_data_path = "/compas-old/projects/sparse-attention/llama2-7b-chat-4k-attn-bfp20-samsum/"
    inter_config_path = f"/compas-old/projects/sparse-attention/sim_test/llama2-7b-chat-4k-attn-bfp20-samsum/{inst_id}"
    
    main_clk_period = 10
    main_clk = Clock(dut.clk, main_clk_period, units="ns")
    dut_tester = tensor_core_array_wrapper_dut(
        dut, 8, 2, 
        data_dir = inter_config_path,
    )
    dut_tester.init_test_stimulus_wo_intermed_data(
        hidx, inst_id, attn_data_path, inter_config_path)
    dut_tester.dut._log.info(f"shapes: " + 
        f"mat a: {dut_tester.mat_a_np.shape}; " +
        f"mat b: {dut_tester.mat_b_np.shape}; " +
        f"mat res: {dut_tester.ref_res_np.shape}")
    
    cocotb.start_soon(main_clk.start(start_high=True))
    await dut_tester.init_inputs()

    # reset
    await clkCycles(dut.clk, 5)
    dut.clrn.value = 0
    await clkCycles(dut.clk, 5)
    dut.clrn.value = 1

    await clkCycles(dut.clk, 5)
    await dut_tester.issue_soft_rst(main_clk_period * 5)
    
    await clkCycles(dut.clk, 10)
    # start loading mat b
    await dut_tester.load_mat_b_process()

    # start issuing jobs
    await dut_tester.submit_jobs()

    # start loading processes
    await cocotb.start(dut_tester.load_idx_process())
    await cocotb.start(dut_tester.load_mat_a_process())
    # res dumping is broken for multi-large-block mode currently
    # see bfp_mat_gen.py line 518
    await cocotb.start(dut_tester.get_mat_res_output(dut_tester.ref_res_np.shape))

    # start calculation
    cocotb.start_soon(dut_tester.start_cal())
    await dut_tester.wait_compute_finish(hidx)
    await Timer(1, "us")

    # store sim results
    sim_res_path = f"./sim_res_{inst_id}_{hidx}.npy"
    np.save(sim_res_path, dut_tester.sim_res)
    dut_tester.dut._log.info(f"saved sim res to {sim_res_path}")

    dut_tester.calc_bdwidth(16)


# def tensor_core_array_wrapper_test_runner():
#     hdl_toplevel_lang = os.getenv("HDL_TOPLEVEL_LANG", "verilog")
#     sim = os.getenv("SIM", "questa")

#     proj_path = Path(__file__).resolve().parent

#     # construct sources
#     sources = []
#     # get generated .v files
#     gen_path = proj_path.parent / "src" / "generated"
#     verilog_files = list(gen_path.glob("*.v"))
#     sources += verilog_files
#     # add other specific srcs
#     sources += [
#         proj_path / "tb" / "fourteennm_atoms.sv", 
#         proj_path.parent / "src" / "main" / "sverilog" / "blk_delay_core.sv",    
#         proj_path.parent / "src" / "main" / "sverilog" / "out_asym_fifo.sv",    
#     ]

#     # get pre-sim script file
#     pre_sim_scripts = [
#         proj_path.parent / "mentor" / "msim_setup.tcl",
#         proj_path.parent / "tensor_core_wrapper_tb_add_wave.do"
#     ]

#     vsim_libraries = [
#         "-L", "work", 
#         "-L", "work_lib", 
#         "-L", "altera_ver", 
#         "-L", "lpm_ver", 
#         "-L", "sgate_ver", 
#         "-L", "altera_mf_ver", 
#         "-L", "altera_lnsim_ver", 
#         "-L", "fourteennm_ver", 
#         "-L", "fourteennm_ct1_ver", 
#         "-L", "dsp_prime_10", 
#         "-L", "tensor_core_accu", 
#         "-L", "tensor_core_entry_bf12", 
#         "-L", "tensor_core_bf12", 
#         "-L", "tensor_core_start_bf12",
#     ]

#     runner = get_runner(sim)
#     runner.build(
#         sources=sources,
#         hdl_toplevel="tensor_core_array_wrapper",
#         clean=True,
#     )

#     runner.test(
#         hdl_toplevel="tensor_core_array_wrapper", 
#         test_module="tensor_core_wrapper_tb_coco",
#         hdl_toplevel_lang=hdl_toplevel_lang,
#         gui=True,
#         waves=False,
#         test_args=["-64"] + vsim_libraries,
#         pre_cmd=[str(s) for s in pre_sim_scripts]
#     )


# if __name__ == "__main__":
#     tensor_core_array_wrapper_test_runner()
