
import json, os
from pathlib import Path
from enum import Enum
import cocotb
# from cocotb.runner import get_runner
from cocotb.binary import BinaryValue
from cocotb.handle import SimHandleBase
from cocotb.triggers import RisingEdge, FallingEdge, Timer, Combine, with_timeout
from cocotb.clock import Clock

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
    
    async def init_hbm_chan(self):
        exec(f"self.dut.hbm_{self.hbm_id}_ready.value = 1")

        if self.hbm_dir == self.direction.HBM_IN:
            exec(f"self.dut.port_error_tcarray_in_{self.hbm_id}.value = 0")
            exec(f"self.dut.data_tcarray_in_{self.hbm_id}.value = 0")
            exec(f"self.dut.almost_empty_tcarray_in_{self.hbm_id}.value = 0")

        if self.hbm_dir == self.direction.HBM_OUT:
            exec(f"self.dut.port_error_tcarray_out_{self.hbm_id}.value = 0")
            exec(f"self.dut.almost_full_tcarray_out_{self.hbm_id}.value = 0")

class tensor_core_array_wrapper_dut:
    def __init__(
            self, 
            dut: SimHandleBase, 
            n_hbm_in_chan: int, 
            n_hbm_out_chan:int):
        
        self.dut = dut
        self.hbm_in_chans = [hbm_chan(dut, i, hbm_chan.direction.HBM_IN) for i in range(n_hbm_in_chan)]
        self.hbm_out_chans = [hbm_chan(dut, i, hbm_chan.direction.HBM_OUT) for i in range(n_hbm_out_chan)]

    def init_test_stimulus(self, base_path: str, hidx: int):
        
        hw_config_path = base_path + f"/hwconfig_h{hidx}.json"
        with open(hw_config_path, "r") as f:
            hw_config = json.load(f)

        self.mat_a_bounds = list(hw_config["mat a size"])
        self.idx_bounds = list(hw_config["idx_len"])
        self.lb_idx_list = list(range(len(hw_config["idx_len"])))

        mat_a_data_hbm_0, mat_a_data_hbm_1, idx_data_hbm = [], [], []
        for lb in self.lb_idx_list:
            mat_a_0_fpath = base_path + f"/onchip_mat_a_hbm0_h{hidx}_lb{lb}.mem"
            with open(mat_a_0_fpath, "r") as fp:
                mat_a_data_hbm_0 += [l.strip() for l in fp.readlines()]

            mat_a_1_fpath = base_path + f"/onchip_mat_a_hbm1_h{hidx}_lb{lb}.mem"
            with open(mat_a_1_fpath, "r") as fp:
                mat_a_data_hbm_1 += [l.strip() for l in fp.readlines()]

            idx_fpath = base_path + f"/onchip_idx_hbm_h{hidx}_lb{lb}.mem"
            with open(idx_fpath, "r") as fp:
                idx_data_hbm += [l.strip() for l in fp.readlines()]

        self.mat_a_data_hbm_0 = mat_a_data_hbm_0
        self.mat_a_data_hbm_1 = mat_a_data_hbm_1
        self.idx_data_hbm = idx_data_hbm

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
            await hins.init_hbm_chan()

        for houts in self.hbm_out_chans:
            await houts.init_hbm_chan()

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
        await Combine(
            RisingEdge(self.dut.start_tcarray_in_1),
            RisingEdge(self.dut.start_tcarray_in_2)
        )
        await Combine(
            FallingEdge(self.dut.start_tcarray_in_1),
            FallingEdge(self.dut.start_tcarray_in_2)
        )

        await Timer(1, "ns")
        self.dut.almost_empty_tcarray_in_1.value = 1
        self.dut.almost_empty_tcarray_in_2.value = 1
        await clkCycles(self.dut.clk, 120)
        self.dut.almost_empty_tcarray_in_1.value = 0
        self.dut.almost_empty_tcarray_in_2.value = 0

        for col_ptr in range(sum(self.mat_a_bounds)):
            await Timer(1, "ns")
            self.dut.data_tcarray_in_1.value = \
                BinaryValue(hex_to_bin(self.mat_a_data_hbm_0[col_ptr], 256), n_bits=256)
            self.dut.data_tcarray_in_2.value = \
                BinaryValue(hex_to_bin(self.mat_a_data_hbm_1[col_ptr], 256), n_bits=256)
            
            await Equal([self.dut.select_tcarray_in_1, self.dut.select_tcarray_in_2], [1, 1])
            await clkCycles(self.dut.clk, 1)

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

    async def wait_compute_finish(self):
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
        

@cocotb.test()
async def tensor_core_array_wrapper_test(dut):
    """Try accessing the design."""

    base_path = "/compas-old/projects/sparse-attention/onchip/chatglm2-6b-32k-attn-bfp20-lcc/i5hWEFEnp"
    hidx = 828
    
    main_clk_period = 10
    main_clk = Clock(dut.clk, main_clk_period, units="ns")
    dut_tester = tensor_core_array_wrapper_dut(dut, 3, 2)
    dut_tester.init_test_stimulus(base_path, hidx)
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
    # TBD

    # start issuing jobs
    await dut_tester.submit_jobs()

    # start loading processes
    await cocotb.start(dut_tester.load_idx_process())
    await cocotb.start(dut_tester.load_mat_a_process())

    # start calculation
    cocotb.start_soon(dut_tester.start_cal())
    await dut_tester.wait_compute_finish()


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
