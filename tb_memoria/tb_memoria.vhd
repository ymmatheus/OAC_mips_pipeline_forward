library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_memoria is
end tb_memoria;


architecture TB of tb_memoria is
	
	signal tb_address	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal tb_clock	: STD_LOGIC  := '1';
	signal tb_data		: STD_LOGIC_VECTOR (31 DOWNTO 0);
	signal tb_wren		: STD_LOGIC ;
	signal tb_q			: STD_LOGIC_VECTOR (31 DOWNTO 0);

	component textMIPS
	port (
		address	: in std_logic_vector(7 downto 0);
		clock 	: in std_logic := '1';
		data		: in std_logic_vector(31 downto 0);
		wren		: in std_logic;
		q			: out std_logic_vector(31 downto 0));
	end component;
	

begin

	map_memoria: textMIPS port map(tb_address, tb_clock, tb_data, tb_wren, tb_q);

	process
	begin
	
		tb_address 	<= X"00";
		tb_clock <= '0';
		wait for 10 ns;

		tb_address 	<= X"00";
		tb_clock <= '1';
		wait for 10 ns;
		

		tb_address 	<= X"01";
		tb_clock <= '0';
		wait for 10 ns;
		

		tb_address 	<= X"01";
		tb_clock <= '1';
		wait for 10 ns;
				
		
	
	end process;


end TB;

