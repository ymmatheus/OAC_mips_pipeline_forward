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
	component controleMIPS
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

	-- Unidade de Hazard
	component Hazard 
		port (	
				RsD			:in std_logic_vector(4 downto 0);
				RtD			:in std_logic_vector(4 downto 0);				
				RsE			:in std_logic_vector(4 downto 0);
				RtE			:in std_logic_vector(4 downto 0);
				MemtoRegE	:in std_logic;
				WriteRegM	:in std_logic_vector(4 downto 0);
				WriteRegE	:in std_logic_vector(4 downto 0);
				WriteRegW	:in std_logic_vector(4 downto 0);
				RegWriteW	:in std_logic;
				RegWriteM	:in std_logic;
				
				StallF		:out std_logic;
				StallD		:out std_logic;
				ForwardA		:out std_logic_vector(1 downto 0);
				ForwardB		:out std_logic_vector(1 downto 0));
	end component;


	-- Registradores
	-- IF/ID
	component RegIFID
		port(	InstrF					:in	std_logic_vector(31 downto 0);
				PCplus4F					:in	std_logic_vector(31 downto 0);	
				EN							:in	std_logic;
				CLR						:in	std_logic;
				clk						:in	std_logic;
				
				InstrD					:out	std_logic_vector(31 downto 0);
				PCplus4D					:out	std_logic_vector(31 downto 0));
	end component;
	
	--ID/EX
	component RegIDEX
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
		
	-- MEM/WB
	component regMEMWB
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
	
	-- Stage Decode
	component stageD 
		port(
		clk			: in std_logic;
		InstD 		: in std_logic_vector(31 downto 0);
		PCPlus4D		: in std_logic_vector(31 downto 0);

		ResultW		: in std_logic_vector(31 downto 0); -- wb
		WriteRegW	: in std_logic_vector(4 downto 0); 	-- wb
		RegWriteW	: in std_logic;						  	-- wb
		
		AluOutM		: in std_logic_vector(31 downto 0); -- forward
		ForwardA		: in std_logic_vector(1 downto 0);
		ForwardB		: in std_logic_vector(1 downto 0);
		
		
		RD1			: out std_logic_vector(31 downto 0); -- Reg D\X
		RD2			: out std_logic_vector(31 downto 0);  -- Reg D\X
		
		signImmD		: out std_logic_vector(31 downto 0);  -- Reg D\X
		
		RsD			: out std_logic_vector(4 downto 0);  -- Reg D\X
		RtD			: out std_logic_vector(4 downto 0);  -- Reg D\X
		RdD			: out std_logic_vector(4 downto 0);  -- Reg D\X
		
		equalD		: out std_logic;							 -- Controle
	
		Op				: out std_logic_vector(5 downto 0);   -- Reg D\X
		Funct 		: out std_logic_vector(5 downto 0);   -- Reg D\X
		PCJumpD		: out std_logic_vector(31 downto 0);  -- Fetch
		PCBranchD	: out std_logic_vector(31 downto 0));    -- Fetch	
		end component;

	-- Stage Execute
	component stageEX 
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
				ALUOutOvfl		:out std_logic);				
	end component;
	
	-- Stage Memory
	component stageMEM
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
	component stageWB 
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

	-- signals Unidade de Hazard
	signal MemtoRegE, RegWriteW, RegWriteM, StallF, StallD : STD_LOGIC;
	signal ForwardA, ForwardB : STD_LOGIC_VECTOR(1 downto 0);
	signal RsD, RtD, RsE, RtE, WriteRegM, WriteRegE, WriteRegW : STD_LOGIC_VECTOR(4 downto 0);
	
	-- signals stage IF
	--StallF : STD_LOGIC;
	signal PCSrcF : STD_LOGIC_VECTOR(1 downto 0);
	signal PCJumpF, PCBranchF : STD_LOGIC_VECTOR(31 downto 0);--PCPlus4F, InstrF
	
	-- signals RegIFID
	signal EN, CLR_IFID: STD_LOGIC;--clk
	signal InstrF, PCplus4F, InstrD, PCplus4D: STD_LOGIC_VECTOR(31 downto 0);

	-- signals stage DE
	--equalD, clk: STD_LOGIC;
	--RegWriteW, ForwardA, ForwardB : STD_LOGIC;
	signal RdD: STD_LOGIC_VECTOR(4 downto 0);--WriteRegW, RsD, RtD, 
	-- Op, Funct : STD_LOGIC_VECTOR(5 downto 0);
	signal ResultW, AluOutM, RD1, RD2, signImmD, PCBranchD, PCJumpD: STD_LOGIC_VECTOR(31 downto 0); --InstrD, PCPlus4D, 
	
	-- signals RegIDEX
	signal CLR_IDEX : STD_LOGIC; --clk, RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, RegDstD
	signal MemWriteE, ALUSrcE, RegDstE, RegWriteE: STD_LOGIC;--, MemtoRegE, 
	signal ALUControlE: STD_LOGIC_VECTOR(3 downto 0);--ALUControlD,
	signal RdE : STD_LOGIC_VECTOR(4 downto 0);--RsD, RtD, RdD, RsE, RtE, 
	signal SignImmE, RD1_E, RD2_E: STD_LOGIC_VECTOR(31 downto 0);--RD1, RD2, SignImmD,

	-- signals stage EX
	signal ALUOutOvfl, ALUOutZero, RegWriteE_S, MemtoRegE_S, MemWriteE_S: STD_LOGIC;
	--ForwardAE, ForwardBE : STD_LOGIC_VECTOR(1 downto 0);
	--ALUControlE std_LOGIC_VECTOR(3 downto 0)
	--WriteRegE: STD_LOGIC_VECTOR(4 downto 0);--RtE, RdE,
	signal ALUOutE, WriteDataE: STD_LOGIC_VECTOR(31 downto 0);--ResultW, ALUOutM, RD1_E, RD2_E, SignImmE, 
				
	-- signals RegEXMEM
	signal wren_EXMEM, MemWriteM, MemtoRegM : STD_LOGIC;--clk, RegWriteE, MemtoRegE, MemWriteE, RegWriteM
	signal WriteDataM: STD_LOGIC_VECTOR(31 downto 0);--ALUoutE, WriteDataE, ALUoutM, 
	--WriteRegE, WriteRegM: STD_LOGIC_VECTOR(4 downto 0); 

	-- signals stage MEM
	signal RegWriteM_S, MemtoRegM_S : STD_LOGIC;--clk, MemtoRegM, RegWriteM, MemWriteM, 
	signal ReadDataM :STD_LOGIC_VECTOR(31 downto 0); --ALUOutM, WriteDataM, 
	signal WriteRegM_S : STD_LOGIC_VECTOR(4 downto 0);--WriteRegM,	
	
	-- signals RegMEMWB
	signal wren_MEMWB, MemtoRegW	: STD_LOGIC;--clk, regWriteM, MemtoRegM,RegWriteW
	signal ReadDataW, ALUoutW : STD_LOGIC_VECTOR(31 downto 0);--ALUoutM, ReadDataM, 
	--WriteRegM, WriteRegW: STD_LOGIC_VECTOR(4 downto 0)
	
	-- signals stage WB
	--MemtoRegW	: STD_LOGIC;
	--ALUoutW, ReadDataW, ResultW : STD_LOGIC_VECTOR(31 downto 0)
	
	begin	
	
			UnidadeControle : controleMIPS port map (Op, Funct, equalD, RegWriteD, MemtoRegD, MemWriteD, ALUControlD, ALUsrcD, REgDstD, BranchD, BranchClear, JumpD, PCsrcD);

			UnidadeHazard : hazard port map (RsD, RtD, RsE, RtE, MemtoRegE, WriteRegM, WriteRegE, WriteRegW, RegWriteW, RegWriteM, StallF, StallD, ForwardA, ForwardB);
	
			InsFetch : stageF 		port map(clk, PCSrcF, StallF, PCJumpF, PCBranchF, PCPlus4F, InstrF);
			registrador1: regIFID 	port map (InstrF, PCplus4F, EN, CLR_IFID, clk, InstrD, PCplus4D);

			InsDecode : stageD 		port map (clk, InstrD, PCPlus4D, ResultW, WriteRegW, regWriteW, AluOutM, ForwardA, ForwardB, RD1, RD2, signImmD, RsD, RtD, RdD, equalD, Op, Funct, PCJumpD, PCBranchD);
			registrador2: regIDEX 	port map (RD1, RD2, RegWriteD, MemtoRegD, MemWriteD, ALUControlD, ALUSrcD, RegDstD, RsD, RtD, RdD, SignImmD, CLR_IDEX, clk, RegWriteE, MemtoRegE, MemWriteE, ALUControlE, ALUSrcE, RegDstE, RsE, RtE, RdE, SignImmE, RD1_E, RD2_E);

			Execute : stageEX 		port map (ALUControlE, ALUSrcE, RegDstE, RD1_E, RD2_E, RtE, RdE, SignImmE, ALUOutE, WriteDataE, WriteRegE, ALUOutOvfl, ALUOutZero);
			registrador3: regEXMEM 	port map (clk, wren_EXMEM, regWriteE, memtoRegE, memWriteE, ALUOutE, WriteDataE, WriteRegE, regWriteM, memtoRegM, memWriteM, ALUOutE, WriteDataM, WriteRegM);

			Memory : stageMEM 		port map (RegWriteM, MemtoRegM, MemWriteM, clk, ALUOutM, WriteDataM, WriteRegM, ReadDataM, WriteRegM_S, RegWriteM_S, MemtoRegM_S);			
			registrador4 : regMEMWB port map (clk, wren_MEMWB, regWriteM, memtoRegM, ReadDataM, ALUoutM, WriteRegM, regWriteW, memtoregW, ReadDataW, ALUoutW, WriteRegW);
			
			WriteBack : stageWB 		port map (memtoregW, ALUoutW, ReadDataW, ResultW);		

					
end architecture mipsPipe_line_op;
