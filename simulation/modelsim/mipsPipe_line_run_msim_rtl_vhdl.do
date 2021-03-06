transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/Hazard/Hazard.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/Mux41/mux41_MIPS.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/textMIPS.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/dataMIPS.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/mipsPipe_line.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/UlaMIPS/ulaMIPS.vhdl}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/stageWB/stageWB.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/stageMEM/stageMEM.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/stageF/stageF.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/stageEX/stageEX.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/stageEX/mux21.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/stageD/stageD.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/regMEMWB/regMEMWB.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/RegIFID/RegIFID.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/RegIDEX/RegIDEX.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/regEXMEM/regEXMEM.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/PC/pc.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/Mux21/mux21MIPS.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/controleMIPS/controleMIPS.vhd}
vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/bregMIPS/bregMIPS.vhdl}

vcom -93 -work work {C:/Users/Douglas/Documents/GitHub/OAC_mips_pipeline_forward/MIPS_Pipeline_Test.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  MIPS_Pipeline_Test

add wave *
view structure
view signals
run -all
