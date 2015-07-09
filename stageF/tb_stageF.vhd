library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_stageF is
end tb_stageF;


architecture TB of tb_stageF is
		
		signal tb_clk			: std_logic;
		signal tb_PCSrcF		: std_logic_vector(1 downto 0);
		signal tb_StallF		: std_logic;
		
		signal tb_PCJumpF		: std_logic_vector(31 downto 0);
		signal tb_PCBranchF	: std_logic_vector(31 downto 0);
		
		signal tb_PCPlus4F	: std_logic_vector(31 downto 0);
		signal tb_InstrF		: std_logic_vector(31 downto 0);
		
	component stageF
	port (
	
		clk			: in std_logic;
		PCSrcF		: in std_logic_vector(1 downto 0);
		StallF		: in std_logic;
		
		PCJumpF		: in std_logic_vector(31 downto 0);
		PCBranchF	: in std_logic_vector(31 downto 0);
		
		PCPlus4F		: out std_logic_vector(31 downto 0);
		InstrF		: out std_logic_vector(31 downto 0));
		
	end component;
	
begin

	map_stageF: stageF port map(tb_clk, tb_PCSrcF, tb_StallF, tb_PCJumpF,
												tb_PCBranchF, tb_PCPlus4F, TB_InstrF);
	

	process
	begin
	
	tb_clk <= '0';
	wait for 10 ns;
	
	tb_clk <= '1';
	tb_PCSrcF <= "00";
	tb_StallF <= '0';
	wait for 10 ns;
	
	tb_clk <= '0';
	wait for 10 ns;
	
	tb_clk <= '1';
	tb_PCSrcF <= "00";
	tb_StallF <= '0';
	wait for 10 ns;
	
	tb_clk <= '0';
	wait for 10 ns;
	
	tb_clk <= '1';
	tb_PCSrcF <= "00";
	tb_StallF <= '0';
	wait for 10 ns;

	tb_clk <= '0';
	wait for 10 ns;
	
	tb_clk <= '1';
	tb_PCSrcF <= "00";
	tb_StallF <= '0';
	wait for 10 ns;	
	end process;


end TB;

