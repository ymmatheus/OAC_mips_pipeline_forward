library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_regMEMWB is

end tb_regMEMWB;


architecture TB of tb_regMEMWB is
		
	signal tb_clk, tb_wren	: std_logic;
			
	signal tb_regWriteM	: std_logic;
	signal tb_memtoregM	: std_logic;
	signal tb_ReadDataM 	: std_logic_vector(31 downto 0);
	signal tb_ALUoutM		: std_logic_vector(31 downto 0);
	signal tb_WriteRegM	: std_logic_vector(4 downto 0);	
	
	signal tb_regWriteW	: std_logic;
	signal tb_memtoregW	: std_logic;
	signal tb_ReadDataW	: std_logic_vector(31 downto 0);
	signal tb_ALUoutW		: std_logic_vector(31 downto 0);
	signal tb_WriteRegW	: std_logic_vector(4 downto 0);

	component regMEMWB
	port (
		clk, wren	: in std_logic;

		regWriteM	: in std_logic;
		memtoregM	: in std_logic;
		ReadDataM 	: in std_logic_vector(31 downto 0);
		ALUoutM		: in std_logic_vector(31 downto 0);
		WriteRegM	: in std_logic_vector(4 downto 0);		
			
		regWriteW	: out std_logic;
		memtoregW	: out std_logic;
		ReadDataW	: out std_logic_vector(31 downto 0);
		ALUoutW		: out std_logic_vector(31 downto 0);
		WriteRegW	: out std_logic_vector(4 downto 0));

	end component;
	
begin

	map_regMEMWB: regMEMWB port map(tb_clk, tb_wren,tb_regWriteM,tb_memtoregM,tb_ReadDataM,
											  tb_ALUoutM,tb_WriteRegM,tb_regWriteW,tb_memtoregW,tb_ReadDataW,
											  tb_ALUoutW,tb_WriteRegW);
	process
	begin
		tb_clk <= '0';
		tb_ALUoutM <= X"01020304";
		wait for 10 ns;
		
		tb_clk <= '1';
		wait for 10 ns;
		
		tb_clk <= '0';
		wait for 10 ns;
		
		tb_clk <= '1';
		wait for 10 ns;
		
		tb_clk <= '0';
		wait for 10 ns;
		
		tb_wren <= '1';
		tb_clk <= '1';
		wait for 10 ns;
		
		tb_clk <= '0';
		tb_ALUoutM <= X"f1f2f3f4";
		wait for 10 ns;
		
		
		tb_clk <= '1';
		tb_wren <= '1';
		wait for 10 ns;
	
	end process;


end TB;

