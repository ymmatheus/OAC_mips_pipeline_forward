-- MIPS Pipeline

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mipsPipe_line is
end mipsPipe_line;

architecture mipsPipe_line_op of mipsPipe_line is

	-- pc
	component pc is
		port(	ent1					:in	std_logic_vector(7 downto 0);
				clk					:in	std_logic;	
				wren					:in	std_logic;
				saida					:out	std_logic_vector(7 downto 0));
	end component;
	
	-- Registradores
	-- IF/ID
	component RegIFID is
		port(	InstrF					:in	std_logic_vector(31 downto 0);
				PCplus4F					:in	std_logic_vector(31 downto 0);	
				EN							:in	std_logic;
				CLR						:in	std_logic;
				clk						:in	std_logic;
				InstrD					:out	std_logic_vector(31 downto 0);
				PCplus4D					:out	std_logic_vector(31 downto 0));
	end component;
	
	--ID/EX
	component RegIDEX is
		port(	RD1						:in	std_logic_vector(31 downto 0);
				RD2						:in	std_logic_vector(31 downto 0);	
				RegWriteD				:in	std_logic;
				MemtoRegD				:in 	std_logic;
				MemWriteD				:in	std_logic;
				ALUControlD				:in	std_logic_vector(3 downto 0);
				ALUSrcD					:in	std_logic;
				RegDstD					:in	std_logic;
				RsD						:in 	std_logic_vector(4 downto 0);
				RtD						:in	std_logic_vector(4 downto 0);
				RdD						:in	std_logic_vector(4 downto 0);
				SignImmD					:in	std_logic_vector(31 downto 0);
				CLR						:in	std_logic;
				clk						:in	std_logic;
				RegWriteE				:out	std_logic;
				MemtoRegE				:out 	std_logic;
				MemWriteE				:out	std_logic;
				ALUControlE				:out	std_logic_vector(3 downto 0);
				ALUSrcE					:out	std_logic;
				RegDstE					:out	std_logic;
				RsE						:out	std_logic_vector(4 downto 0);
				RtE						:out	std_logic_vector(4 downto 0);
				RdE						:out	std_logic_vector(4 downto 0);
				SignImmE					:out	std_logic_vector(31 downto 0);
				RD1_E						:out 	std_logic_vector(31 downto 0);
				RD2_E						:out	std_logic_vector(31 downto 0));
		end component;
		
	-- EX/MEM
	component regEXMEM is
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
		
	-- MEM/WB
	component regMEMWB is
		port (
			clk,wren	: in std_logic;
					
			regWriteM	: in std_logic;
			memtoregM	: in std_logic;
			ReadDataM	: in std_logic_vector(31 downto 0);
			ALUoutM		: in std_logic_vector(31 downto 0);
			WriteRegM	: in std_logic_vector(4 downto 0);
			regWriteW	: out std_logic;
			memtoregW	: out std_logic;
			ReadDataW	: out std_logic_vector(31 downto 0);
			ALUoutW		: out std_logic_vector(31 downto 0);
			WriteRegW	: out std_logic_vector(4 downto 0));
	end component;
	
	-- Unidade de Comtrole MIPS
	component controleMIPS is
		port (
				Op					: in STD_LOGIC_VECTOR(5 downto 0);
				Funct				: in STD_LOGIC_VECTOR(5 downto 0);
				RegWriteD		: out STD_LOGIC;
				MemtoRegD		: out STD_LOGIC;
				MemWriteD		: out STD_LOGIC;
				ALUControlD		: out STD_LOGIC_VECTOR(3 downto 0);
				ALUsrcD			: out STD_LOGIC;
				RegDstD			: out STD_LOGIC;
				BranchEQD 		: out STD_LOGIC;
				BranchNED 		: out STD_LOGIC;
				JumpD				: out std_logic);
	end component;
	
	-- Banco de Registradores
	component bregMIPS is
		port(
			clk, wreg			: in std_logic;
			add1, add2, wadd	: in std_logic_vector(4 downto 0);
			wdata					: in std_logic_vector(31 downto 0);
			r1,r2					: out std_logic_vector(31 downto 0));
			
	end component;
	
	-- Somador
	component somador is
		port(	ent1, ent2			:in	std_logic_vector(31 downto 0);
				saida					:out	std_logic_vector(31 downto 0));
	end component;

	-- Unidade Lógica Aritmética
	component ulaMIPS is
		port (
			opULA			: in  std_logic_vector(3 downto 0);
			A,B			: in  std_logic_vector(31 downto 0);
			S				: out std_logic_vector(31 downto 0);
			zero, ovfl	: out std_logic);
	end component;
	
	-- MUX 4 para 1 de 32 bits
	component mux41 is
		port (
			sel			: in  std_logic_vector(1 downto 0);
			A,B,C			: in  std_logic_vector(31 downto 0);
			S				: out std_logic_vector(31 downto 0));
	end component;

	-- MUX 2 para 1 de 5 bits
	component mux21 is
		port (
			sel			: in  std_logic;
			A,B			: in  std_logic_vector(4 downto 0);
			S				: out std_logic_vector(4 downto 0));
	end component;

	-- MUX 2 para 1 de 32 bits
	component mux21MIPS is
		port (
			sel			: in  std_logic;
			A,B			: in  std_logic_vector(31 downto 0);
			S				: out std_logic_vector(31 downto 0));
	end component;
	
	-- Memoria de Instruções
	component textMIPS IS
		port (
			address	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		   : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
	end component;

	-- Memoria de Dados 
	component dataMIPS IS
		port (
			address	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
	end component;
	-- Stage Fetch
	component stageF is
		port (
		
			clk			: in std_logic;
			PCSrcF		: in std_logic_vector(1 downto 0);
			StallF		: in std_logic;
			
			PCJumpF		: in std_logic_vector(31 downto 0);
			PCBranchF	: in std_logic_vector(31 downto 0);
			
			PCPlus4F		: out std_logic_vector(31 downto 0);
			InstrF		: out std_logic_vector(31 downto 0));
			
	end component;
	-- Stage Decode
	component stageD is
		port(
			InstD 		: in std_logic_vector(31 downto 0);
			PCPlus4D		: in std_logic_vector(31 downto 0);

			ResultW		: in std_logic_vector(31 downto 0); --wd3
			WriteRegW	: in std_logic_vector(4 downto 0); --a3
			
			AluOutM		: in std_logic_vector(31 downto 0); -- forward

			RD1			: out std_logic_vector(31 downto 0); 
			RD2			: out std_logic_vector(31 downto 0); 
			
			signImmD		: out std_logic_vector(31 downto 0); 
			
			RsD			: out std_logic_vector(4 downto 0); 
			RtD			: out std_logic_vector(4 downto 0); 
			RdD			: out std_logic_vector(4 downto 0); 
			
			equalD		: out std_logic;
		
			PCBranchD	: out std_logic_vector(31 downto 0));
			
	end component;
	
	-- Stage Execute
	component stageEX is
		port (	
			RegWriteE		:in std_logic;
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
	end component;
	
	-- Stage Memory
	component stageMEM is
		port (	
			RegWriteM		:in std_logic;
			MemtoRegM		:in std_logic;
			MemWriteM		:in std_logic;
			clk				:in std_logic;
			ALUOutM			:in std_logic_vector(31 downto 0);
			WriteDataM		:in std_logic_vector(31 downto 0);
			WriteRegM		:in std_logic_vector(4 downto 0);
			ReadDataM		:out std_logic_vector(31 downto 0);
			WriteRegM_S		:out std_logic_vector(4 downto 0);
			RegWriteM_S		:out std_logic;
			MemtoRegM_S		:out std_logic);
	end component;	
	
	-- Stage WriteBack
	component stageWB is
		port (
			memtoregW	: in std_logic;
			ALUoutW		: in std_logic_vector(31 downto 0);
			ReadDataW	: in std_logic_vector(31 downto 0);	
			ResultW 		: out std_logic_vector(31 downto 0));
		
	end component;
	
	-- signals stage IF
	signal clk, StallF : STD_LOGIC;
	signal PCSrcF : STD_LOGIC_VECTOR(1 downto 0);
	signal PCJumpF, PCBranchF, PCPlus4F, InstrF : STD_LOGIC_VECTOR(31 downto 0);
			
	-- signals stage De
	signal equalD: STD_LOGIC;
	signal WriteRegW, RsD, RtD, RdD: STD_LOGIC_VECTOR(4 downto 0);
	signal InstD, PCPlus4D, ResultW, AluOutM, RD1, RD2, signImmD, PCBranchD	: STD_LOGIC_VECTOR(31 downto 0); 
	
	-- signals stage EX
	signal RegWriteE, MemtoRegE, MemWriteE,  ALUSrcE, RegDstE, ALUOutOvfl, ALUOutZero, RegWriteE_S, MemtoRegE_S, MemWriteE_S: STD_LOGIC;
	signal ForwardAE, ForwardBE : STD_LOGIC_VECTOR(1 downto 0);
	signal ALUControlE : STD_LOGIC_VECTOR(3 downto 0);
	signal RtE, RdE, WriteRegE : STD_LOGIC_VECTOR(4 downto 0);
	signal RD1_E, RD2_E, SignImmE, ALUOutE, WriteDataE : STD_LOGIC_VECTOR(31 downto 0);--ResultW, ALUOutM,
	
	-- signals stage MEM
	signal RegWriteM, MemtoRegM, MemWriteM, RegWriteM_S, MemtoRegM_S : STD_LOGIC;--clk,
	signal WriteDataM, ReadDataM :STD_LOGIC_VECTOR(31 downto 0); --ALUOutM,
	signal WriteRegM,	WriteRegM_S : STD_LOGIC_VECTOR(4 downto 0);

	-- signals stage WB
	signal memtoregW	: STD_LOGIC;
	signal ALUoutW, ReadDataW : STD_LOGIC_VECTOR(31 downto 0);--, ResultW
	
	begin	
	
			InsFetch: stageF port map(clk, PCSrcF, StallF, PCJumpF, PCBranchF, PCPlus4F, InstrF);
			-- regIFID
			InsDecode: stageD port map (InstD, PCPlus4D, ResultW, WriteRegW, AluOutM, RD1, RD2, signImmD, RsD, RtD, RdD, equalD, PCBranchD);
			-- regIDEX
			Execute:stageEX port map (RegWriteE, MemtoRegE, MemWriteE, ALUControlE, ALUSrcE, RegDstE, RD1_E, RD2_E, RtE, RdE, SignImmE, ResultW, ALUOutM, ForwardAE, ForwardBE, ALUOutE, WriteDataE, WriteRegE, ALUOutOvfl, ALUOutZero, RegWriteE_S, MemtoRegE_S, MemWriteE_S);
			-- regEXMEM:
			Memory:stageMEM port map (RegWriteM, MemtoRegM, MemWriteM, clk, ALUOutM, WriteDataM, WriteRegM, ReadDataM, WriteRegM_S, RegWriteM_S, MemtoRegM_S);
			-- regMEMWB:
			WriteBack:stageWB port map (memtoregW, ALUoutW, ReadDataW, ResultW);
		
		
end architecture mipsPipe_line_op;
