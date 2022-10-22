library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port (
        cin : in std_logic; -- carry in
        a   : in std_logic; -- first operand
        b   : in std_logic; -- second operand
        sum : out std_logic; -- a + b
        cout: out std_logic -- carry out
    );
end full_adder;

architecture full_adder_rtl of full_adder is
    signal partial_sum : std_logic;
begin
    partial_sum <= a xor b;
    sum <= partial_sum xor cin;
    cout <= (partial_sum and cin) or (a and b);
end full_adder_rtl;
