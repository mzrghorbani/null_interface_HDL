----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2021 21:40:21
-- Design Name: 
-- Module Name: lf_mem_fe - rtl
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

entity lf_mem_fe is
port(
    clk: in std_logic;
    we : in std_logic;
    addr : in std_logic_vector(5 downto 0);
    d : in std_logic_vector(63 downto 0);
    q : out std_logic_vector(63 downto 0)
);
end lf_mem_fe;

architecture behave of lf_mem_fe is
type ram_type is array (0 to 15) of std_logic_vector (63 downto 0);
signal ram_single_port : ram_type;
begin
process(clk)
begin 
    if (clk'event and clk='1') then
    if (we='1') then
    ram_single_port(to_integer(unsigned(addr))) <= d;
    end if;
    end if;
end process;
q<=ram_single_port(to_integer(unsigned(addr)));
end behave;
