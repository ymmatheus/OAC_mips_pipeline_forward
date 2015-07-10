-- MIPS Pipeline

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mipsPipe_line is
	port(
		clk : in STD_LOGIC);
end mipsPipe_line;

architecture mipsPipe_line_op of mipsPipe_line is
	-- Unidade de Controle
	component controleMIPS is
		port(
			Op					: in STD_LOGIC_VECTOR(5 downto 0);
			Funct				: in STD_LOGIC_VECTOR(5 downto 0);
			equalD			: in std_logic;
			RegWriteD		: out STD_LOGIC;
			MemtoRegD		: out STD_LOGIC;
			MemWriteD		: out STD_LOGIC;
			ALUControlD		: out STD_LOGIC_VECTOR(3 downto 0);
			ALUsrcD			: out STD_LOGIC;
			RegDstD			: out STD_LOGIC;
			BranchD			: out std_logic;
			BranchClear		: out std_logic;
			JumpD 			: out std_logic;
			PCsrcD			: out std_logic_vector(1 downto 0));
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

	-- Estágios MIPS	
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
	
	-- signal Unidade de Controle
	signal equalD, RegWriteD, MemtoRegD, MemWriteD: STD_LOGIC; 
	signal ALUsrcD, RegDstD, BranchD, BranchClear, JumpD: STD_LOGIC;
	signal PCsrcD: STD_LOGIC_VECTOR(1 downto 0);
	signal ALUControlD: STD_LOGIC_VECTOR(3 downto 0);
	signal Op, Funct: STD_LOGIC_VECTOR(5 downto 0);

	-- signals stage IF
	signal StallF : STD_LOGIC;--clk
	signal PCSrcF : STD_LOGIC_VECTOR(1 downto 0);
	signal PCJumpF, PCBranchF : STD_LOGIC_VECTOR(31 downto 0);--PCPlus4F, InstrF
	
	-- signals RegIFID
	signal EN, CLR_IFID: STD_LOGIC;--clk
	signal InstrF, PCplus4F, InstrD, PCplus4D: STD_LOGIC_VECTOR(31 downto 0);

	-- signals stage DE
	--equalD: STD_LOGIC;
	signal WriteRegW, RsD, RtD, RdD: STD_LOGIC_VECTOR(4 downto 0);
	signal ResultW, AluOutM, RD1, RD2, signImmD, PCBranchD	: STD_LOGIC_VECTOR(31 downto 0); --InstrD, PCPlus4D, 
	
	-- signals RegIDEX
	signal CLR_IDEX : STD_LOGIC; --clk, RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, RegDstD
	signal RegWriteE, MemtoRegE, MemWriteE, ALUSrcE, RegDstE: STD_LOGIC;
	signal ALUControlE: STD_LOGIC_VECTOR(3 downto 0);--ALUControlD,
	signal RsE, RtE, RdE: STD_LOGIC_VECTOR(4 downto 0);--RsD, RtD, RdD,
	signal SignImmE, RD1_E, RD2_E: STD_LOGIC_VECTOR(31 downto 0);--RD1, RD2, SignImmD,

	-- signals stage EX
	signal ALUOutOvfl: STD_LOGIC;--RegWriteE, MemtoRegE, MemWriteE,  ALUSrcE, RegDstE,
	signal ALUOutZero, RegWriteE_S, MemtoRegE_S, MemWriteE_S: STD_LOGIC;
	signal ForwardAE, ForwardBE : STD_LOGIC_VECTOR(1 downto 0);
	--ALUControlE std_LOGIC_VECTOR(3 downto 0)
	signal WriteRegE : STD_LOGIC_VECTOR(4 downto 0);--RtE, RdE,
	signal ALUOutE, WriteDataE : STD_LOGIC_VECTOR(31 downto 0);--ResultW, ALUOutM, RD1_E, RD2_E, SignImmE, 
	
	-- signals RegEXMEM
	signal wren_EXMEM, RegWriteM, MemtoRegM, MemWriteM: STD_LOGIC;--clk, RegWriteE, MemtoRegE, MemWriteE
	signal WriteDataM: STD_LOGIC_VECTOR(31 downto 0);--ALUoutE, WriteDataE, ALUoutM, 
	signal WriteRegM: STD_LOGIC_VECTOR(4 downto 0);--WriteRegE, 

	-- signals stage MEM
	signal RegWriteM_S, MemtoRegM_S : STD_LOGIC;--clk, MemtoRegM, RegWriteM, MemWriteM, 
	signal ReadDataM :STD_LOGIC_VECTOR(31 downto 0); --ALUOutM, WriteDataM, 
	signal WriteRegM_S : STD_LOGIC_VECTOR(4 downto 0);--WriteRegM,	
	
	-- signals RegMEMWB
	signal wren_MEMWB, regWriteW, MemtoRegW	: STD_LOGIC;--clk, regWriteM, MemtoRegM,
	signal ReadDataW, ALUoutW : STD_LOGIC_VECTOR(31 downto 0);--ALUoutM, ReadDataM, 
	--WriteRegM, WriteRegW: STD_LOGIC_VECTOR(4 downto 0)
					
	-- signals stage WB
	--MemtoRegW	: STD_LOGIC;
	--ALUoutW, ReadDataW, ResultW : STD_LOGIC_VECTOR(31 downto 0)
	
	begin	
			
			UnidadeControle: controleMIPS port map (Op, Funct, equalD, RegWriteD, MemtoRegD, MemWriteD, ALUControlD, ALUsrcD, REgDstD, BranchD, BranchClear, JumpD, PCsrcD);
			
			InsFetch: stageF port map(clk, PCSrcF, StallF, PCJumpF, PCBranchF, PCPlus4F, InstrF);
			registrador1: regIFID port map (InstrF, PCplus4F, EN, CLR_IFID, clk, InstrD, PCplus4D);

			InsDecode: stageD port map (InstrD, PCPlus4D, ResultW, WriteRegW, AluOutM, RD1, RD2, signImmD, RsD, RtD, RdD, equalD, PCBranchD);
			registrador2: regIDEX port map (RD1, RD2, RegWriteD, MemtoRegD, MemWriteD, ALUControlD, ALUSrcD, RegDstD, RsD, RtD, RdD, SignImmD, CLR_IDEX, clk, RegWriteE, MemtoRegE, MemWriteE, ALUControlE, ALUSrcE, RegDstE, RsE, RtE, RdE, SignImmE, RD1_E, RD2_E);

			Execute:stageEX port map (RegWriteE, MemtoRegE, MemWriteE, ALUControlE, ALUSrcE, RegDstE, RD1_E, RD2_E, RtE, RdE, SignImmE, ResultW, ALUOutM, ForwardAE, ForwardBE, ALUOutE, WriteDataE, WriteRegE, ALUOutOvfl, ALUOutZero, RegWriteE_S, MemtoRegE_S, MemWriteE_S);
			registrador3: regEXMEM port map (clk, wren_EXMEM, regWriteE, memtoRegE, memWriteE, ALUOutE, WriteDataE, WriteRegE, regWriteM, memtoRegM, memWriteM, ALUOutE, WriteDataM, WriteRegM);

			Memory:stageMEM port map (RegWriteM, MemtoRegM, MemWriteM, clk, ALUOutM, WriteDataM, WriteRegM, ReadDataM, WriteRegM_S, RegWriteM_S, MemtoRegM_S);			
			registrador4: regMEMWB port map (clk, wren_MEMWB, regWriteM, memtoRegM, ReadDataM, ALUoutM, WriteRegM, regWriteW, memtoregW, ReadDataW, ALUoutW, WriteRegW);
			
			WriteBack:stageWB port map (memtoregW, ALUoutW, ReadDataW, ResultW);		
			
end architecture mipsPipe_line_op;
