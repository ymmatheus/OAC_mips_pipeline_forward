library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity somador_testbench is

end somador_testbench;

architecture estrutural of somador_testbench is

component somador is
	port(	ent1, ent2			:in	std_logic_vector(31 downto 0);
			saida					:out	std_logic_vector(31 downto 0));
end component;

	signal ent1 	: std_logic_vector(31 downto 0);
	signal ent2 	: std_logic_vector(31 downto 0);
	signal saida	: std_logic_vector(31 downto 0);
	
begin

	SOMA:somador port map (ent1 => ent1, ent2 => ent2, saida => saida);
	somar: process begin
		ent1 <= X"00000001";
		ent2 <= X"00000004";
		wait for 10ns;
		ent1 <= X"00000003";
		ent2 <= X"00000001";
		wait for 10ns;
		ent1 <= X"000000FF";
		ent2 <= X"00000000";
		wait for 10ns;
		
	end process;
end estrutural;
		