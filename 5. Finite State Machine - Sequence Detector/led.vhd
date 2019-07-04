----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2018 05:15:05 PM
-- Design Name: 
-- Module Name: led - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led is
    Port ( user_input : in STD_LOGIC;
            led_current : in STD_LOGIC_VECTOR (7 downto 0);
            clk : in STD_LOGIC;
           led_next : out STD_LOGIC_VECTOR (7 downto 0));
end led;

architecture Behavioral of led is

begin


process (clk)
begin

    if (clk = '1' and clk'event) then
        led_next <= led_current(6 downto 0) & user_input;
    end if;
    
end process;


end Behavioral;
