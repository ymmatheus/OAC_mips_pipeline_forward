library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity somador is
	port(	ent1, ent2			:in	std_logic_vector(31 downto 0);
			saida					:out	std_logic_vector(31 downto 0));
end somador;

architecture Somador of somador is

begin
	soma: process (ent1, ent2)
	begin
	saida <= ent1 + ent2;
	
	end process;
end Somador;