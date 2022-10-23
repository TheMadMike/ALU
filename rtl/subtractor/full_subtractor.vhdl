library ieee;
use ieee.std_logic_1164.all;

entity full_subtractor is
    port (
        bin : in std_logic; -- borrow in
        a   : in std_logic; -- first operand
        b   : in std_logic; -- second operand
        diff : out std_logic; -- a - b
        bout : out std_logic -- borrow out
    );
end full_subtractor;

architecture full_subtractor_rtl of full_subtractor is
    signal partial_diff : std_logic;
begin
    partial_diff <= (a xor b);
    diff <= partial_diff xor bin;
    bout <= ((not partial_diff) and bin) or ((not a) and b);
end full_subtractor_rtl;
