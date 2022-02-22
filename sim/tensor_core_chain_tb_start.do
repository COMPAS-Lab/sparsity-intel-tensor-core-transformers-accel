set QSYS_SIMDIR .
source $QSYS_SIMDIR/mentor/msim_setup.tcl

dev_com
com
vlog ./tb/TensorCoreChainTb.sv ../src/generated/TensorCoreChain.v
set TOP_LEVEL_NAME TensorCoreChainTb

#vlib work
#vmap work work

#vcom is used for compile VHDL files


# vlog is used for compile Verilog files
vlog -reportprogress 300 -work work ./tb/fourteennm_atoms.sv


elab_debug

view signals
view structure
view wave

do tcchain_tb_add_wave.do

log -r *






