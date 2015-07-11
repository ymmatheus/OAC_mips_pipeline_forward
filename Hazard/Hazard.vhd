library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Hazard is
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
end Hazard;

architecture behavioral of Hazard is

begin
	Execute:process(RegWriteM, RegWriteW, WriteRegM, WriteRegW, WriteRegE, RsE, RtE ,
														MemtoRegE,RsD, RtD)
	begin

		ForwardA <= "00";
		ForwardB <= "00";
		StallD	<= '0';
		StallF	<= '0';
		--Execute
		if((RegWriteM = '1') and (WriteRegM /= "00000") and (WriteRegM = RsE)) then
			ForwardA <= "10";
		end if;
		
		if((RegWriteM = '1') and (WriteRegM /= "00000") and (WriteRegM = RtE)) then
			ForwardB <= "10";
		end if;
		
		--MEM
		if((RegWriteW = '1') and (WriteRegW /= "00000") and (WriteRegW = RsE)) then
			ForwardA <= "01";
		end if;
		
		if((RegWriteW = '1') and (WriteRegW /= "00000") and (WriteRegW = RtE)) then
			ForwardB <= "01";
		end if;		
		
		
		--LW
		if((MemtoRegE = '1') and ( WriteRegE = RtD or WriteRegE = RsD )) then
			StallF <= '1';
		end if;
		
	end process;
end architecture behavioral;
	