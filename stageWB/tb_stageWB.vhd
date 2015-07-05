library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_stageWB is
end tb_stageWB;


architecture TB of tb_stageWB is
		
	signal tb_memtoregW		: std_logic;
	signal tb_ALUoutW			: std_logic_vector(31 downto 0);
	signal tb_ReadDataW		: std_logic_vector(31 downto 0);
		
	signal tb_ResultW 		: std_logic_vector(31 downto 0);
			
	
	component stageWB
	port (
		memtoregW	: in std_logic;
		ALUoutW		: in std_logic_vector(31 downto 0);
		ReadDataW	: in std_logic_vector(31 downto 0);
		
		ResultW		: out std_logic_vector(31 downto 0));
	end component;
	
begin

	map_stageWB: stageWB port map(tb_memtoregW, tb_ALUoutW, tb_ReadDataW, tb_ResultW);

	process
	begin
	
		tb_memtoregW 	<= '0';
		tb_ALUoutW		<= X"01020304";
		tb_ReadDataW		<= X"f1f2f3f4";
		
		wait for 10 ns;
		
		tb_memtoregW 	<= '1';
		tb_ALUoutW		<= X"01020304";
		tb_ReadDataW		<= X"f1f2f3f4";
		
		wait for 10 ns;
		
		tb_memtoregW 	<= '0';
		tb_ALUoutW		<= X"ff0203ff";
		tb_ReadDataW		<= X"f10000f4";
		
		wait for 10 ns;
		
		tb_memtoregW 	<= '1';
		tb_ALUoutW		<= X"ff0203ff";
		tb_ReadDataW		<= X"f10000f4";
		
		
		
	
	end process;


end TB;

