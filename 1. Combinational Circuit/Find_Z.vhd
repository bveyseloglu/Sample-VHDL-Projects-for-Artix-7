library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Find_Z is
	Port (  in_z : in STD_LOGIC_VECTOR(3 downto 0);
			out_z : out STD_LOGIC
			);
end Find_Z;

architecture Behavioral of Find_Z is

	begin
	
	with in_z select
	out_z  <= 	'1' when "0000",
				'0' when "0001",
				'1' when "0010",
				'1' when "0011",
				'0' when "0100",
				'0' when "0101",
				'0' when "0110",
				'1' when "0111",
				'0' when "1000",
				'0' when "1001",
				'0' when "1010",
				'0' when "1011",
				'1' when "1100",
				'0' when "1101",
				'1' when "1110",
				'0' when others;
				

end Behavioral;