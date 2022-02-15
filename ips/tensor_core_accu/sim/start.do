set QSYS_SIMDIR ./sim
source $QSYS_SIMDIR/mentor/msim_setup.tcl
dev_com
com
vlog ./sim/tensor_core_accu_tb.sv 
set TOP_LEVEL_NAME tensor_core_accu_tb

#vlib work
#vmap work work

#vcom is used for compile VHDL files


# vlog is used for compile Verilog files
vlog -reportprogress 300 -work work ./sim/fourteennm_atoms.sv


elab_debug

view signals
view structure
view wave






