-- OAC Turma C - Trabalho V
-- Matheus Y. Matsumoto
-- 10/0017967
--
-- bregMIPS


--wreg: sinal de escrita. Ao ser acionado, o registrador endereçado por wadd é
--escrito com o valor presente no barramento wdata na transição de subida do
--relógio.
--• clk: relógio do circuito.
--• add1: endereço do registrador a ser lido em r1, 5 bits.
--• add2: endereço do registrador a ser lido em r2, 5 bits.
--• wdata: valor a ser escrito no registrador endereçado por wadd, 32 bits.
--• r1: barramento de saída para leitura do registrador endereçado por add1.
--• r2: barramento de saída para leitura do registrador endereçado por add2.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity bregMIPS is
	port(
		clk, wreg			: in std_logic;
		add1, add2, wadd	: in std_logic_vector(4 downto 0);
		wdata					: in std_logic_vector(31 downto 0);
		r1,r2					: out std_logic_vector(31 downto 0)
	);
end bregMIPS;

architecture behavioral of bregMIPS is

subtype word_t is std_logic_vector(31 downto 0);
type breg_t is array(0 to 31) of word_t;
signal breg : breg_t;

begin
	
	proc_breg_read:process(clk,add1,add2,wadd)
	begin
	
		if(add1 = "00000") then
			r1 <= X"00000000";
		else
			r1 <= breg(to_integer(unsigned(add1)));
		end if;
		
		if(add2 = "00000") then
			r2 <= X"00000000";
		else
			r2 <= breg(to_integer(unsigned(add2)));
		end if;
	
	end process proc_breg_read;

	proc_breg_write:process(clk)
	begin
		if(clk = '1') then
			if (wreg = '1') then
				breg(to_integer(unsigned(wadd))) <= wdata;
			end if;
		end if;
	end process proc_breg_write;
	
end architecture behavioral;
