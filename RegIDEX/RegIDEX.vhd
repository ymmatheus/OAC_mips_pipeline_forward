library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity RegIDEX is
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
end RegIDEX;

architecture reg_idex of RegIDEX is
	signal RegW				: std_logic;
	signal MemReg			: std_logic;
	signal MemW				: std_logic;
	signal ALUControl		: std_logic_vector(3 downto 0):= "0000";
	signal ALUSrc			: std_logic;
	signal RegDst			: std_logic;
	signal RD_1				: std_logic_vector(31 downto 0):= X"00000000";
	signal RD_2				: std_logic_vector(31 downto 0):= X"00000000";
	signal Rs				: std_logic_vector(4 downto 0):= "00000";
	signal Rt				: std_logic_vector(4 downto 0):= "00000";
	signal Rd				: std_logic_vector(4 downto 0):= "00000";
	signal SignImm			: std_logic_vector(31 downto 0):= X"00000000";
	
begin

	proc_escrita: process(RD1,RD2,RegWriteD,MemtoRegD,MemWriteD,ALUControlD,ALUSrcD,RegDstD,RsD,RtD,RdD,SignImmD,CLR,clk)
	begin
		if (rising_edge(clk) and CLR = '0') then
			RegW 			<= RegWriteD;
			MemReg 		<= MemtoRegD;
			MemW 			<= MemWriteD;
			ALUControl 	<= AluControlD;
			ALUSrc		<= AluSrcD;
			RegDst 		<= RegDstD;
			RD_1 			<= RD1;
			RD_2 			<= RD2;
			Rs 			<= RsD;
			Rt 			<= RtD;
			Rd 			<= RdD;
			SignImm 		<= SignImmD;
		end if;
		
		if(CLR = '1') then
			RegW 			<= '0';
			MemReg	 	<= '0';
			MemW 			<= '0';
			ALUControl 	<= "0000";
			ALUSrc 		<= '0';
			RegDst 		<= '0';
			RD_1 			<= X"00000000";
			RD_2 			<= X"00000000";
			Rs				<= "00000";
			Rt				<= "00000";
			Rd				<= "00000";
			SignImm		<= X"00000000";
			
		end if;
	end process;
	
	proc_leitura: process(clk,RegW,MemReg,MemW,ALUControl,ALUSrc,RegDst,Rs,Rt,Rd,SignImm,RD_1,RD_2)
	begin
		RegWriteE 	<= RegW;
		MemtoRegE 	<= MemReg;
		MemWriteE 	<= MemW;
		ALUControlE <= ALUControl;
		ALUSrcE 		<= ALUSrc;
		RegDstE 		<= RegDst;
		RsE 			<= Rs;
		RtE 			<= Rt;
		RdE 			<= Rd;
		SignImmE 	<= SignImm;
		RD1_E			<= RD_1;
		RD2_E			<= RD_2;
	end process;
end reg_idex;
			