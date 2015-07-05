-- OAC Turma C - Trabalho V
-- Matheus Y. Matsumoto
-- 10/0017967
--
-- tb_bregMIPS


library ieee;
use ieee.std_logic_1164.all;

entity tb_mux21MIPS is
end tb_mux21MIPS;

architecture TB of tb_mux21MIPS is

	
	signal	T_sel				: std_logic;
	signal	T_A,T_B			: std_logic_vector(31 downto 0);
	signal	T_S				: std_logic_vector(31 downto 0);
	
	component mux21MIPS
	port(		
		sel		: in std_logic;
		A			: in std_logic_vector(31 downto 0);
		B			: in std_logic_vector(31 downto 0);
		S			: out std_logic_vector(31 downto 0)
	);
	end component;
begin

	map_mux21MIPS: mux21MIPS port map(T_sel, T_A, T_B, T_S);
	process
	begin
	
		T_sel <= '1';
		
		T_A <= X"00000000";
		T_B <= X"00000001";
	
		wait for 10 ns;
		
		T_sel <= '0';
		
		T_A <= X"00000000";
		T_B <= X"00000001";
		wait for 10 ns;
	
		T_sel <= '1';
		
		T_A <= X"00000110";
		T_B <= X"00000011";

		wait for 10 ns;
		
		T_sel <= '0';
		
		T_A <= X"00000110";
		T_B <= X"00000011";

		wait for 10 ns;
	
	end process;
end TB;