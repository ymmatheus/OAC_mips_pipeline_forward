-- Unidade de Controle MIPS
-- 					Sinais de Controle
-- Execução/ Calculo endereço: RegDst, OpALU1, opALU0, OrigALU
-- Acesso a Memoria: Branch, LeMem, EscreveMem 
-- Escrita do Resultado: EscreveReg, MemtoReg
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity controleMIPS is
port (
		Op				: in STD_LOGIC_VECTOR(5 downto 0);
		Funct			: in STD_LOGIC_VECTOR(5 downto 0);
		RegWrite		: out STD_LOGIC;
		MemtoReg		: out STD_LOGIC;
		MemWrite		: out STD_LOGIC;
		ALUControl	: out STD_LOGIC_VECTOR(2 downto 0);
		ALUsrc		: out STD_LOGIC;
		RegDst		: out STD_LOGIC;
		Branch 		: out STD_LOGIC);
end controleMIPS

architecture controleMIPS_op of controleMIPS is

begin
	proc_controle: process(Op, Funct);
	
		begin 
			case Funct is
				-- Instruções Tipo R
				--	ADD(0x00)(0x20), SUB(0x00)(0x22), AND(0x00)(0x24), OR(0x00)(0x25), NOR(0x00)(0x27), XOR(0x00)(0x26), SLT(0x00)(0x2A), SLL(0x00)(0x00), SRL(0x00)(0x02), SRA(0x00)(0x03)
				when "0x00" | "0x20" | "0x22" | "0x24" | "0x25" | "0x27" | "0x26" | "0x2A" 
						=> RegDst 		<= '1',
							RegWrite		<= '1',	
							MemtoReg		<= '0',		
							MemWrite		<= '0',	
							ALUControl 	<= '',	
							ALUsrc		<= '0',				
							Branch		<= '0'; 							

			case Op is
				-- LW(0x23)()
				when "0x23"
						=> RegDst 		<= '0',
							RegWrite		<= '1',	
							MemtoReg		<= '1',		
							MemWrite		<= '0',	
							ALUControl 	<= '',	
							ALUsrc		<= '1',				
							Branch		<= '0'; 							
				-- SW(0x2B)()
				when "0x2B"
						=> RegWrite		<= '0',			
							MemWrite		<= '1',	
							ALUControl 	<= '',	
							ALUsrc		<= '1',				
							Branch		<= '0'; 
				-- BEQ(0x04)()
				when "0x04"
						=> RegWrite		<= '0',			
							MemWrite		<= '1',	
							ALUControl 	<= '',	
							ALUsrc		<= '0',				
							Branch		<= '1'; 	
				-- FALTA ESSA PARTE E ALUControl
				-- ADDI(0x08)()
				when "0x08"
						=> RegDst 		<= '1',
							RegWrite		<= '1',	
							MemtoReg		<= '0',		
							MemWrite		<= '0',	
							ALUControl 	<= '',	
							ALUsrc		<= '0',				
							Branch		<= '0'; 							
				-- BNE(0x05)()
				when "0x08"
						=> RegDst 		<= '1',
							RegWrite		<= '1',	
							MemtoReg		<= '0',		
							MemWrite		<= '0',	
							ALUControl 	<= '',	
							ALUsrc		<= '0',				
							Branch		<= '0'; 							
				-- J(0x02)()
				when "0x02"
						=> RegDst 		<= '1',
							RegWrite		<= '1',	
							MemtoReg		<= '0',		
							MemWrite		<= '0',	
							ALUControl 	<= '',	
							ALUsrc		<= '0',				
							Branch		<= '0'; 							
		end process
end architecture controleMIPS_op
