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
	end component;
	
	component textMIPS
		PORT(
			address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clock			: IN STD_LOGIC  := '1';
			data			: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			wren			: IN STD_LOGIC ;
			q				: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
		END component;

	
	signal plus4		: std_LOGIC_VECTOR(31 downto 0);
	signal PCPlus4Sig	: std_logic_vector(31 downto 0);
	signal PCsig		: std_LOGIC_VECTOR(7 downto 0);
	signal PCF			: std_logic_vector(7 downto 0);
	signal mem_data	: std_logic_vector(31 downto 0);
	signal mem_wren	: std_logic;
	signal notclk		: std_logic;
	signal notStallF	: std_logic;

	begin
	
	plus4 	<= X"00000001";
	mem_wren <= '0';
	notclk   <= not(clk);
	notStallF<= not(StallF);
	
	map_textMIPS: textMIPS 	port map(PCF, notclk, mem_data, mem_wren, InstrF);
	map_pc		: pc		   port map(PCsig, notclk, notStallF, PCF);
	
	proc_stageF: process( clk )
	begin
	
		if (rising_edge(clk)) 
			then
				PCPlus4F 	<= X"000000"&PCF + plus4;
				PCPlus4Sig	<= X"000000"&PCF + plus4;	
			
				case PCSrcF is
					when "00" => PCsig <= PCPlus4Sig(7 downto 0);
					when "01" => PCsig <= PCBranchF(7 downto 0);
					when "10" => PCsig <= PCJumpF(7 downto 0);
					when others => null;
				end case;
		end if;	
	end process proc_stageF;
	
	
end architecture behavioral;
