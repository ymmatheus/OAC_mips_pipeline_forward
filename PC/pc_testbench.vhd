library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity pc_testbench is

end pc_testbench;

architecture estrutural of pc_testbench is

component pc is
	port(	ent1					:in	std_logic_vector(7 downto 0);
			clk					:in	std_logic;	
			wren					:in	std_logic;
			saida					:out	std_logic_vector(7 downto 0));
end component;

	signal ent1					:	std_logic_vector(7 downto 0);
	signal clk					:	std_logic;	
	signal wren					:	std_logic;
	signal saida				:	std_logic_vector(7 downto 0);
	
begin

	ProgC:pc port map (ent1 => ent1, clk => clk, wren => wren, saida => saida);
	clock: process begin
		
		clk <= '0'; wren <= '0'; wait for 5ns;	
		clk <= '1'; wren <= '1'; wait for 5ns;
		
		end process;
	
	drive: process begin
		
		ent1 <= X"05";
		wait for 10ns;
		
		ent1 <= X"04";
		wait for 10ns;
		
		ent1 <= X"03";
		wait for 10ns;
		
		ent1 <= X"02";
		wait for 10ns;
		
		ent1 <= X"01";
		wait for 10ns;
		
		
	end process;
end estrutural;
		