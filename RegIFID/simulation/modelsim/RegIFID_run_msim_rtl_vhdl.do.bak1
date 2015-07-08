transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Mars/Documents/OAC/RegIFID/reg_ifid.vhd}

vcom -93 -work work {C:/Users/Mars/Documents/OAC/RegIFID/RegIFID_testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  RegIFID_testbench

add wave *
view structure
view signals
run -all
