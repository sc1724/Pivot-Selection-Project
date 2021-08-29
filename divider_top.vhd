----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2021 08:55:14 PM
-- Design Name: 
-- Module Name: divider_top - Behavioral
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

entity divider_top is
    Port ( clk : in STD_LOGIC;
           led0: inout STD_LOGIC);
end divider_top;

architecture Behavioral of divider_top is
    signal div : STD_LOGIC;
begin
    dff:process(clk)
    begin
    if (div='1')then
        if(rising_edge(clk))then
            led0<=NOT(led0);
        end if;
    end if;
    end process dff;
    part : entity work.clock_div
    port map(clk=>clk, div=>div);
end Behavioral;
