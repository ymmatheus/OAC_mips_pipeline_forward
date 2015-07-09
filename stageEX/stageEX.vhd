library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity stageEX is
	port (	RegWriteE		:buffer std_logic;
				MemtoRegE		:buffer std_logic;
				MemWriteE		:buffer std_logic;
				ALUControlE		:in std_logic_vector(3 downto 0); 
				ALUSrc			:in std_logic; 
				RegDstE			:in std_logic;
				RD1_E				:in std_logic_vector(31 downto 0);
				RD2_E				:in std_logic_vector(31 downto 0);
				RtE				:in std_logic_vector(4 downto 0);
				RdE				:in std_logic_vector(4 downto 0);
				SignImmE			:in std_logic_vector(31 downto 0);
				ResultW			:in std_logic_vector(31 downto 0);
				ALUOutM			:in std_logic_vector(31 downto 0);
				ForwardAE		:in std_logic_vector(1 downto 0);
				ForwarBE			:in std_logic_vector(1 downto 0);
				ALUOutE			:out std_logic_vector(31 downto 0);
				WriteDataE		:out std_logic_vector(31 downto 0);
				WriteRegE		:out std_logic_vector(4 downto 0);
end stageEX;