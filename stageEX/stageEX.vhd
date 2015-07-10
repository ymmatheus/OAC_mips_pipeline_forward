library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity stageEX is
	port (	
				ALUControlE		:in std_logic_vector(3 downto 0); 
				ALUSrcE			:in std_logic; 
				RegDstE			:in std_logic;
				
				RD1_E				:in std_logic_vector(31 downto 0);
				RD2_E				:in std_logic_vector(31 downto 0);
				RtE				:in std_logic_vector(4 downto 0);
				RdE				:in std_logic_vector(4 downto 0);
				
				SignImmE			:in std_logic_vector(31 downto 0);
				
				ALUOutE			:out std_logic_vector(31 downto 0);
				WriteDataE		:out std_logic_vector(31 downto 0);
				WriteRegE		:out std_logic_vector(4 downto 0);
				ALUOutZero		:out std_logic;
				ALUOutOvfl		:out std_logic
				
				);
end stageEX;

architecture behavioral of stageEX is

	signal SrcBE		: std_logic_vector(31 downto 0):= X"00000000";
	
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
		map_mux21_1	:	mux21 		port map(RegDstE,RtE,RdE,WriteRegE);
		map_mux21_2	:	mux21MIPS	port map(ALUSrcE,RD2_E,SignImmE,SrcBE);
		map_ulaMIPS	:	ulaMIPS		port map(ALUControlE,RD1_E,SrcBE,ALUOutE,ALUOutZero,ALUOutOvfl);
		
		WriteDataE <= RD2_E;

end architecture behavioral;