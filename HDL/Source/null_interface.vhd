----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2021 11:46:34
-- Design Name: 
-- Module Name: null_interface - rtl
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.Std_Logic_Arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
entity null_interface is
  Port ( 
    clk : in std_logic;
    d : in std_logic_vector(63 downto 0);
    q : out std_logic_vector(63 downto 0)
    );
end null_interface;

architecture behave of null_interface is
signal temp : std_logic_vector(63 downto 0);
begin
    proc : process(clk)
    begin
        if clk'event and clk = '1' then
            temp <= d + 5;
        end if;     
    end process;
    q <= temp;
end behave;
