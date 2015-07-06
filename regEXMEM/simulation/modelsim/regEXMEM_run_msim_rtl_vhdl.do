transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/Projeto Final Disciplina/regEXMEM/regEXMEM.vhd}

vcom -93 -work work {E:/Projeto Final Disciplina/regEXMEM/tb_regEXMEM.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  tb_regEXMEM

add wave *
view structure
view signals
run -all
