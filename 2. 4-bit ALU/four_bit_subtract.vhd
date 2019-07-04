----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:06:41 02/13/2009 
-- Design Name: 
-- Module Name:    four_bit_adder - Behavioral 
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

entity four_bit_subtract is
    Port ( a1 : in  STD_LOGIC_VECTOR (3 downto 0);
           a2 : in  STD_LOGIC_VECTOR (3 downto 0);
           out1 : out  STD_LOGIC_VECTOR (3 downto 0)
         );
end four_bit_subtract;

architecture Behavioral of four_bit_subtract is

component full_adder
	 Port ( in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sout : out  STD_LOGIC
			  );
end component;

	component increment
	Port ( 	a1 : in STD_LOGIC_VECTOR(3 downto 0); 
			carry: out STD_LOGIC;
			out1 : out STD_LOGIC_VECTOR(3 downto 0)
			);
	end component;

signal w1,w2,w3 : STD_LOGIC; 
signal cout : STD_LOGIC;
signal terslenmis : STD_LOGIC_VECTOR(3 downto 0);
signal incremented : STD_LOGIC_VECTOR(3 downto 0);
signal onemsiz : STD_LOGIC;

begin

terslenmis <= NOT a2;

INC : increment port map(terslenmis, onemsiz , incremented);

U1 : full_adder port map(a1(0), incremented(0), '0', w1, out1(0));
U2 : full_adder port map(a1(1), incremented(1), w1, w2, out1(1));
U3 : full_adder port map(a1(2), incremented(2), w2, w3, out1(2));
U4 : full_adder port map(a1(3), incremented(3), w3, cout, out1(3));

end Behavioral;

