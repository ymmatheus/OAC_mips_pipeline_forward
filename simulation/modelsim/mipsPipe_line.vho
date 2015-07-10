-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "07/10/2015 18:40:32"

-- 
-- Device: Altera EP2C70F896C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	controleMIPS IS
    PORT (
	Op : IN std_logic_vector(5 DOWNTO 0);
	Funct : IN std_logic_vector(5 DOWNTO 0);
	equalD : IN std_logic;
	RegWriteD : OUT std_logic;
	MemtoRegD : OUT std_logic;
	MemWriteD : OUT std_logic;
	ALUControlD : OUT std_logic_vector(3 DOWNTO 0);
	ALUsrcD : OUT std_logic;
	RegDstD : OUT std_logic;
	BranchD : OUT std_logic;
	BranchClear : OUT std_logic;
	JumpD : OUT std_logic;
	PCsrcD : OUT std_logic_vector(1 DOWNTO 0)
	);
END controleMIPS;

-- Design Ports Information
-- RegWriteD	=>  Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- MemtoRegD	=>  Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- MemWriteD	=>  Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ALUControlD[0]	=>  Location: PIN_E13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ALUControlD[1]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ALUControlD[2]	=>  Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ALUControlD[3]	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ALUsrcD	=>  Location: PIN_H14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- RegDstD	=>  Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- BranchD	=>  Location: PIN_AE15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- BranchClear	=>  Location: PIN_AF15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- JumpD	=>  Location: PIN_AH20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- PCsrcD[0]	=>  Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- PCsrcD[1]	=>  Location: PIN_AJ5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- equalD	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Op[2]	=>  Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Op[0]	=>  Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Op[1]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Op[4]	=>  Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Op[5]	=>  Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Op[3]	=>  Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Funct[4]	=>  Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Funct[2]	=>  Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Funct[5]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Funct[3]	=>  Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Funct[0]	=>  Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Funct[1]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF controleMIPS IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Op : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_Funct : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_equalD : std_logic;
SIGNAL ww_RegWriteD : std_logic;
SIGNAL ww_MemtoRegD : std_logic;
SIGNAL ww_MemWriteD : std_logic;
SIGNAL ww_ALUControlD : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_ALUsrcD : std_logic;
SIGNAL ww_RegDstD : std_logic;
SIGNAL ww_BranchD : std_logic;
SIGNAL ww_BranchClear : std_logic;
SIGNAL ww_JumpD : std_logic;
SIGNAL ww_PCsrcD : std_logic_vector(1 DOWNTO 0);
SIGNAL \Mux5~7clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Mux11~2clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Mux5~4_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Mux11~1_combout\ : std_logic;
SIGNAL \Mux11~2_combout\ : std_logic;
SIGNAL \Mux11~2clkctrl_outclk\ : std_logic;
SIGNAL \RegWriteD$latch~combout\ : std_logic;
SIGNAL \Mux11~3_combout\ : std_logic;
SIGNAL \MemtoRegD$latch~combout\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Mux0~3_combout\ : std_logic;
SIGNAL \Mux5~2_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \Mux5~5_combout\ : std_logic;
SIGNAL \Mux5~3_combout\ : std_logic;
SIGNAL \Mux5~6_combout\ : std_logic;
SIGNAL \Mux5~7_combout\ : std_logic;
SIGNAL \Mux5~7clkctrl_outclk\ : std_logic;
SIGNAL \ALUControlD[0]$latch~combout\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \ALUControlD[1]$latch~combout\ : std_logic;
SIGNAL \ALUControlD[2]~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \ALUControlD[2]$latch~combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \ALUControlD[3]$latch~combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \ALUsrcD$latch~combout\ : std_logic;
SIGNAL \RegDstD$latch~combout\ : std_logic;
SIGNAL \BranchEQDsig~combout\ : std_logic;
SIGNAL \BranchNEDsig~combout\ : std_logic;
SIGNAL \BranchD~0_combout\ : std_logic;
SIGNAL \equalD~combout\ : std_logic;
SIGNAL \PCsrcD~0_combout\ : std_logic;
SIGNAL \Op~combout\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Funct~combout\ : std_logic_vector(5 DOWNTO 0);

BEGIN

ww_Op <= Op;
ww_Funct <= Funct;
ww_equalD <= equalD;
RegWriteD <= ww_RegWriteD;
MemtoRegD <= ww_MemtoRegD;
MemWriteD <= ww_MemWriteD;
ALUControlD <= ww_ALUControlD;
ALUsrcD <= ww_ALUsrcD;
RegDstD <= ww_RegDstD;
BranchD <= ww_BranchD;
BranchClear <= ww_BranchClear;
JumpD <= ww_JumpD;
PCsrcD <= ww_PCsrcD;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Mux5~7clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \Mux5~7_combout\);

