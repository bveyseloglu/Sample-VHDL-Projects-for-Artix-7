library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Find_Y is
	Port (  in_y : in STD_LOGIC_VECTOR(3 downto 0);
			out_y : out STD_LOGIC
			);
end Find_Y;

architecture Behavioral of Find_Y is

	begin
	
	out_y  <= 	'0' when in_y = "0000" else
				'1' when in_y = "0001" else
				'0' when in_y = "0010" else
				'0' when in_y = "0011" else
				'1' when in_y = "0100" else
				'1' when in_y = "0101" else
				'0' when in_y = "0110" else
				'0' when in_y = "0111" else
				'0' when in_y = "1000" else
				'1' when in_y = "1001" else
				'0' when in_y = "1010" else
				'1' when in_y = "1011" else
				'0' when in_y = "1100" else
				'0' when in_y = "1101" else
				'0' when in_y = "1110" else
				'1';
				

end Behavioral;
