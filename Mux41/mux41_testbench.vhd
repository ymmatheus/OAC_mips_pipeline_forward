library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity mux41_testbench is

end mux41_testbench;

architecture estrutural of mux41_testbench is

component mux41 is
	port (
		sel			: in  std_logic_vector(1 downto 0);
		A,B,C			: in  std_logic_vector(31 downto 0);
		S				: out std_logic_vector(31 downto 0));
end component;

	signal sel			: std_logic_vector(1 downto 0);
	signal A				: std_logic_vector(31 downto 0);
	signal B				: std_logic_vector(31 downto 0);
	signal C				: std_logic_vector(31 downto 0);
	signal S				: std_logic_vector(31 downto 0);
	
begin

	Mux_41:mux41 port map (sel => sel, A => A, B => B, C => C, S => S);
	
	drive: process begin
		A <= X"00000001";
		B <= X"00000002";
		C <= X"00000003";
		sel <= "00";
		wait for 5ns;
		
		sel <= "01";
		wait for 5ns;
		
		sel <= "10";
		wait for 5ns;
		
	end process;
end estrutural;
		