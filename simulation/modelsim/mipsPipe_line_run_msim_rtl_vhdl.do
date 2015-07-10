transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/controleMIPS/controleMIPS.vhd}

vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/mipsPipe_line.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  mipsPipe_line

add wave *
view structure
view signals
run -all
