----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2018 13:01:28
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
Port (  clk : in STD_LOGIC;
		enable : in STD_LOGIC;
		direction : in STD_LOGIC;
		reset : in STD_LOGIC;
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

component D_ff 
    Port ( clk : in STD_LOGIC;
           reg : in STD_LOGIC_VECTOR (7 downto 0);
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           out_q : out STD_LOGIC_VECTOR (7 downto 0) 
           );
end component;

component decoder
    Port ( reg : in STD_LOGIC_VECTOR (7 downto 0);
           out1 : out STD_LOGIC_VECTOR (3 downto 0);
           out2 : out STD_LOGIC_VECTOR (3 downto 0);
           out3 : out STD_LOGIC_VECTOR (3 downto 0);
           out4 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component rotator 
    Port ( direction : in STD_LOGIC;
           reg : in STD_LOGIC_VECTOR (7 downto 0); -- 0sa sola, 1se saga
           rotator_output : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component clock_converter
Port ( clk : in STD_LOGIC;
	enable : in STD_LOGIC; -- ucfde baglamana gerek yok
	clk_output : out std_logic
);
end component;

    signal clock_convertor_output : STD_LOGIC;
    signal reg_out :  STD_LOGIC_VECTOR (7 downto 0);
    signal decoder_out_1, decoder_out_2, decoder_out_3, decoder_out_4 :  STD_LOGIC_VECTOR (3 downto 0);
    signal seg_sel_4 : STD_LOGIC_VECTOR (3 downto 0);
    signal w4 : STD_LOGIC;
    signal w5 : STD_LOGIC_VECTOR (6 downto 0);
	signal reg_in : STD_LOGIC_VECTOR (7 downto 0);
	
begin

    cc : clock_converter port map (clk, '1', clock_convertor_output); 
    --state_ff : ff port map (clock_convertor_output, enable, direction, reset, reg_out);
    decoder_a : decoder port map (reg_out, decoder_out_1, decoder_out_2, decoder_out_3, decoder_out_4);
    display : seven_four port map (decoder_out_1, decoder_out_2, decoder_out_3, decoder_out_4, clk, w4, seg_sel_4, w5);
	Drotator : rotator port map (direction, reg_out, reg_in);
    Dflipflop : D_ff port map (clock_convertor_output, reg_in, enable, reset, reg_out);
    
    seg_out <= (w5 & w4);
    seg_sel <= "1111" & seg_sel_4;

end Behavioral;
