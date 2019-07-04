library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_converter is
Port ( clk : in STD_LOGIC;
	enable : in STD_LOGIC;
	clk_output : out std_logic
);
end clock_converter;

architecture Behavioral of clock_converter is
signal count : unsigned (31 downto 0) := x"00000000";
begin
process (clk,enable)
begin
    if (clk = '1' and clk'event) then
        if (enable = '0') then
            count <= count;
        elsif (enable = '1') then
                if (count =50000000) then
				clk_output <= '1';
				count <= (others => '0');
				else
                clk_output <= '0';
				count <= count + 1;
                end if ;
        end if ;
    end if;
end process;
--clk_output <= '1' when count=50000000 else
--             '0' ;
             
             

end Behavioral;
