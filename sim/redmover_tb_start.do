
vlog -sv ./tb/redmover_tb.sv ../src/generated/*.v
set TOP_LEVEL_NAME redmover_tb

vsim $TOP_LEVEL_NAME

view signals
view structure
view wave

log -r *
