library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity regEXWB is
	port (
	
		clk,clr,en	: in std_logic;
				
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
		WriteRegM	: out std_logic_vector(4 downto 0);	
	
	);
end regEXWB;

architecture behavioral of regEXWB is
	
begin
	
	proc_EXMEM_read: process(clk)
	begin
		
	end process proc_EXMEM_read;
	
	proc_EXMEM_write: process(wren) 
	begin
		
	end process proc_EXMEM_write;
	
	
end architecture behavioral;







