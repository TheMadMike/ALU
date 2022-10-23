library ieee;
use ieee.std_logic_1164.all;

-- ripple borrow subtractor
entity rbs is
    generic(
        N : positive := 31 -- size of the operands and the result in bits - 1
    );
    port (
        op1 : in std_logic_vector(N downto 0); -- first operand
        op2 : in std_logic_vector(N downto 0); -- second operand
        bin : in std_logic; -- borrow in
        diff : out std_logic_vector(N downto 0); -- (op1 - op2) mod N
        bout : out std_logic -- borrow out
    );
end rbs;

architecture rbs_rtl of rbs is
    signal borrow : std_logic_vector(N downto 0);
begin
    fs0 : entity work.full_subtractor(full_subtractor_rtl) port map (
        a => op1(0),
        b => op2(0),
        bin => bin,
        bout => borrow(0),
        diff => diff(0)
    );

    generate_fss: for i in 1 to N generate
        fs : entity work.full_subtractor(full_subtractor_rtl) port map (
            a => op1(i),
            b => op2(i),
            bin => borrow(i - 1),
            bout => borrow(i),
            diff => diff(i)
        );
    end generate generate_fss;

    bout <= borrow(N);

end rbs_rtl;