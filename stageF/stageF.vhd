library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity stageF is
	port (
	
		clk			: in std_logic;
		PCSrcF		: in std_logic_vector(1 downto 0);
		StallF		: in std_logic;
		
		PCJumpF		: in std_logic_vector(31 downto 0);
		PCBranchF	: in std_logic_vector(31 downto 0);
		
		PCPlus4F		: out std_logic_vector(31 downto 0);
		InstrF		: out std_logic_vector(31 downto 0));
		
end stageF;

architecture behavioral of stageF is

	component pc
	port(	
		ent1					:in	std_logic_vector(7 downto 0);
		clk					:in	std_logic;	
		wren					:in	std_logic;
		saida					:out	std_logic_vector(7 downto 0));
	end component pc;
	
	component somador
	port(	
		ent1, ent2			:in	std_logic_vector(31 downto 0);
		saida					:out	std_logic_vector(31 downto 0));
	end component somador;
	
	component textMIPS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock			: IN STD_LOGIC  := '1';
		data			: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren			: IN STD_LOGIC ;
		q				: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
	END component textMIPS;

	
	signal plus4		: std_LOGIC_VECTOR(31 downto 0);
	signal PCPlus4Sig	: std_logic_vector(31 downto 0);
	signal PCsig		: std_LOGIC_VECTOR(7 downto 0);
	signal PCF			: std_LOGIC_VECTOR(7 downto 0);
	signal mem_clock	: std_logic;
	signal mem_data	: std_logic_vector(31 downto 0);
	signal mem_wren	: std_logic;

begin
	
	PCF 		<= X"00";
	plus4 	<= X"00000004";
	mem_wren <= '0';
	mem_clock<= '0';
	
	map_textMIPS: textMIPS 	port map(PCF, mem_clock, mem_data, mem_wren, InstrF);
	map_somador : somador	port map(PCF,plus4,PCPlus4Sig);
	map_pc		: pc			port map(PCsig, clk, not(StallF), PCF);
	
	proc_stageF_PSSRC: process( PCSrcF )
	begin
		case PCSrcF is
				when "00" => PCsig <= PCPlus4Sig(7 downto 0);
				when "01" => PCsig <= PCBranchF(7 downto 0);
				when "10" => PCsig <= PCJumpF(7 downto 0);
				when others => null;
			end case;
	end process proc_stageF_PSSRC;
	
	proc_stageF: process(clk)
	begin
		PCPlus4F <= PCPlus4Sig;
	end process proc_stageF;
	
	
end architecture behavioral;
