library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity stageMEM is
	port (	RegWriteM		:in std_logic;
				MemtoRegM		:in std_logic;
				MemWriteM		:in std_logic;
				clk				:in std_logic;
				ALUOutM			:in std_logic_vector(31 downto 0);
				WriteDataM		:in std_logic_vector(31 downto 0);
				WriteRegM		:in std_logic_vector(4 downto 0);
				ReadDataM		:out std_logic_vector(31 downto 0);
				WriteRegM_S		:out std_logic_vector(4 downto 0);
				RegWriteM_S		:out std_logic;
				MemtoRegM_S		:out std_logic);
end stageMEM;

architecture behavioral of stageMEM is

	component dataMIPS is
	PORT (	address			:IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				clock				:IN STD_LOGIC  := '1';
				data				:IN STD_LOGIC_VECTOR (31 DOWNTO 0);
				wren				:IN STD_LOGIC ;
				q					:OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
	end component;
	
begin

	map_DataMemory:dataMIPS port map (ALUOutM(7 downto 0),clk,WriteDataM,MemWriteM,ReadDataM);
	RegWriteM_S	<= RegWriteM;
	MemtoRegM_S <= MemtoRegM;
	WriteRegM_S <= WriteRegM;
	
end architecture behavioral;