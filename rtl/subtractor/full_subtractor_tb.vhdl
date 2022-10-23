library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_subtractor_tb is
end full_subtractor_tb;

architecture fs_tb of full_subtractor_tb is
    component full_subtractor
    port (bin  : in std_logic;
          a    : in std_logic;
          b    : in std_logic;
          diff  : out std_logic;
          bout : out std_logic);
    end component;

    signal input_vect : std_logic_vector(2 downto 0);
    signal diff : std_logic;
    signal bout: std_logic;
begin
    UUT: full_subtractor port map (
            bin  => input_vect(2),
            a    => input_vect(1),
            b    => input_vect(0),
            diff => diff,
            bout => bout
    );

    process begin
        for i in 0 to 7 loop
            input_vect <= std_logic_vector(to_unsigned(i, input_vect'length));
            wait for 100 ns;
        end loop;
        wait;
    end process;
end;