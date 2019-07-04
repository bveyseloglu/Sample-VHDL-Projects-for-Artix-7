----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:21:22 02/14/2009 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( clk : in  STD_LOGIC;
			reset : in  STD_LOGIC;
			enable : in  STD_LOGIC;
			up_down : in  STD_LOGIC;
			upperlimit : in STD_LOGIC_VECTOR(3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (7 downto 0);
           seg_sel : out  STD_LOGIC_VECTOR (7 downto 0)
		 );
end top;

architecture Behavioral of top is

	component seven_four
	Port ( in1 : in  STD_LOGIC_VECTOR (3 downto 0);
			   in2 : in  STD_LOGIC_VECTOR (3 downto 0);
			   in3 : in  STD_LOGIC_VECTOR (3 downto 0);
			   in4 : in  STD_LOGIC_VECTOR (3 downto 0);
			   clk : in  STD_LOGIC;
				  dp  : out  STD_LOGIC;
			   sel : out  STD_LOGIC_VECTOR (3 downto 0);
			   segment : out  STD_LOGIC_VECTOR (6 downto 0)
				);
	end component;

	component clock_counter
	Port (  clk : in STD_LOGIC;
			rst : in STD_LOGIC;
			up_down : in STD_LOGIC;
			enable : in STD_LOGIC;
			upperlimit : in STD_LOGIC_VECTOR (3 downto 0);
			enable_out : out STD_LOGIC;
			result : out STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component hhtoh
	Port (  clk : in STD_LOGIC;
			clock_out : out STD_LOGIC
		 );
	end component;

	signal en1, en2, en3, en_volatile, clk_1hz, w4 : STD_LOGIC;
	signal w5 : STD_LOGIC_VECTOR (6 downto 0);
	signal res1, res2, res3, res4 :  STD_LOGIC_VECTOR (3 downto 0);
	signal seg_sel_4 : STD_LOGIC_VECTOR (3 downto 0);

begin

	one_hz : hhtoh port map (clk, clk_1hz);
	
	sec_1 : clock_counter port map (clk_1hz, reset, up_down, enable, "1010", en1, res1);
	sec_10 : clock_counter port map (clk_1hz, reset, up_down, en1, "0110", en2, res2);
	min_1 : clock_counter port map (clk_1hz, reset, up_down, en2, "1010", en3, res3);
	min_10 : clock_counter port map (clk_1hz, reset, up_down, en3, "0110", en_volatile, res4);
	
	A2 : seven_four port map (res1, res2, res3, res4, clk, w4, seg_sel_4, w5);
	seg_out <= (w5 & w4);
	seg_sel <= "1111" & seg_sel_4;
	
end Behavioral;

