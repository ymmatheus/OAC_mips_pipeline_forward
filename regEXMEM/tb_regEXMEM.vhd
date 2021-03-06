library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_regEXMEM is

end tb_regEXMEM;


architecture TB of tb_regEXMEM is
		
	signal tb_clk, tb_wren	: std_logic;
			
	signal tb_regWriteE	: std_logic;
	signal tb_memtoregE	: std_logic;
	signal tb_memWriteE 	: std_logic;
	signal tb_ALUoutE		: std_logic_vector(31 downto 0);
	signal tb_WriteDataE	: std_logic_vector(31 downto 0);
	signal tb_WriteRegE	: std_logic_vector(4 downto 0);

	signal tb_regWriteM	: std_logic;
	signal tb_memtoregM	: std_logic;
	signal tb_memWriteM 	: std_logic;
	signal tb_ALUoutM		: std_logic_vector(31 downto 0);
	signal tb_WriteDataM	: std_logic_vector(31 downto 0);
	signal tb_WriteRegM	: std_logic_vector(4 downto 0);	

	component regEXMEM
	port (
		clk,wren	: in std_logic;
		regWriteE	: in std_logic;
		memtoregE	: in std_logic;
		memWriteE 	: in std_logic;
		ALUoutE		: in std_logic_vector(31 downto 0);
		WriteDataE	: in std_logic_vector(31 downto 0);
		WriteRegE	: in std_logic_vector(4 downto 0);
		regWriteM	: out std_logic;
		memtoregM	: out std_logic;
		memWriteM 	: out std_logic;
		ALUoutM		: out std_logic_vector(31 downto 0);
		WriteDataM	: out std_logic_vector(31 downto 0);
		WriteRegM	: out std_logic_vector(4 downto 0));	
	
	end component;
	
begin

	map_regEXMEM: regEXMEM port map(tb_clk, tb_wren,tb_regWriteE,tb_memtoregE,tb_memWriteE,
											tb_ALUoutE,tb_WriteDataE,tb_WriteRegE,tb_regWriteM,tb_memtoregM,
											tb_memWriteM,tb_ALUoutM,tb_WriteDataM,tb_WriteRegM);
	process
	begin
		tb_clk <= '0';
		wait for 10 ns;
		
		tb_clk <= '1';
		tb_regWriteE <= '1';
		tb_ALUoutE <= X"01020304";
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
		tb_regWriteE <= '1';
		tb_ALUoutE <= X"f1f2f3f4";
		wait for 10 ns;
		
		
		tb_clk <= '1';
		tb_wren <= '1';
		wait for 10 ns;
	
	end process;


end TB;

