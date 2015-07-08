library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity RegIFID_testbench is

end RegIFID_testbench;

architecture estrutural of RegIFID_testbench is

component RegIFID is
	port(	InstrF					:in	std_logic_vector(31 downto 0);
			PCplus4F					:in	std_logic_vector(31 downto 0);	
			EN							:in	std_logic;
			CLR						:in	std_logic;
			clk						:in	std_logic;
			InstrD					:out	std_logic_vector(31 downto 0);
			PCplus4D					:out	std_logic_vector(31 downto 0));
end component;

	signal	InstrF				:	std_logic_vector(31 downto 0);
	signal	PCplus4F				:	std_logic_vector(31 downto 0);	
	signal	EN						:	std_logic;
	signal	CLR					:	std_logic;
	signal	clk					:	std_logic;
	signal	InstrD				:	std_logic_vector(31 downto 0);
	signal	PCplus4D				:	std_logic_vector(31 downto 0);
	
begin

	RgIFID:RegIFID port map (InstrF=> InstrF, PCplus4F => PCplus4F, EN => EN, CLR => CLR, clk => clk, InstrD => InstrD,
	PCplus4D => PCplus4D);
	clock: process begin
		
		clk <= '0'; EN <= '1'; wait for 5ns;	
		clk <= '1'; En <= '0'; wait for 5ns;
		
		end process;
	
	drive: process begin
		
		CLR <= '0';
		InstrF <= X"000000FF";
		Pcplus4F <= X"00000004";
		wait for 10ns;

		InstrF <= X"00000055";
		PCplus4F <= X"00000008";
		wait for 10ns;
		
		CLR <= '1';
		InstrF <= X"00000066";
		PCplus4F <= X"0000000C";
		wait for 10ns;
		
		CLR <= '0';
		InstrF <= X"00000077";
		PCplus4F <= X"00000010";
		wait for 10ns;
		
	end process;
end estrutural;