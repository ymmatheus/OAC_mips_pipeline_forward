library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity stageD is
	port(
		InstD 		: in std_logic_vector(31 downto 0);
		PCPlus4D		: in std_logic_vector(31 downto 0);

		ResultW		: in std_logic_vector(31 downto 0); --wd3
		WriteRegW	: in std_logic_vector(4 downto 0); --a3
		
		AluOutM		: in std_logic_vector(31 downto 0); -- forward

		RD1			: out std_logic_vector(31 downto 0); 
		RD2			: out std_logic_vector(31 downto 0); 
		
		signImmD		: out std_logic_vector(31 downto 0); 
		
		RsD			: out std_logic_vector(4 downto 0); 
		RtD			: out std_logic_vector(4 downto 0); 
		RdD			: out std_logic_vector(4 downto 0); 
		
		equalD		: out std_logic;
	
	
		PCBranchD	: out std_logic_vector(31 downto 0));
		
end stageD;

architecture behavioral of stageD is


begin

end architecture behavioral;
