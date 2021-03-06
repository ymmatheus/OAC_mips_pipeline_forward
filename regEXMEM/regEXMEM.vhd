library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity regEXMEM is
	port (
	
		clk,wren	: in std_logic;
				
		regWriteE	: in std_logic;
		memtoregE	: in std_logic;
		memWriteE 	: in std_logic;
		ALUoutE		: in std_logic_vector(31 downto 0);
		WriteDataE	: in std_logic_vector(31 downto 0);
		WriteRegE	: in std_logic_vector(4 downto 0);
	
		regWriteM	: out std_logic;
		memtoregM	: out std_logic;
		memWriteM 	: out std_logic;
		ALUoutM		: out std_logic_vector(31 downto 0);
		WriteDataM	: out std_logic_vector(31 downto 0);
		WriteRegM	: out std_logic_vector(4 downto 0));
	
	
end regEXMEM;

architecture behavioral of regEXMEM is

	signal regWrite	: std_logic;
	signal memtoreg	: std_logic;
	signal memWrite 	: std_logic;
	signal ALUout		: std_logic_vector(31 downto 0);
	signal WriteData	: std_logic_vector(31 downto 0);
	signal WriteReg	: std_logic_vector(4 downto 0);

begin


	proc_EXMEM_read: process(clk)
	begin

		regWriteM	<= regWrite;
		memtoregM	<= memtoreg;
		memWriteM 	<= memWrite;
		ALUoutM		<= ALUout;
		WriteDataM	<= WriteData;
		WriteRegM	<= writeReg;
		
	end process proc_EXMEM_read;
	
	proc_EXMEM_write: process(wren,clk) 
	begin
		if (rising_edge(clk)) then
			if (wren = '1') then
				regWrite		<= regWriteE;
				memtoreg		<= memtoregE;
				memWrite 	<= memWriteE;
				ALUout		<= ALUoutE;
				WriteData	<= WriteDataE;
				WriteReg		<= writeRegE;
			end if;
		end if;
	end process proc_EXMEM_write;
	
	
end architecture behavioral;







