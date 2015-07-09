library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity stageEX_testbench is

end stageEX_testbench;

architecture estrutural of stageEX_testbench is

	component stageEX
	port(		RegWriteE		:inout std_logic;
				MemtoRegE		:inout std_logic;
				MemWriteE		:inout std_logic;
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
				ALUOutOvfl		:out std_logic; 
				ALUOutZero		:out std_logic;
				RegWriteE_S		:out std_logic;
				MemtoRegE_S		:out std_logic;
				MemWriteE_S		:out std_logic);
	end component;
	
	signal tb_RegWriteE		: std_logic;
	signal tb_MemtoRegE		: std_logic;
	signal tb_MemWriteE		: std_logic;
	signal tb_ALUControlE	: std_logic_vector(3 downto 0); 
	signal tb_ALUSrcE			: std_logic; 
	signal tb_RegDstE			: std_logic;
	signal tb_RD1_E			: std_logic_vector(31 downto 0);
	signal tb_RD2_E			: std_logic_vector(31 downto 0);
	signal tb_RtE				: std_logic_vector(4 downto 0);
	signal tb_RdE				: std_logic_vector(4 downto 0);
	signal tb_SignImmE		: std_logic_vector(31 downto 0);
	signal tb_ResultW			: std_logic_vector(31 downto 0);
	signal tb_ALUOutM			: std_logic_vector(31 downto 0);
	signal tb_ForwardAE		: std_logic_vector(1 downto 0);
	signal tb_ForwardBE		: std_logic_vector(1 downto 0);
	signal tb_ALUOutE			: std_logic_vector(31 downto 0);
	signal tb_WriteDataE		: std_logic_vector(31 downto 0);
	signal tb_WriteRegE		: std_logic_vector(4 downto 0);
	signal tb_ALUOutOvfl		: std_logic; 
	signal tb_ALUOutZero		: std_logic;
	signal tb_RegWriteE_S	: std_logic;
	signal tb_MemtoRegE_S	: std_logic;
	signal tb_MemWriteE_S	: std_logic;
	begin
	
	map_testStageEX:stageEX port map(tb_RegWriteE,tb_MemtoRegE,tb_MemWriteE,tb_ALUControlE,tb_ALUSrcE,tb_RegDstE,
	tb_RD1_E,tb_RD2_E,tb_RtE,tb_RdE,tb_SignImmE,tb_ResultW,tb_ALUOutM,tb_ForwardAE,tb_ForwardBE,tb_ALUOutE,tb_WriteDataE,
	tb_WriteRegE,tb_ALUOutOvfl,tb_ALUOutZero,tb_RegWriteE_S,tb_MemtoRegE_S,tb_MemWriteE_S);
	
	process 
	begin
		
		tb_RegWriteE <= '0';
		tb_MemtoRegE <= '0';
		tb_MemWriteE <= '0';
		tb_ALUControlE <= "0000";
		tb_ALUSrcE <= '0';
		tb_RegDstE <= '0';
		tb_RD1_E <= X"0000000F";
		tb_RD2_E <= X"000000FF";
		tb_RtE <= "00000";
		tb_RdE <= "00000";
		tb_SignImmE <= X"00000001";
		tb_ResultW <= X"00000002";
		tb_ALUOutM <= X"00000004";
		tb_ForwardAE <= "00";
		tb_ForwardBE <= "00";
		wait for 10ns;
		
	end process;
end estrutural;
		
		