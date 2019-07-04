library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Find_X is
	Port (  a : in STD_LOGIC;
			b : in STD_LOGIC;
			c : in STD_LOGIC;
			d : in STD_LOGIC;
			out_x : out STD_LOGIC
			);
end Find_X;

architecture Behavioral of Find_X is

	signal s1 : std_logic;
	signal s2 : std_logic;

	begin
	s1 <= ((a AND b) AND (NOT c)) ;
	s2 <= ((((NOT a) AND (NOT d)) AND c) AND b);
	out_x <= s1 OR s2;

end Behavioral;
