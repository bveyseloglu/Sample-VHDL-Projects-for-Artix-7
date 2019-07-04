library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4x1 is
	Port (  in1 : in STD_LOGIC;
			in2 : in STD_LOGIC;
			in3 : in STD_LOGIC;
			in4 : in STD_LOGIC;
			sel : in STD_LOGIC_VECTOR (1 downto 0);
			out_mux : out STD_LOGIC
			);
end mux_4x1;

architecture Behavioral of mux_4x1 is

	begin

	out_mux <=  in1 when sel = "00" else
				in2 when sel = "01" else
				in3 when sel = "10" else
				in4;

end Behavioral;
