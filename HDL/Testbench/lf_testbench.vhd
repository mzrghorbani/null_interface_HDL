----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2021 11:49:47
-- Design Name: 
-- Module Name: Testbench - rtl
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
USE ieee.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.Std_Logic_Arith.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lf_testbench is
--  Port ( );
end lf_testbench;

architecture behave of lf_testbench is
constant T : time := 25 ns; 
signal clk : std_logic;
signal we : std_logic;
signal addr : std_logic_vector(5 downto 0);
signal d : std_logic_vector(63 downto 0);
signal q : std_logic_vector(63 downto 0);

begin

lf_top_i : entity work.lf_top
    port map(clk => clk, we=>we, addr=>addr, d => d, q => q);

clk_proc: process 
begin
    clk <= '1';
    wait for T/2;
    clk <= '0';
    wait for T/2;
end process;

stimu_proc: process 
    begin
        we <= '1';
        for i in 0 to 15 loop         
        addr <= std_logic_vector(to_unsigned(i, addr'length));  
        d(63 downto 6) <= (others => '0');
        d(5 downto 0)  <= addr;
        wait for T; 
    end loop;  
    wait;
end process;
end behave;