\Mux11~2clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \Mux11~2_combout\);

-- Location: LCCOMB_X42_Y50_N6
\Mux5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~4_combout\ = (!\Funct~combout\(2) & ((\Funct~combout\(0) & (!\Funct~combout\(5) & !\Funct~combout\(3))) # (!\Funct~combout\(0) & (\Funct~combout\(5) & \Funct~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct~combout\(0),
	datab => \Funct~combout\(5),
	datac => \Funct~combout\(2),
	datad => \Funct~combout\(3),
	combout => \Mux5~4_combout\);

-- Location: LCCOMB_X42_Y50_N0
\Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (!\Funct~combout\(2) & ((\Funct~combout\(1) & ((\Funct~combout\(5)) # (!\Funct~combout\(3)))) # (!\Funct~combout\(1) & (\Funct~combout\(5) & !\Funct~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct~combout\(1),
	datab => \Funct~combout\(5),
	datac => \Funct~combout\(2),
	datad => \Funct~combout\(3),
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X42_Y50_N16
\Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = (!\Funct~combout\(4) & ((\Funct~combout\(0) & ((\Mux1~0_combout\))) # (!\Funct~combout\(0) & (\Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct~combout\(0),
	datab => \Mux3~0_combout\,
	datac => \Funct~combout\(4),
	datad => \Mux1~0_combout\,
	combout => \Mux3~1_combout\);

-- Location: LCCOMB_X43_Y50_N26
\Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (!\Op~combout\(1) & (\Op~combout\(0) & \Op~combout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(1),
	datac => \Op~combout\(0),
	datad => \Op~combout\(2),
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X43_Y50_N8
\Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (!\Op~combout\(1) & (!\Op~combout\(0) & \Op~combout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(1),
	datac => \Op~combout\(0),
	datad => \Op~combout\(2),
	combout => \Mux6~0_combout\);

-- Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Op[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Op(5),
	combout => \Op~combout\(5));

-- Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Funct[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Funct(0),
	combout => \Funct~combout\(0));

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Op[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Op(0),
	combout => \Op~combout\(0));

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Op[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Op(2),
	combout => \Op~combout\(2));

-- Location: LCCOMB_X43_Y50_N12
\Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\Op~combout\(2)) # (\Op~combout\(1) $ (\Op~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(1),
	datac => \Op~combout\(0),
	datad => \Op~combout\(2),
	combout => \Mux10~0_combout\);

-- Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Op[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Op(4),
	combout => \Op~combout\(4));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Op[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Op(1),
	combout => \Op~combout\(1));

-- Location: LCCOMB_X43_Y50_N24
\Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (!\Op~combout\(2) & (!\Op~combout\(4) & (\Op~combout\(1) & \Op~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(2),
	datab => \Op~combout\(4),
	datac => \Op~combout\(1),
	datad => \Op~combout\(0),
	combout => \Mux11~0_combout\);

-- Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Op[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Op(3),
	combout => \Op~combout\(3));

-- Location: LCCOMB_X43_Y50_N22
\Mux11~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux11~1_combout\ = (\Op~combout\(2) & ((\Op~combout\(3)) # ((\Op~combout\(1))))) # (!\Op~combout\(2) & ((\Op~combout\(0)) # ((\Op~combout\(3) & \Op~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(2),
	datab => \Op~combout\(3),
	datac => \Op~combout\(1),
	datad => \Op~combout\(0),
	combout => \Mux11~1_combout\);

-- Location: LCCOMB_X43_Y50_N30
\Mux11~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux11~2_combout\ = (\Op~combout\(5) & (((\Mux11~0_combout\)))) # (!\Op~combout\(5) & (!\Op~combout\(4) & ((!\Mux11~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(5),
	datab => \Op~combout\(4),
	datac => \Mux11~0_combout\,
	datad => \Mux11~1_combout\,
	combout => \Mux11~2_combout\);

-- Location: CLKCTRL_G10
\Mux11~2clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Mux11~2clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Mux11~2clkctrl_outclk\);

-- Location: LCCOMB_X43_Y50_N0
\RegWriteD$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegWriteD$latch~combout\ = (GLOBAL(\Mux11~2clkctrl_outclk\) & (!\Mux10~0_combout\)) # (!GLOBAL(\Mux11~2clkctrl_outclk\) & ((\RegWriteD$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux10~0_combout\,
	datab => \RegWriteD$latch~combout\,
	datad => \Mux11~2clkctrl_outclk\,
	combout => \RegWriteD$latch~combout\);

-- Location: LCCOMB_X43_Y50_N10
\Mux11~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux11~3_combout\ = (\Op~combout\(1) & (\Op~combout\(0) & !\Op~combout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(1),
	datac => \Op~combout\(0),
	datad => \Op~combout\(2),
	combout => \Mux11~3_combout\);

-- Location: LCCOMB_X43_Y50_N14
\MemtoRegD$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \MemtoRegD$latch~combout\ = (GLOBAL(\Mux11~2clkctrl_outclk\) & (\Mux11~3_combout\)) # (!GLOBAL(\Mux11~2clkctrl_outclk\) & ((\MemtoRegD$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux11~3_combout\,
	datac => \MemtoRegD$latch~combout\,
	datad => \Mux11~2clkctrl_outclk\,
	combout => \MemtoRegD$latch~combout\);

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Funct[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Funct(5),
	combout => \Funct~combout\(5));

-- Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Funct[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Funct(1),
	combout => \Funct~combout\(1));

-- Location: LCCOMB_X42_Y50_N8
\Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (\Funct~combout\(0)) # ((\Funct~combout\(1)) # (!\Funct~combout\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct~combout\(0),
	datab => \Funct~combout\(5),
	datac => \Funct~combout\(1),
	combout => \Mux0~2_combout\);

-- Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Funct[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Funct(4),
	combout => \Funct~combout\(4));

-- Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Funct[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Funct(2),
	combout => \Funct~combout\(2));

-- Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Funct[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Funct(3),
	combout => \Funct~combout\(3));

-- Location: LCCOMB_X42_Y50_N18
\Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Funct~combout\(2) & (((\Funct~combout\(5) & !\Funct~combout\(3))))) # (!\Funct~combout\(2) & (!\Funct~combout\(0) & (\Funct~combout\(5) $ (!\Funct~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct~combout\(0),
	datab => \Funct~combout\(5),
	datac => \Funct~combout\(2),
	datad => \Funct~combout\(3),
	combout => \Mux0~1_combout\);

-- Location: LCCOMB_X42_Y50_N12
\Mux0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~3_combout\ = (\Mux0~0_combout\ & (\Mux0~2_combout\ & (!\Funct~combout\(4) & \Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => \Mux0~2_combout\,
	datac => \Funct~combout\(4),
	datad => \Mux0~1_combout\,
	combout => \Mux0~3_combout\);

-- Location: LCCOMB_X43_Y50_N2
\Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~2_combout\ = (!\Op~combout\(5) & (!\Op~combout\(3) & (!\Op~combout\(1) & !\Op~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(5),
	datab => \Op~combout\(3),
	datac => \Op~combout\(1),
	datad => \Op~combout\(4),
	combout => \Mux5~2_combout\);

-- Location: LCCOMB_X43_Y50_N18
\Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\Op~combout\(5) & (((\Op~combout\(1) & \Op~combout\(0))))) # (!\Op~combout\(5) & (!\Op~combout\(0) & (\Op~combout\(3) $ (\Op~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(5),
	datab => \Op~combout\(3),
	datac => \Op~combout\(1),
	datad => \Op~combout\(0),
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X43_Y50_N16
\Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = (!\Op~combout\(2) & (!\Op~combout\(4) & \Mux5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(2),
	datab => \Op~combout\(4),
	datad => \Mux5~0_combout\,
	combout => \Mux5~1_combout\);

-- Location: LCCOMB_X42_Y50_N14
\Mux5~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~5_combout\ = (\Funct~combout\(5) & ((\Funct~combout\(2) & ((\Funct~combout\(3)))) # (!\Funct~combout\(2) & (\Funct~combout\(0))))) # (!\Funct~combout\(5) & (((\Funct~combout\(2)) # (\Funct~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct~combout\(0),
	datab => \Funct~combout\(5),
	datac => \Funct~combout\(2),
	datad => \Funct~combout\(3),
	combout => \Mux5~5_combout\);

-- Location: LCCOMB_X42_Y50_N28
\Mux5~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~3_combout\ = (\Funct~combout\(4)) # (\Op~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Funct~combout\(4),
	datad => \Op~combout\(0),
	combout => \Mux5~3_combout\);

-- Location: LCCOMB_X42_Y50_N2
\Mux5~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~6_combout\ = (!\Mux5~3_combout\ & ((\Mux5~4_combout\ & ((\Mux5~5_combout\) # (\Funct~combout\(1)))) # (!\Mux5~4_combout\ & (!\Mux5~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux5~4_combout\,
	datab => \Mux5~5_combout\,
	datac => \Funct~combout\(1),
	datad => \Mux5~3_combout\,
	combout => \Mux5~6_combout\);

-- Location: LCCOMB_X43_Y50_N6
\Mux5~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~7_combout\ = (\Mux5~1_combout\) # ((\Mux5~2_combout\ & ((\Op~combout\(2)) # (\Mux5~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(2),
	datab => \Mux5~2_combout\,
	datac => \Mux5~1_combout\,
	datad => \Mux5~6_combout\,
	combout => \Mux5~7_combout\);

-- Location: CLKCTRL_G9
\Mux5~7clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Mux5~7clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Mux5~7clkctrl_outclk\);

-- Location: LCCOMB_X42_Y50_N24
\ALUControlD[0]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \ALUControlD[0]$latch~combout\ = (GLOBAL(\Mux5~7clkctrl_outclk\) & (\Mux0~3_combout\)) # (!GLOBAL(\Mux5~7clkctrl_outclk\) & ((\ALUControlD[0]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~3_combout\,
	datac => \ALUControlD[0]$latch~combout\,
	datad => \Mux5~7clkctrl_outclk\,
	combout => \ALUControlD[0]$latch~combout\);

-- Location: LCCOMB_X40_Y50_N16
\Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = (\Op~combout\(3) & (((!\Op~combout\(2))))) # (!\Op~combout\(3) & ((\Op~combout\(1) & ((!\Op~combout\(2)))) # (!\Op~combout\(1) & ((\Mux3~1_combout\) # (\Op~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~1_combout\,
	datab => \Op~combout\(3),
	datac => \Op~combout\(1),
	datad => \Op~combout\(2),
	combout => \Mux3~2_combout\);

-- Location: LCCOMB_X40_Y50_N28
\ALUControlD[1]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \ALUControlD[1]$latch~combout\ = (GLOBAL(\Mux5~7clkctrl_outclk\) & (\Mux3~2_combout\)) # (!GLOBAL(\Mux5~7clkctrl_outclk\) & ((\ALUControlD[1]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~2_combout\,
	datab => \ALUControlD[1]$latch~combout\,
	datad => \Mux5~7clkctrl_outclk\,
	combout => \ALUControlD[1]$latch~combout\);

-- Location: LCCOMB_X42_Y50_N30
\ALUControlD[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ALUControlD[2]~0_combout\ = (\Funct~combout\(2) & (((\Funct~combout\(5))))) # (!\Funct~combout\(2) & (!\Funct~combout\(0) & (\Funct~combout\(1) $ (\Funct~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct~combout\(0),
	datab => \Funct~combout\(2),
	datac => \Funct~combout\(1),
	datad => \Funct~combout\(5),
	combout => \ALUControlD[2]~0_combout\);

-- Location: LCCOMB_X43_Y50_N28
\Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (!\Op~combout\(3) & (!\Op~combout\(1) & !\Op~combout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op~combout\(3),
	datac => \Op~combout\(1),
	datad => \Op~combout\(2),
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X42_Y50_N22
\Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\Mux0~0_combout\ & ((\Funct~combout\(3)) # ((\Funct~combout\(4)) # (!\ALUControlD[2]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct~combout\(3),
	datab => \ALUControlD[2]~0_combout\,
	datac => \Funct~combout\(4),
	datad => \Mux0~0_combout\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X42_Y50_N4
\ALUControlD[2]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \ALUControlD[2]$latch~combout\ = (GLOBAL(\Mux5~7clkctrl_outclk\) & (\Mux2~0_combout\)) # (!GLOBAL(\Mux5~7clkctrl_outclk\) & ((\ALUControlD[2]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux2~0_combout\,
	datac => \ALUControlD[2]$latch~combout\,
	datad => \Mux5~7clkctrl_outclk\,
	combout => \ALUControlD[2]$latch~combout\);

-- Location: LCCOMB_X42_Y50_N26
\Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\Funct~combout\(1) & (\Funct~combout\(5) & (\Funct~combout\(2) & !\Funct~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct~combout\(1),
	datab => \Funct~combout\(5),
	datac => \Funct~combout\(2),
	datad => \Funct~combout\(3),
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X42_Y50_N10
\Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = (\Mux0~0_combout\ & (\Mux1~0_combout\ & !\Funct~combout\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => \Mux1~0_combout\,
	datac => \Funct~combout\(4),
	combout => \Mux1~1_combout\);

-- Location: LCCOMB_X42_Y50_N20
\ALUControlD[3]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \ALUControlD[3]$latch~combout\ = (GLOBAL(\Mux5~7clkctrl_outclk\) & (\Mux1~1_combout\)) # (!GLOBAL(\Mux5~7clkctrl_outclk\) & ((\ALUControlD[3]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~1_combout\,
	datac => \ALUControlD[3]$latch~combout\,
	datad => \Mux5~7clkctrl_outclk\,
	combout => \ALUControlD[3]$latch~combout\);

-- Location: LCCOMB_X40_Y50_N18
\Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = \Op~combout\(2) $ (((\Op~combout\(3)) # (\Op~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op~combout\(3),
	datac => \Op~combout\(1),
	datad => \Op~combout\(2),
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X40_Y50_N14
\ALUsrcD$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \ALUsrcD$latch~combout\ = (GLOBAL(\Mux11~2clkctrl_outclk\) & (\Mux7~0_combout\)) # (!GLOBAL(\Mux11~2clkctrl_outclk\) & ((\ALUsrcD$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux7~0_combout\,
	datac => \ALUsrcD$latch~combout\,
	datad => \Mux11~2clkctrl_outclk\,
	combout => \ALUsrcD$latch~combout\);

-- Location: LCCOMB_X41_Y50_N24
\RegDstD$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegDstD$latch~combout\ = (GLOBAL(\Mux11~2clkctrl_outclk\) & (\Mux0~0_combout\)) # (!GLOBAL(\Mux11~2clkctrl_outclk\) & ((\RegDstD$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux0~0_combout\,
	datac => \RegDstD$latch~combout\,
	datad => \Mux11~2clkctrl_outclk\,
	combout => \RegDstD$latch~combout\);

-- Location: LCCOMB_X43_Y50_N20
BranchEQDsig : cycloneii_lcell_comb
-- Equation(s):
-- \BranchEQDsig~combout\ = (GLOBAL(\Mux11~2clkctrl_outclk\) & (\Mux6~0_combout\)) # (!GLOBAL(\Mux11~2clkctrl_outclk\) & ((\BranchEQDsig~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~0_combout\,
	datac => \BranchEQDsig~combout\,
	datad => \Mux11~2clkctrl_outclk\,
	combout => \BranchEQDsig~combout\);

-- Location: LCCOMB_X43_Y50_N4
BranchNEDsig : cycloneii_lcell_comb
-- Equation(s):
-- \BranchNEDsig~combout\ = (GLOBAL(\Mux11~2clkctrl_outclk\) & (\Mux4~0_combout\)) # (!GLOBAL(\Mux11~2clkctrl_outclk\) & ((\BranchNEDsig~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4~0_combout\,
	datac => \BranchNEDsig~combout\,
	datad => \Mux11~2clkctrl_outclk\,
	combout => \BranchNEDsig~combout\);

-- Location: LCCOMB_X44_Y50_N16
\BranchD~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \BranchD~0_combout\ = (\BranchEQDsig~combout\) # (\BranchNEDsig~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchEQDsig~combout\,
	datac => \BranchNEDsig~combout\,
	combout => \BranchD~0_combout\);

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\equalD~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_equalD,
	combout => \equalD~combout\);

-- Location: LCCOMB_X44_Y50_N18
\PCsrcD~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \PCsrcD~0_combout\ = (\equalD~combout\ & (\BranchEQDsig~combout\)) # (!\equalD~combout\ & ((\BranchNEDsig~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchEQDsig~combout\,
	datac => \BranchNEDsig~combout\,
	datad => \equalD~combout\,
	combout => \PCsrcD~0_combout\);

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\RegWriteD~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \RegWriteD$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_RegWriteD);

-- Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\MemtoRegD~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \MemtoRegD$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_MemtoRegD);

-- Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\MemWriteD~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_MemWriteD);

-- Location: PIN_E13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ALUControlD[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALUControlD[0]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ALUControlD(0));

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ALUControlD[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALUControlD[1]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ALUControlD(1));

-- Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ALUControlD[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALUControlD[2]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ALUControlD(2));

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ALUControlD[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALUControlD[3]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ALUControlD(3));

-- Location: PIN_H14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ALUsrcD~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALUsrcD$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ALUsrcD);

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\RegDstD~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \RegDstD$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_RegDstD);

-- Location: PIN_AE15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\BranchD~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \BranchD~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_BranchD);

-- Location: PIN_AF15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\BranchClear~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \BranchD~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_BranchClear);

-- Location: PIN_AH20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\JumpD~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_JumpD);

-- Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\PCsrcD[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PCsrcD~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_PCsrcD(0));

-- Location: PIN_AJ5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\PCsrcD[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_PCsrcD(1));
END structure;


