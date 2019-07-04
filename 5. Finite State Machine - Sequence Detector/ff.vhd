library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ff is
Port (  clk : in STD_LOGIC;
		enable : in STD_LOGIC;
		reset : in STD_LOGIC;
		input : in STD_LOGIC;
		pattern_found_prev : in unsigned(5 downto 0);
		current_state : out STD_LOGIC_VECTOR(3 downto 0);
		pattern_found : out unsigned(5 downto 0)
	 );
end ff;

architecture Behavioral of ff is

    type state_type is (s0, s1, s2, s3, s4);
    signal state_reg, state_next : state_type;
	
	begin

    
	-- state atlamasi yap
	process (state_reg, clk, enable, reset)
	
	begin

    if (reset = '1') then
        state_reg <= s0;
	elsif (clk = '1' and clk'event) then
	   if (enable = '1') then
            state_reg <= state_next;
        else
            state_reg <= state_reg;
        end if;
	end if;

	end process;
	
	-- sonraki state e karar ver	
    process (state_reg, clk, enable, reset, input)
    
    begin

    if (enable = '1') then
        if (state_reg = s0 and input = '0') then
            state_next <= s0;
        elsif (state_reg = s0 and input = '1') then
            state_next <= s1;
			
		elsif (state_reg = s1 and input = '0') then
            state_next <= s0;
		elsif (state_reg = s1 and input = '1') then
            state_next <= s2;
			
		elsif (state_reg = s2 and input = '0') then
            state_next <= s3;
		elsif (state_reg = s2 and input = '1') then
            state_next <= s2;

		elsif (state_reg = s3 and input = '0') then
            state_next <= s0;
		elsif (state_reg = s3 and input = '1') then
            state_next <= s4;
			
		elsif (state_reg = s4 and input = '0') then
            state_next <= s0;
		elsif (state_reg = s4 and input = '1') then
            state_next <= s2;
        
        end if;
    else
		state_next <= state_reg;
    end if;

    end process;
	
	
	-- regi ayarla
	process (state_reg)
	
	begin
	
	if (clk = '1' and clk'event) then
		if (state_reg = s0) then
			  pattern_found <= pattern_found_prev;
			  current_state <= "0000";
		elsif (state_reg = s1) then
			  pattern_found <= pattern_found_prev;
			  current_state <= "0001";
		elsif (state_reg = s2) then
			  pattern_found <= pattern_found_prev;
			  current_state <= "0010";
		elsif (state_reg = s3) then
			if (input = '1') then
            pattern_found <= pattern_found_prev + 1;
			end if;
			  current_state <= "0011";
		elsif (state_reg = s4) then
			  pattern_found <= pattern_found_prev ;
			  current_state <= "0100";
		end if;
	end if;

	end process;
	
	
	
	
end Behavioral;