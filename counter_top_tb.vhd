----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2021 10:02:13 PM
-- Design Name: 
-- Module Name: counter_top_tb - Behavioral
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

entity counter_top_tb is
--  Port ( );
end counter_top_tb;

architecture Behavioral of counter_top_tb is
signal tb_clk:std_logic:='0';
signal tb_sw:STD_LOGIC_VECTOR (3 downto 0);
signal tb_btn:STD_LOGIC_VECTOR (3 downto 0);
signal tb_led:STD_LOGIC_VECTOR (3 downto 0);
component counter_top is
port(
clk: in STD_LOGIC;
sw: in STD_LOGIC_VECTOR (3 downto 0);
btn: in STD_LOGIC_VECTOR (3 downto 0);
led: out STD_LOGIC_VECTOR (3 downto 0));
end component;

begin
clk_gen_proc: process
begin
wait for 4 ns;
tb_clk<='1';
wait for 4 ns;
tb_clk<='0';
end process clk_gen_proc;
bruh: process
begin
wait for 1 ns;
tb_sw(0)<='1';
tb_sw(1)<='1';
tb_sw(2)<='1';
tb_sw(3)<='1';
tb_btn(1)<='1';
tb_btn(3)<='1';
wait for 200 ms;

end process bruh;
dut:counter_top
port map(
clk=>tb_clk,
sw=>tb_sw,
led=>tb_led,
btn=>tb_btn
);
end Behavioral;
