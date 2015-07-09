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

end controleMIPS;

architecture controleMIPS_op of controleMIPS is

begin
	proc_controle: process(Op, Funct)
	begin
		case Op is
			-- Instruções Tipo R
			when X"00" => 	RegDstD 		<= '1', 
								RegWriteD	<= '1',	
								MemtoReg		<= '0',		
								MemWriteD	<= '0',		
								ALUsrcD		<= '0',				
								BranchEQD	<= '0',
								BranchNED	<= '0',
								JumpD 		<= '0';
								if Funct = X"20" then
									ALUControlD <= X"2"; -- ADD
								elsif Funct = X"22" then
									ALUControlD <= X"6"; -- SUB
								elsif Funct = X"24" then									
									ALUControlD <= X"0"; -- AND
								elsif Funct = X"25" then										
									ALUControlD <= X"1"; -- OR
								elsif Funct = X"27" then									
									ALUControlD <= X"B"; -- NOR
								elsif Funct = X"26" then										
									ALUControlD <= X"9"; -- XOR
								elsif Funct = X"2A" then										
									ALUControlD <= X"7"; -- SLT
								elsif Funct = X"00" then										
									ALUControlD <= X"5"; -- SLL
								elsif Funct = X"02" then									
									ALUControlD <= X"3"; -- SRL
								elsif Funct = X"03" then										
									ALUControlD <= X"4"; -- SRA
								end if;
								
			-- LW(0x23)()
			when X"23" => 	RegDstD 			<= '0',
								RegWriteD		<= '1',	
								MemtoRegD		<= '1',		
								MemWriteD		<= '0',	
								ALUControlD 	<= X"2",	
								ALUsrcD			<= '1',				
								BranchEQD		<= '0',
								BranchNED		<= '0',
								JumpD 			<= '0';
								
			-- SW(0x2B)()
			when X"2B" => 	RegDstD 			<= '0',
								RegWriteD		<= '1',	
								MemtoRegD		<= '1',		
								MemWriteD		<= '0',	
								ALUControlD 	<= X"2",	
								ALUsrcD			<= '1',				
								BranchEQD		<= '0',
								BranchNED		<= '0',
								JumpD 			<= '0';
								
			-- BEQ(0x04)()
			when X"04" => RegDstD 			<= '0',
								RegWriteD		<= '0',	
								MemtoRegD		<= '0',		
								MemWriteD		<= '0',	
								ALUControlD 	<= X"2",	
								ALUsrcD			<= '1',				
								BranchEQD		<= '1',
								BranchNED		<= '0',
								JumpD 			<= '0';
									
			-- ADDI(0x08)()
			when X"08" => RegDstD 			<= '0',
								RegWriteD		<= '1',	
								MemtoRegD		<= '0',		
								MemWriteD		<= '0',	
								ALUControlD 	<= X"2",	
								ALUsrcD			<= '1',				
								BranchEQD		<= '0',
								BranchNED		<= '0',				
								JumpD 			<= '0';
								
								
			-- BNE(0x05)()
			when X"05" => RegDstD 			<= '0',
								RegWriteD		<= '0',	
								MemtoRegD		<= '0',		
								MemWriteD		<= '0',	
								ALUControlD 	<= X"2",	
								ALUsrcD			<= '1',				
								BranchEQD		<= '0',
								BranchNED		<= '1',
								JumpD 			<= '0';
								
			-- J(0x02)()
			when X"02" => RegDstD 			<= '0',
								RegWriteD		<= '0',	
								MemtoRegD		<= '0',		
								MemWriteD		<= '0',	
								ALUControlD 	<= X"2",	
								ALUsrcD			<= '1',				
								BranchEQD		<= '0',
								BranchNED		<= '0',
								JumpD 			<= '0';
		end case;
	end process;
end architecture controleMIPS_op;
