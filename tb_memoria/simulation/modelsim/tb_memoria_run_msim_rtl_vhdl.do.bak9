transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/ProjetoFinalDisciplina/dataMIPS.vhd}

vcom -93 -work work {E:/ProjetoFinalDisciplina/tb_memoria/tb_memoria.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  tb_memoria

add wave *
view structure
view signals
run -all
