----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2018 05:33:28 PM
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( clk : in STD_LOGIC;
	       enable : in STD_LOGIC;
		   reset : in STD_LOGIC;
           input : in STD_LOGIC;
           led_next : out STD_LOGIC_VECTOR (7 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (7 downto 0);
           seg_sel : out  STD_LOGIC_VECTOR (7 downto 0)
	);
end top;

architecture Behavioral of top is

    component led
        Port ( user_input : in STD_LOGIC;
                led_current : in STD_LOGIC_VECTOR (7 downto 0);
                clk : in STD_LOGIC;
               led_next : out STD_LOGIC_VECTOR (7 downto 0));
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
    
    component ff
    Port (  clk : in STD_LOGIC;
            enable : in STD_LOGIC;
            reset : in STD_LOGIC;
            input : in STD_LOGIC;
            pattern_found_prev : in unsigned(5 downto 0);
            current_state : out STD_LOGIC_VECTOR(3 downto 0);
            pattern_found : out unsigned(5 downto 0)
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
    
    component clock_converter
    Port ( clk : in STD_LOGIC;
        enable : in STD_LOGIC;
        clk_output : out std_logic
    );
    end component;

    signal clock_output : STD_LOGIC;
    signal current_state_indicator :  STD_LOGIC_VECTOR(3 downto 0);
    signal out_ff_1 : STD_LOGIC_VECTOR(5 downto 0);
    signal toplam_bulunan : unsigned(5 downto 0);
    signal led_signal : STD_LOGIC_VECTOR (7 downto 0);
    signal bcd_0, bcd_1: std_logic_vector(3 downto 0);

    signal w4 : STD_LOGIC;
    signal w5 : STD_LOGIC_VECTOR (6 downto 0);
    signal seg_sel_4 : STD_LOGIC_VECTOR (3 downto 0);
    
begin

    clock_convert : clock_converter port map (clk, enable, clock_output);
    ff_1 : ff port map(clock_output, enable, reset, input, toplam_bulunan, current_state_indicator, toplam_bulunan);
    led_1 : led port map (input, led_signal, clock_output, led_signal);
    bcd : binary_bcd port map (clk, reset, STD_LOGIC_VECTOR(toplam_bulunan), bcd_0, bcd_1);
    seven_seg : seven_four port map (bcd_0, bcd_1, current_state_indicator, "0101", clk , w4, seg_sel_4, w5);

	led_next <= led_signal;

    seg_out <= (w5 & w4);
    seg_sel <= "1111" & seg_sel_4;

end Behavioral;
