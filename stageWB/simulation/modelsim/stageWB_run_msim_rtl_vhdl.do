transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/Projeto Final Disciplina/mux21MIPS.vhd}
vcom -93 -work work {E:/Projeto Final Disciplina/stageWB/stageWB.vhd}

vcom -93 -work work {E:/Projeto Final Disciplina/stageWB/tb_stageWB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  tb_stageWB

add wave *
view structure
view signals
run -all
