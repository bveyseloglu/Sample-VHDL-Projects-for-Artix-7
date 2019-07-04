library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_counter is
Port (  clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		up_down : in STD_LOGIC;
		enable : in STD_LOGIC;
		upperlimit : in STD_LOGIC_VECTOR (3 downto 0);
		enable_out : out STD_LOGIC;
		result : out STD_LOGIC_VECTOR (3 downto 0));
end clock_counter;

architecture Behavioral of clock_counter is

	signal count : unsigned (3 downto 0);
	signal en : STD_LOGIC;
	
	begin

	count <= "0000";
	
	process (clk, rst, enable, up_down, en, upperlimit)
	begin

	if (clk = '1' and clk'event) then
		if (rst = '1') then
			count <= (others => '0');
		elsif (enable = '1') then
			if (up_down = '1') then
				if (count = unsigned(upperlimit)) then
					count <= "0000";
					en <= '1';
				else
					count <= count + 1;
					en <= '0';
				end if;
			else
				if (count = "0000") then
					en <= '1';
					count <= unsigned(upperlimit);
				else
					count <= count - 1;
					en <= '0';
				end if;
			end if;
		end if;
	end if;

	end process;
	
	enable_out <= en;
	result <= STD_LOGIC_VECTOR(count);
	
end Behavioral;