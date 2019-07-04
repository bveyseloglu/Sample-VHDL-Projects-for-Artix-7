library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top is
	Port (  a : in STD_LOGIC;
			b : in STD_LOGIC;
			c : in STD_LOGIC;
			d : in STD_LOGIC;
			s0 : in STD_LOGIC;
			s1 : in STD_LOGIC;
			f : out STD_LOGIC
			);
end Top;

architecture Behavioral of Top is

	signal signal_concatenate : std_logic;
	signal signal_in1 : std_logic;
	signal signal_in2 : std_logic;
	signal signal_in3 : std_logic;
	signal signal_in4 : std_logic;
	signal signal_out_x : std_logic;
	signal signal_out_y : std_logic;
	signal signal_out_z : std_logic;
	signal signal_out_w : std_logic;

	component Find_X
	Port (  a : in STD_LOGIC;
			b : in STD_LOGIC;
			c : in STD_LOGIC;
			d : in STD_LOGIC;
			out_x : out STD_LOGIC
			);
	end component;

	component Find_Y
		Port (  in_y : in STD_LOGIC_VECTOR(3 downto 0);
				out_y : out STD_LOGIC
				);
	end component;

	component Find_Z
		Port (  in_z : in STD_LOGIC_VECTOR(3 downto 0);
				out_z : out STD_LOGIC
				);
	end component;

	component Find_W
	Port (  in_w : in STD_LOGIC_VECTOR(2 downto 0);
			out_w : out STD_LOGIC
			);
	end component;

	component mux_4x1
	Port (  in1 : in STD_LOGIC;
			in2 : in STD_LOGIC;
			in3 : in STD_LOGIC;
			in4 : in STD_LOGIC;
			sel : in STD_LOGIC_VECTOR (1 downto 0);
			out_mux : out STD_LOGIC
			);
	end component;

	begin
	
	signal_in1 <= a;
	signal_in2 <= b;
	signal_in3 <= c;
	signal_in4 <= d;
	
	find_x1: Find_X
	port map (  a => a,
				b => b,
				c => c,
				d => d,
				out_x => signal_out_x
	);
				
	find_y1: Find_Y
	port map (  in_y => signal_in1 & signal_in2 & signal_in3 & signal_in4,
				out_y => signal_out_y
	);
	
	find_z1: Find_Z
	port map (  in_z => signal_in1 & signal_in2 & signal_in3 & signal_in4,
				out_z => signal_out_z
	);
				
	find_w1: Find_W
	port map (  in_w => signal_in1 & signal_in2 & signal_in3,
				out_w => signal_out_w
	);
	
	mux1: mux_4x1
	port map (  in1 => signal_out_x,
				in2 => signal_out_y,
				in3 => signal_out_z,
				in4 => signal_out_w,
				sel => s1 & s0,
				out_mux => f
	);

end Behavioral;