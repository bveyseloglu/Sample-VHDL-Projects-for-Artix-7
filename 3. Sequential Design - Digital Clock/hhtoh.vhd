library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hhtoh is
Port (  clk : in STD_LOGIC;
		clock_out : out STD_LOGIC
	 );
end hhtoh;

architecture Behavioral of hhtoh is

	signal artir : unsigned (31 downto 0) := x"00000000";
	signal out_temp : STD_LOGIC;
	
	begin

	artir <= "000";
	out_temp <= '0';
	
	process (clk, artir)
	
	begin

	if (clk = '1' and clk'event) then
		if (artir = "50000000") then
			if (out_temp = '0') then
				out_temp <= '1';
				artir <= (others => '0';)
			else
				out_temp <= '0';
				artir <= (others => '0';)
			end if;
		else
			artir <= artir + 1;
		end if;
	end if;

	end process;
	
	clock_out <= out_temp;
	
end Behavioral;