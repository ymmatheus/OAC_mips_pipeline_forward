library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity stageEX is
	port (	RegWriteE		:in std_logic;
				MemtoRegE		:in std_logic;
				MemWriteE		:in std_logic;
				ALUControlE		:in std_logic_vector(3 downto 0); 
				ALUSrcE			:in std_logic; 
				RegDstE			:in std_logic;
				RD1_E				:in std_logic_vector(31 downto 0);
				RD2_E				:in std_logic_vector(31 downto 0);
				RtE				:in std_logic_vector(4 downto 0);
				RdE				:in std_logic_vector(4 downto 0);
				SignImmE			:in std_logic_vector(31 downto 0);
				ResultW			:in std_logic_vector(31 downto 0);
				ALUOutM			:in std_logic_vector(31 downto 0);
				ForwardAE		:in std_logic_vector(1 downto 0);
				ForwardBE		:in std_logic_vector(1 downto 0);
				ALUOutE			:out std_logic_vector(31 downto 0);
				WriteDataE		:out std_logic_vector(31 downto 0);
				WriteRegE		:out std_logic_vector(4 downto 0);
				ALUOutOvfl		:out std_logic; 	-- Usaremos?
				ALUOutZero		:out std_logic; 	-- Usaremos?
				RegWriteE_S		:out std_logic;
				MemtoRegE_S		:out std_logic;
				MemWriteE_S		:out std_logic);
end stageEX;

architecture behavioral of stageEX is
	signal SrcAE 		: std_logic_vector(31 downto 0):= X"00000000"; 
	signal SrcBE		: std_logic_vector(31 downto 0):= X"00000000";
	signal SaidaMux2	: std_logic_vector(31 downto 0):= X"00000000";
	
	component Mux41_MIPS
	port(
		sel			: in  std_logic_vector(1 downto 0);
		A,B,C			: in  std_logic_vector(31 downto 0);
		S				: out std_logic_vector(31 downto 0));
	end component;
	
	component mux21MIPS
	port(
		sel			: in  std_logic;
		A,B			: in  std_logic_vector(31 downto 0);
		S				: out std_logic_vector(31 downto 0));
	end component;
	
	component ulaMIPS
	port (
		opULA			: in  std_logic_vector(3 downto 0);
		A,B			: in  std_logic_vector(31 downto 0);
		S				: out std_logic_vector(31 downto 0);
		zero, ovfl	: out std_logic);
	end component;
	
	component mux21
	port (
		sel			: in  std_logic;
		A,B			: in  std_logic_vector(4 downto 0);
		S				: out std_logic_vector(4 downto 0));
	end component;	
begin
		map_mux21_1:mux21 		  port map(RegDstE,RtE,RdE,WriteRegE);
		map_Mux41_1:Mux41_MIPS 		  port map(ForwardAE,RD1_E,ResultW,ALUOutM,SrcAE);
		map_Mux41_2:Mux41_MIPS 		  port map(ForwardBE,RD2_E,ResultW,AluOutM,saidaMux2);
		map_mux21MIPS_2:mux21MIPS port map(ALUSrcE,saidaMux2,SignImmE,SrcBE);
		map_ulaMIPS:ulaMIPS		  port map(ALUControlE,SrcAE,SrcBE,ALUOutE,ALUOutZero,ALUOutOvfl);
		
		WriteDataE <= SaidaMux2;
		RegWriteE_S <= RegWriteE;
		MemtoRegE_S <= MemtoRegE;
		MemWriteE_S <= MemWriteE;
end architecture behavioral;