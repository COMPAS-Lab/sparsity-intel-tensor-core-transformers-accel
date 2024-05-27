
vlog ./tb/RedundancyRemoverTb.sv ../src/generated/*.v
set TOP_LEVEL_NAME RedundancyRemoverTb

vsim $TOP_LEVEL_NAME

view signals
view structure
view wave

log -r *

do redremover_wave.do
