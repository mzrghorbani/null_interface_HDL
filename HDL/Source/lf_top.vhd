----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2021 21:37:22
-- Design Name: 
-- Module Name: lf_top - rtl
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

entity lf_top is
port(
    clk : in std_logic;
    we : in std_logic;
    addr : in std_logic_vector(5 downto 0);
    d : in std_logic_vector(63 downto 0);
    q : out std_logic_vector(63 downto 0)
);
end lf_top;

architecture behave of lf_top is
signal s1, s2 : std_logic_vector(63 downto 0);
begin

    lf_mem_fe_i: entity work.lf_mem_fe
        port map (clk=>clk, we=>we, addr=>addr, d=>d, q=>s1);
    
    null_interface_i: entity work.null_interface
        port map (clk=>clk, d=>s1, q=>s2);
        
    lf_mem_be_i: entity work.lf_mem_be
        port map (clk=>clk, we=>we, addr=>addr, d=>s2, q=>q);
end behave; 