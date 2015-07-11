library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity stageD is
	port(
		clk			: in std_logic;
		InstD 		: in std_logic_vector(31 downto 0);
		PCPlus4D		: in std_logic_vector(31 downto 0);

		ResultW		: in std_logic_vector(31 downto 0); -- wb
		WriteRegW	: in std_logic_vector(4 downto 0); 	-- wb
		RegWriteW	: in std_logic;						  	-- wb
		
		AluOutM		: in std_logic_vector(31 downto 0); -- forward
		ForwardA		: in std_logic_vector(1 downto 0);
		ForwardB		: in std_logic_vector(1 downto 0);
		
		
		RD1			: out std_logic_vector(31 downto 0); -- Reg D\X
		RD2			: out std_logic_vector(31 downto 0);  -- Reg D\X
		
		signImmD		: out std_logic_vector(31 downto 0);  -- Reg D\X
		
		RsD			: out std_logic_vector(4 downto 0);  -- Reg D\X
		RtD			: out std_logic_vector(4 downto 0);  -- Reg D\X
		RdD			: out std_logic_vector(4 downto 0);  -- Reg D\X
		
		equalD		: out std_logic;							 -- Controle
	
		Op				: out std_logic_vector(5 downto 0);   -- Reg D\X
		Funct 		: out std_logic_vector(5 downto 0);   -- Reg D\X
		PCJumpD		: out std_logic_vector(31 downto 0);  -- Fetch
		PCBranchD	: out std_logic_vector(31 downto 0)    -- Fetch
	);
		
end stageD;

architecture behavioral of stageD is

	component bregMIPS
		port(
		clk, wreg			: in std_logic;
		add1, add2, wadd	: in std_logic_vector(4 downto 0);
		wdata					: in std_logic_vector(31 downto 0);
		r1,r2					: out std_logic_vector(31 downto 0)
	);
	end component;
	
	signal RD1sig		: std_logic_vector(31 downto 0);
	signal RD2sig		: std_logic_vector(31 downto 0);
	signal RfD1			: std_logic_vector(31 downto 0);
	signal RfD2			: std_logic_vector(31 downto 0);
	signal rs			: std_logic_vector(4 downto 0);
	signal rt			: std_logic_vector(4 downto 0);
	signal rd			: std_logic_vector(4 downto 0);
	signal signToEx	: std_logic_vector(15 downto 0);
	signal signExtd	: std_logic_vector(31 downto 0);
		
		
begin

	map_breg: bregMIPS	port map(clk, RegWriteW, rs, rt, WriteRegW, RD1sig, RD2sig);
	
	proc : process(clk)
	begin
		RD1		<= RfD1;
		RD2 		<= RfD2;
		Op			<= InstD(31 downto 26);
		Funct		<= InstD(5 downto 0);
		rs			<= InstD(25 downto 21);
		rt			<= InstD(20 downto 16);
		rd			<= InstD(15 downto 11);
		RsD		<= InstD(25 downto 21);
		RtD		<= InstD(20 downto 16);
		RdD		<= InstD(15 downto 11);
		signToEx	<= InstD(15 downto 0);

		case ForwardA is
			when "00" => RfD1 <= RD1sig;
			when "01" => RfD1 <= AluOutM;
			when "10" => RfD1 <= ResultW;
			when others => null;
		end case;
		
		case ForwardB is
			when "00" => RfD2 <= RD2sig;
			when "01" => RfD2 <= AluOutM;
			when "10" => RfD2 <= ResultW;
			when others => null;
		end case;
		
		if signToEx(15) = '1' then
			signExtd <= X"ffff"&signToEx;
		else
			signExtd <= X"0000"&signToEx;
		end if;
		
		signImmD <= signExtd;
		
		if (RfD1 xor RfD2) = X"00000000" then
			equalD <= '1';
		else
			equalD <= '0';
		end if;

		PCBranchD 	<= PCPlus4D + (to_stdlogicvector( to_bitvector(signExtd) sll 2 ));
		PCJumpD		<= PCPlus4D(31 downto 28) & InstD(25 downto 0) & "00" ;
	end process proc;

end architecture behavioral;
