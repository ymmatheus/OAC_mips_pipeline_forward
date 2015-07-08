library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity RegIDEX_testbench is

end RegIDEX_testbench;

architecture estrutural of RegIDEX_testbench is

component RegIDEX is
	port(	RD1						:in	std_logic_vector(31 downto 0);
			RD2						:in	std_logic_vector(31 downto 0);	
			RegWriteD				:in	std_logic;
			MemtoRegD				:in 	std_logic;
			MemWriteD				:in	std_logic;
			ALUControlD				:in	std_logic_vector(2 downto 0);
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
			ALUControlE				:out	std_logic_vector(2 downto 0);
			ALUSrcE					:out	std_logic;
			RegDstE					:out	std_logic;
			RsE						:out	std_logic_vector(4 downto 0);
			RtE						:out	std_logic_vector(4 downto 0);
			RdE						:out	std_logic_vector(4 downto 0);
			SignImmE					:out	std_logic_vector(31 downto 0);
			RD1_E						:out 	std_logic_vector(31 downto 0);
			RD2_E						:out	std_logic_vector(31 downto 0));
end component;

	signal RD1						:	std_logic_vector(31 downto 0);
	signal RD2						:	std_logic_vector(31 downto 0);	
	signal RegWriteD				:	std_logic;
	signal MemtoRegD				: 	std_logic;
	signal MemWriteD				:	std_logic;
	signal ALUControlD			:	std_logic_vector(2 downto 0);
	signal ALUSrcD					:	std_logic;
	signal RegDstD					:	std_logic;
	signal RsD						: 	std_logic_vector(4 downto 0);
	signal RtD						:	std_logic_vector(4 downto 0);
	signal RdD						:	std_logic_vector(4 downto 0);
	signal SignImmD				:	std_logic_vector(31 downto 0);
	signal CLR						:	std_logic;
	signal clk						:	std_logic;
	signal RegWriteE				:	std_logic;
	signal MemtoRegE				: 	std_logic;
	signal MemWriteE				:	std_logic;
	signal ALUControlE			:	std_logic_vector(2 downto 0);
	signal ALUSrcE					:	std_logic;
	signal RegDstE					:	std_logic;
	signal RsE						:	std_logic_vector(4 downto 0);
	signal RtE						:	std_logic_vector(4 downto 0);
	signal RdE						:	std_logic_vector(4 downto 0);
	signal SignImmE			   :	std_logic_vector(31 downto 0);
	signal RD1_E					: 	std_logic_vector(31 downto 0);
	signal RD2_E					:	std_logic_vector(31 downto 0);
	
begin

	RgIDEX:RegIDEX port map (RD1=> RD1, RD2 => RD2, RegWriteD => RegWriteD, MemtoRegD => MemtoRegD, 
	MemWriteD => MemWriteD, ALUControlD => ALUControlD, ALUSrcD => ALUSrcD, RegDstD => RegDstD, RsD => RsD, RtD => RtD,
	RdD => RdD, SignImmD => SignImmD, CLR => CLR, clk => clk, RegWriteE => RegWriteE, MemtoRegE => MemtoRegE,
	ALUControlE => ALUControlE, ALUSrcE => ALUSrcE, RegDstE => RegDstE, RsE => RsE, RtE => RtE, RdE => RdE,
	SignImmE => SignImmE, RD1_E => RD1_E, RD2_E => RD2_E);
	clock: process begin
		
		clk <= '0';  wait for 5ns;	
		clk <= '1';  wait for 5ns;
		
		end process;
	
	drive: process begin
		
		
	end process;
end estrutural;