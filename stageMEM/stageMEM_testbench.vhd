library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity stageMEM_testbench is

end stageMEM_testbench;

architecture estrutural of stageMEM_testbench is 

	component stageMEM
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
	end component;
	
		signal tb_RegWriteM			: std_logic;
		signal tb_MemtoRegM			: std_logic;
		signal tb_MemWriteM			: std_logic;
		signal tb_clk					: std_logic;
		signal tb_ALUOutM				: std_logic_vector(31 downto 0);
		signal tb_WriteDataM			: std_logic_vector(31 downto 0);
		signal tb_WriteRegM			: std_logic_vector(4 downto 0);
		signal tb_ReadDataM			: std_logic_vector(31 downto 0);
		signal tb_WriteRegM_S		: std_logic_vector(4 downto 0);
		signal tb_RegWriteM_S		: std_logic;
		signal tb_MemtoRegM_S		: std_logic;
		
		begin
		
		map_stageMEM:stageMEM port map(tb_RegWriteM,tb_MemtoRegM,tb_MemWriteM,tb_clk,tb_ALUOutM,tb_WriteDataM,
		tb_WriteRegM,tb_ReadDataM,tb_WriteRegM_S,tb_RegWriteM_S,tb_MemtoRegM_S);
		
		clock: process begin
		
			tb_clk <= '0';  wait for 5ns;	
			tb_clk <= '1';  wait for 5ns;
		
		end process;
		
		drive: process
		begin
			
			tb_RegWriteM	<= '0';
			tb_MemtoRegM	<= '0';
			tb_MemWriteM	<= '0';
			tb_ALUOutM		<= X"0000000F";
			tb_WriteDataM	<= X"00000005";
			tb_WriteRegM	<=	"00001";
			wait for 10ns;
			
			tb_RegWriteM	<= '0';
			tb_MemtoRegM	<= '0';
			tb_MemWriteM	<= '1';
			tb_ALUOutM		<= X"0000000F";
			tb_WriteDataM	<= X"00000005";
			tb_WriteRegM	<=	"00001";
			wait for 10ns;
			
		end process;
end estrutural;
			
			