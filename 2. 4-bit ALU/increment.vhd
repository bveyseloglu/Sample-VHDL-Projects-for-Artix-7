----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:06:41 02/13/2009 
-- Design Name: 
-- Module Name:    increment - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity increment is
    Port ( a1 : in  STD_LOGIC_VECTOR (3 downto 0);
				carry : out  STD_LOGIC;
           out1 : out  STD_LOGIC_VECTOR (3 downto 0)
           
			  );
end increment;

architecture Behavioral of increment is

component full_adder
	 Port ( in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sout : out  STD_LOGIC
			 );
end component;

signal w1,w2,w3 : STD_LOGIC; 
signal in2 : STD_LOGIC_VECTOR (3 downto 0);

begin
in2 <= "0001";
U1 : full_adder port map(a1(0), in2(0), '0', w1, out1(0));
U2 : full_adder port map(a1(1), in2(1), w1, w2, out1(1));
U3 : full_adder port map(a1(2), in2(2), w2, w3, out1(2));
U4 : full_adder port map(a1(3), in2(3), w3, carry, out1(3));

end Behavioral;

