----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2018 12:05:01
-- Design Name: 
-- Module Name: rotator - Behavioral
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

entity rotator is
    Port ( direction : in STD_LOGIC;
           reg : in STD_LOGIC_VECTOR (7 downto 0); -- 0sa sola, 1se saga
           rotator_output : out STD_LOGIC_VECTOR (7 downto 0));
end rotator;

architecture Behavioral of rotator is

begin

    	with direction select
		rotator_output <= 
			reg(0) & reg(7 downto 1)  when '1',
			reg(6 downto 0) & reg(7) when others;

end Behavioral;
