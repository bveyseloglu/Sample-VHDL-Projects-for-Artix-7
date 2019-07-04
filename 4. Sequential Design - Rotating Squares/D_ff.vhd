----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2018 13:40:06
-- Design Name: 
-- Module Name: D_ff - Behavioral
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

entity D_ff is
    Port ( clk : in STD_LOGIC;
           reg : in STD_LOGIC_VECTOR (7 downto 0);
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           out_q : out STD_LOGIC_VECTOR (7 downto 0) 
           );
end D_ff;

architecture Behavioral of D_ff is

begin
    process(clk,reset,enable)
    
    begin
        if (enable='1') then
            if (reset='1' ) then 
                out_q <= "00000001";
            elsif (clk = '1' and clk'event) then
                out_q <= reg;     
            end if;
       
        end if;    
    end process;
    

end Behavioral;
