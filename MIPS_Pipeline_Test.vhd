-- testbench MIPS

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity MIPS_Pipeline_test is
end entity;

architecture MIPS_Pipeline_testOp of MIPS_Pipeline_test is

	component mipsPipe_line
		port(
			clk : in STD_LOGIC);
	end component;

	signal ck : STD_LOGIC;
	
	begin
	
		test1 : mipsPipe_line port map(ck);
		process
			begin
				ck <= '1' after 50 ns, '0' after 100 ns;
		end process;
		
end MIPS_Pipeline_testOp;
