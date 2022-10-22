library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder_tb is
end full_adder_tb;

architecture fa_tb of full_adder_tb is
    component full_adder
    port (cin  : in std_logic;
          a    : in std_logic;
          b    : in std_logic;
          sum  : out std_logic;
          cout : out std_logic);
    end component;

    signal input_vect : std_logic_vector(2 downto 0);
    signal sum : std_logic;
    signal cout: std_logic;
begin
    UUT: full_adder port map (
            cin  => input_vect(2),
            a    => input_vect(1),
            b    => input_vect(0),
            sum  => Sum,
            cout => cout
    );


    process begin
        for i in 0 to 7 loop
            input_vect <= std_logic_vector(to_unsigned(i, input_vect'length));
            wait for 100 ns;
        end loop;
        wait;
    end process;
end;