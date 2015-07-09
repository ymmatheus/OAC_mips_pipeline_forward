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

end controleMIPS;

architecture controleMIPS_op of controleMIPS is

	signal JumpDsig		: std_logic;
	signal BranchEQDsig	: std_logic;
	signal BranchNEDsig	: std_logic;

begin
	proc_controle: process(Op, Funct)
	begin
		case Op is
			-- Instruções Tipo R
			when "000000" => 	RegDstD 		<= '1';
								RegWriteD	<= '1';	
								MemtoRegD	<= '0';		
								MemWriteD	<= '0';		
								ALUsrcD		<= '0';				
								BranchEQDsig	<= '0';
								BranchNEDsig	<= '0';
								JumpDsig		<= '0';
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
			when "100011" => 	RegDstD 			<= '0';
								RegWriteD		<= '1';
								MemtoRegD		<= '1';		
								MemWriteD		<= '0';	
								ALUControlD 	<= X"2";	
								ALUsrcD			<= '1';			
								BranchEQDsig		<= '0';
								BranchNEDsig		<= '0';
								JumpDsig 			<= '0';
								
			-- SW(0x2B)()
			when "101011" => 	RegDstD 			<= '0';
								RegWriteD		<= '1';
								MemtoRegD		<= '1';		
								MemWriteD		<= '0';	
								ALUControlD 	<= X"2";	
								ALUsrcD			<= '1';			
								BranchEQDsig		<= '0';
								BranchNEDsig		<= '0';
								JumpDsig 			<= '0';
								
			-- BEQ(0x04)()
			when "000100" => RegDstD 			<= '0';
								RegWriteD		<= '0';
								MemtoRegD		<= '0';		
								MemWriteD		<= '0';	
								ALUControlD 	<= X"2";
								ALUsrcD			<= '1';				
								BranchEQDsig		<= '1';
								BranchNEDsig		<= '0';
								JumpDsig			<= '0';
									
			-- ADDI(0x08)()
			when "001000" => RegDstD 			<= '0';
								RegWriteD		<= '1';	
								MemtoRegD		<= '0';		
								MemWriteD		<= '0';	
								ALUControlD 	<= X"2";	
								ALUsrcD			<= '1';				
								BranchEQDsig		<= '0';
								BranchNEDsig		<= '0';				
								JumpDsig			<= '0';
								
								
			-- BNE(0x05)()
			when "000101" => RegDstD 			<= '0';
								RegWriteD		<= '0';
								MemtoRegD		<= '0';		
								MemWriteD		<= '0';	
								ALUControlD 	<= X"2";	
								ALUsrcD			<= '1';			
								BranchEQDsig		<= '0';
								BranchNEDsig		<= '1';
								JumpDsig 			<= '0';
								
			-- J(0x02)()
			when "000010" => RegDstD 			<= '0';
								RegWriteD		<= '0';
								MemtoRegD		<= '0';		
								MemWriteD		<= '0';	
								ALUControlD 	<= X"2";
								ALUsrcD			<= '1';				
								BranchEQDsig		<= '0';
								BranchNEDsig		<= '0';
								JumpDsig 			<= '0';
			when others => null;
		end case;
		
		JumpD				<= JumpDsig;
		BranchD			<= BranchEQDsig or BranchNEDsig;
		BranchClear		<= JumpDsig or BranchEQDsig or BranchNEDsig;
		PCsrcD(0)		<= (equalD and BranchEQDsig) or (not(equalD) and BranchNEDsig);
		PCsrcD(1)		<= JumpDsig;

		
		
	end process;
end architecture controleMIPS_op;
