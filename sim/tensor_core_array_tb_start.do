set QSYS_SIMDIR .
set FORCE_MODELSIM_AE_SELECTION "true"
source $QSYS_SIMDIR/mentor/msim_setup.tcl

# dev_com
com

vlog ./tb/TensorCoreArrayTb.sv ../src/generated/*.v ../src/main/sverilog/blk_delay_core.sv ../src/main/sverilog/out_asym_fifo.sv
set TOP_LEVEL_NAME TensorCoreArrayTb

#vlib work
#vmap work work

# vlog is used for compile Verilog files
vlog -reportprogress 300 -work work ./tb/fourteennm_atoms.sv


elab_debug

view signals
view structure
view wave

log TensorCoreArrayTb/dut/*
log TensorCoreArrayTb/dut/bufferArea_casLoadBubbleInsert_0/*
log TensorCoreArrayTb/dut/bufferArea_casLoadBubbleInsert_8/*
log -r TensorCoreArrayTb/dut/u_tc_core_r_0_c_0/*
log -r TensorCoreArrayTb/dut/u_tc_core_r_0_c_11/*
log -r TensorCoreArrayTb/dut/u_tc_core_r_5_c_0/*
log TensorCoreArrayTb/dut/asymBufferN2One_48/*
log TensorCoreArrayTb/dut/asymBufferN2One_49/*
log TensorCoreArrayTb/dut/asymBufferN2One_50/*
log TensorCoreArrayTb/dut/asymBufferN2One_51/*
log TensorCoreArrayTb/dut/asymBufferN2One_52/*
log TensorCoreArrayTb/dut/asymBufferN2One_53/*
log TensorCoreArrayTb/dut/asymBufferN2One_54/*
log TensorCoreArrayTb/dut/asymBufferN2One_55/*

do tcarray_tb_add_wave.do

run 55000ns