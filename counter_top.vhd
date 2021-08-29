----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2021 03:54:18 PM
-- Design Name: 
-- Module Name: counter_top - Behavioral
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

entity counter_top is
    Port ( btn : in STD_LOGIC_VECTOR (3 downto 0):=(1=>'1',3=>'1',others=>'0');
           clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (3 downto 0):=(others=>'1');
           led : out STD_LOGIC_VECTOR (3 downto 0):=(others=>'1'));
end counter_top;

architecture Behavioral of counter_top is
    signal en,clk_en,ld,rst,updn:STD_LOGIC;
begin
u1 : entity work.debounce
port map(clk=>clk, btn=>btn(0), dbnc=>rst);
u2 : entity work.debounce
port map(clk=>clk, btn=>btn(1), dbnc=>en);
u3 : entity work.debounce
port map(clk=>clk, btn=>btn(2), dbnc=>updn);
u4 : entity work.debounce
port map(clk=>clk, btn=>btn(3), dbnc=>ld);
u5 : entity work.clock_div
port map(clk=>clk, div=>clk_en);
u6 : entity work.fancy_counter
port map(clk=>clk, 
        clk_en=>clk_en, 
        dir=>sw(0), 
        en=>en, 
        ld=>ld, 
        rst=>rst, 
        updn=>updn, 
        val=>sw, 
        cnt=>led);
end Behavioral;
