----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/19/2018 06:34:30 PM
-- Design Name: 
-- Module Name: ff - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ff is
    Port ( item_select : in STD_LOGIC_VECTOR (1 downto 0);
           request : in STD_LOGIC;
           one_tl : in STD_LOGIC;
           take_item : in STD_LOGIC;
           reset_async : in STD_LOGIC;
           clk_1hz : in STD_LOGIC;
           ready_led : out STD_LOGIC;
           current_state : out STD_LOGIC_VECTOR(3 downto 0);
           girilen_para_out : out STD_LOGIC_VECTOR(3 downto 0));
end ff;

architecture Behavioral of ff is

    type state_type is (s0, s1, s2);
    signal state_reg, state_next : state_type;
    
    signal istenen_urun_kaydi : std_logic_vector(1 downto 0);
	
	signal one_tl_butonuna_basildi : std_logic := '0';
    signal girilen_para : unsigned(3 downto 0) := "0000";
    signal count : unsigned (31 downto 0) := (others => '0');
	
    begin
    
        -- state atlamasi yap
        process (state_reg, clk_1hz, reset_async)
        
        begin
            if (reset_async = '1') then
                state_reg <= s0;
            elsif (clk_1hz = '1' and clk_1hz'event) then
                state_reg <= state_next;
            end if;
        end process;
        
-- sonraki state'e karar ver
                process (state_reg, take_item, request, item_select, one_tl)
                
                    
                    
                begin
                if (clk_1hz = '1' and clk_1hz'event) then
                    case state_reg is
                        when s0 =>
                            ready_led <= '0';
                            one_tl_butonuna_basildi <= '0';
                            girilen_para <= "0000";
                            if (request = '1') then
                                istenen_urun_kaydi <= item_select;
                                state_next <= s1;
                            else
                                state_next <= state_reg;
                            end if;
                        when s1 =>
                            if (count < 250000000) then -- burada kullaniciya yaklasik 1-2 sn kadar sure veriyoruz, bu sure boyunca 
                                count <= count + 1;
                                
                                girilen_para_out <= std_logic_vector(girilen_para);
                                
                                if (one_tl_butonuna_basildi = '0' and one_tl = '1') then
                                    one_tl_butonuna_basildi <= '1';
                                    girilen_para <= girilen_para +1; 
                                elsif (one_tl = '0') then
                                    one_tl_butonuna_basildi <= '0';
                                end if;
                            else
                                count <= (others => '0');
                                girilen_para <= "0000";
                                
                                if (item_select = "00" and (girilen_para = 1 or girilen_para > 1)) then
                                    istenen_urun_kaydi <= "00";
                                    state_next <= s2;
                                elsif (item_select = "01" and (girilen_para = 2 or girilen_para > 2)) then
                                    istenen_urun_kaydi <= "01";
                                    state_next <= s2;
                                elsif (item_select = "10" and (girilen_para = 3 or girilen_para > 3)) then
                                    istenen_urun_kaydi <= "10";
                                    state_next <= s2;
                                elsif (item_select = "11" and (girilen_para = 4 or girilen_para > 4)) then
                                    istenen_urun_kaydi <= "11";
                                    state_next <= s2;
                                else
                                    state_next <= s0;
                                end if;
                            end if;
                        

                        when s2 =>
                                ready_led <= '1';    
                            if (take_item = '1') then
                                state_next <= s0;
                            end if;
                        end case;
                        
                        
                end if;
                end process;
        
        -- 7 segment
        process (state_reg)
        
        begin
        
            if (state_reg = s0) then
                  current_state <= "0000";
            elsif (state_reg = s1) then
                  current_state <= "0001";
            elsif (state_reg = s2) then
                  current_state <= "0010";
            end if;
            
         end process;

end Behavioral;
