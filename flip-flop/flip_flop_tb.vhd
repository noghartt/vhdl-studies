library IEEE;
use IEEE.std_logic_1164.all;

entity flip_flop_tb is
end flip_flop_tb;

architecture behav of flip_flop_tb is
  component flip_flop
    port ( d, clk : in std_logic; q : out std_logic );
  end component;

  for flip_flop_0: flip_flop use entity work.flip_flop;
  signal d, clk, q : std_logic;

  begin
    flip_flop_0:
    flip_flop port map (d => d, clk => clk,
                        q => q);

    process
      type pattern_type is record
        d, clk : std_logic;
        q      : std_logic;
      end record;

      type pattern_array is array (natural range <>) of pattern_type;
      constant patterns : pattern_array :=
        (('0', '1', '0'),
         ('1', '1', '0'),
         ('0', '0', '0'));

    begin
      for i in patterns'range loop
        d   <= patterns(i).d;
        clk <= patterns(i).clk;
        q   <= patterns(i).q;
        report
          "Input (d): "
          & std_logic'image(d)
          & ", clock (clk): " & std_logic'image(clk)
          & ", outoput (q): " & std_logic'image(q);
        wait for 1 ns;
      end loop;
      assert false
        report "end of test" severity note;
    wait;
  end process;
end behav;
