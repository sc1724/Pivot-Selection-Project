----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2021 01:36:27 PM
-- Design Name: 
-- Module Name: fancy_counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fancy_counter is
    Port ( clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           dir : in STD_LOGIC;
           en : in STD_LOGIC;
           ld : in STD_LOGIC;
           rst : in STD_LOGIC;
           updn : in STD_LOGIC;
           val : in STD_LOGIC_VECTOR (3 downto 0);
           cnt : out STD_LOGIC_VECTOR (3 downto 0));
end fancy_counter;

architecture Behavioral of fancy_counter is
    signal direction:STD_LOGIC:='0';
    signal value:STD_LOGIC_VECTOR(3 downto 0):=(others=>'1');
    signal counter:STD_LOGIC_VECTOR(3 downto 0):=(others=>'1');
begin
cnt<=counter;
    process(clk)
    begin
    if(rising_edge(clk)) then
    if (en='1')then
        if(rst='1')then
        counter<=(others=>'0');
        else
        if(clk_en='1')then
            if(updn='1')then
                direction<=dir;
            end if;
            if(ld='1')then
                value<=val;
            end if;
            if(dir='1')then
                if(unsigned(counter)/=unsigned(value))then
                    counter<=std_logic_vector(unsigned(counter) + 1);
                else
                    counter<=(others=>'0');
                end if;
            else
                if(unsigned(counter)/=unsigned(value))then
                    counter<=std_logic_vector(unsigned(counter) - 1);
                else
                    counter<=(others=>'0');
                end if;
            end if;
        end if;
    end if;
    end if;
    end if;
    end process;
end Behavioral;
