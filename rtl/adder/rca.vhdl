library ieee;
use ieee.std_logic_1164.all;

-- ripple carry adder
entity rca is
    generic(
        N : positive := 31 -- size of the operands and the result in bits - 1
    );
    port (
        op1 : in std_logic_vector(N downto 0); -- first operand
        op2 : in std_logic_vector(N downto 0); -- second operand
        cin : in std_logic; -- carry in
        sum : out std_logic_vector(N downto 0); -- (op1 + op2) mod N
        cout : out std_logic -- carry out
    );
end rca;

architecture rca_rtl of rca is
    signal carry : std_logic_vector(N downto 0);
begin
    fa0 : entity work.full_adder(full_adder_rtl) port map (
        a => op1(0),
        b => op2(0),
        cin => cin,
        cout => carry(0),
        sum => sum(0)
    );

    generate_fas: for i in 1 to N generate
        fa : entity work.full_adder(full_adder_rtl) port map (
            a => op1(i),
            b => op2(i),
            cin => carry(i - 1),
            cout => carry(i),
            sum => sum(i)
        );
    end generate generate_fas;

    cout <= carry(N);

end rca_rtl;
