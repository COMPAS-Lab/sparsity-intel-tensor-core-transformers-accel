set FORCE_MODELSIM_AE_SELECTION "true"
set QSYS_SIMDIR .
source $QSYS_SIMDIR/mentor/msim_setup.tcl

com
vlog ./tb/TensorCoreWrapperTb.sv ../src/generated/*.v ../src/main/sverilog/blk_delay_core.sv ../src/main/sverilog/out_asym_fifo.sv
set TOP_LEVEL_NAME TensorCoreWrapperTb

set ardbound $env(MAT_A_SIZE)
set brdbound $env(MAT_B_SIZE)
set bvecsize $env(MAT_B_VEC_SIZE)
set idxrdbound $env(IDX_LEN)
set head $env(IHEAD)
set lblk $env(ILBLK)
set data_dir $env(TC_DATA_DIR)

#vlib work
#vmap work work

#vcom is used for compile VHDL files


# vlog is used for compile Verilog files
vlog -reportprogress 300 -work work ./tb/fourteennm_atoms.sv

set USER_DEFINED_ELAB_OPTIONS "+ardbound=$ardbound +brdbound=$brdbound +bvecsize=$bvecsize +idxrdbound=$idxrdbound +head=$head +lblk=$lblk +data_dir=$data_dir"

elab_debug

view signals
view structure
view wave

log TensorCoreWrapperTb/dut/*
log TensorCoreWrapperTb/dut/softClrnArea_tcArray/*
log TensorCoreWrapperTb/dut/softClrnArea_tcArray/u_tc_core_r_0_c_0/*
log TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_0/*
log TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_1/*
log TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_2/*
log TensorCoreWrapperTb/dut/softClrnArea_tcArray/outBuffer_0/*
log TensorCoreWrapperTb/dut/softClrnArea_tcArray/outBuffer_1/*

do tcwrapper_tb_add_wave.do

run -all