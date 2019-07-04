----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2018 12:46:33
-- Design Name: 
-- Module Name: translator - Behavioral
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

entity decoder is
    Port ( reg : in STD_LOGIC_VECTOR (7 downto 0);
           out1 : out STD_LOGIC_VECTOR (3 downto 0);
           out2 : out STD_LOGIC_VECTOR (3 downto 0);
           out3 : out STD_LOGIC_VECTOR (3 downto 0);
           out4 : out STD_LOGIC_VECTOR (3 downto 0));
end decoder;

architecture Behavioral of decoder is

begin

    out1 <= "0000" when (reg = "00000001") else -- yukariyi yak
            "1111" when (reg = "10000000") else -- assa
            "0011"; -- sondur
			
	out2 <= "0000" when (reg = "00000010") else
            "1111" when (reg = "01000000") else
            "0011";
           
    out3 <= "0000" when (reg = "00000100") else
            "1111" when (reg = "00100000") else
            "0011"; 
    
    out4 <= "0000" when (reg = "00001000") else
            "1111" when (reg = "00010000") else
            "0011";	


end Behavioral;
