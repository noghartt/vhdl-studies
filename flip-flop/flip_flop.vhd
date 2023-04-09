library IEEE;
use IEEE.std_logic_1164.all;

entity flip_flop is
  port ( d, clk : in std_logic;
         q      : out std_logic );
end flip_flop;

architecture behav of flip_flop is
begin
  process ( clk )
  begin
    if clk'event and clk = '1' then
      q <= d;
    end if;
  end process;
end behav;
