library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity regMEMWB is

	port (
		clk,wren	: in std_logic;
				
		regWriteM	: in std_logic;
		memtoregM	: in std_logic;
		ReadDataM	: in std_logic_vector(31 downto 0);
		ALUoutM		: in std_logic_vector(31 downto 0);
		WriteRegM	: in std_logic_vector(4 downto 0);

		regWriteW	: out std_logic;
		memtoregW	: out std_logic;
		ReadDataW	: out std_logic_vector(31 downto 0);
		ALUoutW		: out std_logic_vector(31 downto 0);
		WriteRegW	: out std_logic_vector(4 downto 0));
		
end regMEMWB;

architecture behavioral of regMEMWB is

	signal regWrite	: std_logic;
	signal memtoreg	: std_logic;
	signal ReadData	: std_logic_vector(31 downto 0);
	signal ALUout		: std_logic_vector(31 downto 0);
	signal WriteReg	: std_logic_vector(4 downto 0);

begin


	proc_MEMWB_read: process(clk)
	begin

		regWriteW	<= regWrite;
		memtoregW	<= memtoreg;
		ReadDataW	<= ReadData;
		ALUoutW		<= ALUout;
		WriteRegW	<= WriteReg;
		
	end process proc_MEMWB_read;
	
	proc_MEMWB_write: process(wren,clk) 
	begin
		if (rising_edge(clk)) then
			if (wren = '1') then
				regWrite	<= regWriteM;
				memtoreg	<= memtoregM;
				ReadData	<= ReadDataM;
				ALUout	<= ALUoutM;
				WriteReg	<= WriteRegM;
			end if;
		end if;
	end process proc_MEMWB_write;
	
	
end architecture behavioral;







