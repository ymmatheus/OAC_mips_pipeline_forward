library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity stageWB is
	port (

		memtoregW	: in std_logic;
		ALUoutW		: in std_logic_vector(31 downto 0);
		ReadDataW	: in std_logic_vector(31 downto 0);
		
		ResultW 		: out std_logic_vector(31 downto 0));
		
end stageWB;

architecture behavioral of stageWB is

	component mux21MIPS
	port(
		sel			: in  std_logic;
		A,B			: in  std_logic_vector(31 downto 0);
		S				: out std_logic_vector(31 downto 0));
	end component;
	

begin

	map_mux21MIPS: mux21MIPS port map(memtoregW, ALUoutW, ReadDataW, ResultW);
	
end architecture behavioral;
