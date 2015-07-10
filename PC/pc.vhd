library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity pc is
	port(	ent1					:in	std_logic_vector(7 downto 0);
			clk					:in	std_logic;	
			wren					:in	std_logic;
			saida					:out	std_logic_vector(7 downto 0));
end pc;

architecture PC_Op of pc is

	signal reg_interno: std_logic_vector(7 downto 0):= X"00";

	begin

		proc_escrita: process (ent1, clk, wren)
			
			begin				
				if (rising_edge(clk) and wren = '1') then
					reg_interno <= ent1;
					end if;
			end process;
			
		proc_leitura: process (clk, reg_interno, ent1)
			
			begin
				saida <= reg_interno;
			end process;
			
end PC_Op;