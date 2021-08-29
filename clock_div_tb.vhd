----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2021 09:42:18 PM
-- Design Name: 
-- Module Name: clock_div_tb - Behavioral
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

entity clock_div_tb is
--  Port ( );
end clock_div_tb;

architecture Behavioral of clock_div_tb is
    signal tb_clk: std_logic :='0';
    signal tb_div : std_logic := '0';
    component clock_div is
        port(
            clk: in std_logic;
            div: out std_logic
        );
    end component;
begin
    clk_gen_proc: process
    begin
    for iter in 0 to 125000000 loop
    wait for 4 ns;
    tb_clk<='1';
    wait for 4 ns;
    tb_clk<='0';
    end loop;
    end process clk_gen_proc;
    dut : clock_div
    port map(
        clk=>tb_clk,
        div=>tb_div
    );
end Behavioral;
