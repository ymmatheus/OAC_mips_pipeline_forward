library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mux21 is
	port (
		sel			: in  std_logic;
		A,B			: in  std_logic_vector(4 downto 0);
		S				: out std_logic_vector(4 downto 0));
end mux21;

architecture behavioral of mux21 is

	begin
		proc_mux: process(A,B,sel) 
			begin
					case sel is

						when  '0' => S <= A;
						
						when  '1' => S <= B;
					
						when others => S <= "00000";
				  
					end case;
			end process proc_mux;
end architecture behavioral;