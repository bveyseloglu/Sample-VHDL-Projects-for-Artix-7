library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bit_or is
	Port (  a1 : in STD_LOGIC_VECTOR(3 downto 0);
			a2 : in STD_LOGIC_VECTOR(3 downto 0);
			out1: out STD_LOGIC_VECTOR(3 downto 0)
	);
end four_bit_or;

architecture Behavioral of four_bit_or is

	begin
	out1 <= a1 OR a2;

end Behavioral;