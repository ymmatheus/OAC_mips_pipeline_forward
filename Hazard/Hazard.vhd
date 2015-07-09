library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Hazard is
	port (	BranchD		:in std_logic;
				JumpD			:in std_logic;
				RsD			:in std_logic_vector(4 downto 0);
				RtD			:in std_logic_vector(4 downto 0);
				RdD			:in std_logic_vector(4 downto 0);
				RsE			:in std_logic_vector(4 downto 0);
				RtE			:in std_logic_vector(4 downto 0);
				RdE			:in std_logic_vector(4 downto 0);
				WriteRegE	:in std_logic_vector(4 downto 0);
				MemtoRegE	:in std_logic;
				RegWriteE	:in std_logic;
				WriteRegM	:in std_logic_vector(4 downto 0);
				RegWriteM	:in std_logic;
				MemtoRegM	:in std_logic;
				WriteRegW	:in std_logic_vector(4 downto 0);
				RegWriteW	:in std_logic_vector(4 downto 0);
				StallF		:out std_logic;
				StallD		:out std_logic;
				ForwardAD	:out std_logic_vector(1 downto 0);
				ForwardBD	:out std_logic_vector(1 downto 0);
				ForwardAE	:out std_logic_vector(1 downto 0);
				ForwardBE	:out std_logic_vector(1 downto 0));
end Hazard;

architecture behavioral of Hazard is

begin
	Execute:process(BranchD,JumpD,RsD,RtD,RdD,RsE,RtE,RdE,WriteRegE,MemtoRegE,RegWriteE,WriteRegM,RegWriteM,MemtoRegM,WriteRegW,
	RegWriteW)
	begin

	--Execute
	if((RegWriteM = '1') and (WriteRegM /= "00000") and (WriteRegM = RsE)) then
	ForwardAE <= "10";
	end if;
	
	end process;
end architecture behavioral;
	