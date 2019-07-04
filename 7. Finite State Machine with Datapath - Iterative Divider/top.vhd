----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/25/2018 06:13:13 PM
-- Design Name: 
-- Module Name: top - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
		generic(
		W: integer:=8;
		CBIT: integer:=4 --CBIT=log2(W)+1
		);
        Port (  clk, reset_async, start, finish : in STD_LOGIC;
                divisor: in std_logic_vector(W-1 downto 0);
                dividend: in std_logic_vector(W-1 downto 0);
                ready, done_led : out STD_LOGIC;
                current_state_led : out std_logic_vector(3 downto 0);
                seg_out : out  STD_LOGIC_VECTOR (7 downto 0);
                seg_sel : out  STD_LOGIC_VECTOR (7 downto 0)         
        );
end top;

architecture Behavioral of top is

	component fsmd
		generic(
			W: integer:=8;
			CBIT: integer:=4 --CBIT=log2(W)+1
		);
		port(
			clk, reset: in std_logic;
			start, finish: in std_logic;
			dvsr, dvnd: in std_logic_vector(W-1 downto 0);
			ready, done_tick: out std_logic;
			state_indicator_led : out std_logic_vector(3 downto 0);
			quo, rmd: out std_logic_vector(W-1 downto 0)
		);
	end component;

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

    component binary_bcd
        generic(N: positive := 6);
        port(
        clk, reset: in std_logic;
        binary_in: in std_logic_vector(N-1 downto 0);
        -- bcd0, bcd1, bcd2, bcd3, bcd4: out std_logic_vector(3 downto 0)
        bcd0, bcd1: out std_logic_vector(3 downto 0)
        );
    end component ;

    signal w4 : STD_LOGIC;
    signal w5 : STD_LOGIC_VECTOR (6 downto 0);
    signal seg_sel_4 : STD_LOGIC_VECTOR (3 downto 0);
    signal quotient_disp: std_logic_vector(7 downto 0);  
    signal  remainder_disp : std_logic_vector(7 downto 0);  
    signal bcd0, bcd1, bcd2, bcd3  : STD_LOGIC_VECTOR (3 downto 0);

    signal reminder_disp_bcd : STD_LOGIC_VECTOR (5 downto 0);
    signal quotient_disp_bcd : STD_LOGIC_VECTOR (5 downto 0);
	
begin

    reminder_disp_bcd <= remainder_disp(5 downto 0);
    quotient_disp_bcd <= quotient_disp(5 downto 0);

    fsmd_0 : fsmd port map(clk, reset_async, start, finish, std_logic_vector(divisor), std_logic_vector(dividend), ready, done_led, current_state_led, quotient_disp, remainder_disp);
    seven_four_0 : seven_four port map( bcd0, bcd1, bcd2, bcd3, clk, w4, seg_sel_4, w5);
    bcd_0 : binary_bcd port map(clk, reset_async, reminder_disp_bcd ,bcd0, bcd1 );
    bcd_1 : binary_bcd port map(clk, reset_async, quotient_disp_bcd,bcd2, bcd3 );
    

    seg_out <= (w5 & w4);
    seg_sel <= "1111" & seg_sel_4;

end Behavioral;
