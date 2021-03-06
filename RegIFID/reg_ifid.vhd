library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity RegIFID is
	port(	InstrF					:in	std_logic_vector(31 downto 0):= X"00000000";
			PCplus4F					:in	std_logic_vector(31 downto 0):= X"00000000";	
			EN							:in	std_logic;
			CLR						:in	std_logic;
			clk						:in	std_logic;
			InstrD					:out	std_logic_vector(31 downto 0):= X"00000000";
			PCplus4D					:out	std_logic_vector(31 downto 0):= X"00000000");
end RegIFID;

architecture reg_ifid of RegIFID is
signal instr_interno: std_logic_vector(31 downto 0):= X"00000000";
signal progcounter : std_logic_vector(31 downto 0):= X"00000000";

begin

	proc_escrita: process(EN,CLR,InstrF,PCplus4F, clk)
	begin
		if (rising_edge(clk) and EN = '0' and CLR = '0') then
			instr_interno <= InstrF;
			progcounter <= PCplus4f;
		end if;
		
		if(CLR = '1') then
			instr_interno <= X"00000000";
			progcounter <= X"00000000";
		end if;
	end process;
	
	proc_leitura: process(instr_interno, progcounter)
	begin
		InstrD <= instr_interno;
		PCplus4D <= progcounter;
	end process;
end reg_ifid;
			