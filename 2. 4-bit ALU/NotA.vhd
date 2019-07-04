library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NotA is
	Port (  a1 : in STD_LOGIC_VECTOR(3 downto 0);
			out1: out STD_LOGIC_VECTOR(3 downto 0)
	);
end NotA;

architecture Behavioral of NotA is

	begin
	out1 <= NOT a1;

end Behavioral;