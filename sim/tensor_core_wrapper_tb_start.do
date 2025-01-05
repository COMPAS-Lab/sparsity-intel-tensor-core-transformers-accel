set FORCE_MODELSIM_AE_SELECTION "true"
set QSYS_SIMDIR .
source $QSYS_SIMDIR/mentor/msim_setup.tcl

com
vlog ./tb/TensorCoreWrapperTb.sv ../src/generated/*.v ../src/main/sverilog/blk_delay_core.sv ../src/main/sverilog/out_asym_fifo.sv
set TOP_LEVEL_NAME TensorCoreWrapperTb

#vlib work
#vmap work work

#vcom is used for compile VHDL files


# vlog is used for compile Verilog files
vlog -reportprogress 300 -work work ./tb/fourteennm_atoms.sv


elab_debug

view signals
view structure
view wave

log TensorCoreWrapperTb/dut/*
log TensorCoreWrapperTb/dut/softClrnArea_tcArray/*
log TensorCoreWrapperTb/dut/softClrnArea_tcArray/u_tc_core_r_0_c_0/*
log TensorCoreWrapperTb/dut/softClrnArea_tcArray/outBuffer_0/*
log TensorCoreWrapperTb/dut/softClrnArea_tcArray/outBuffer_1/*

do tcwrapper_tb_add_wave.do

run 160us