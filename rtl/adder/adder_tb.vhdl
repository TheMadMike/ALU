library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_tb is
end adder_tb;

architecture adder_tb_arch of adder_tb is
    component adder
    port (
        op1 : in std_logic_vector(31 downto 0); -- first operand
        op2 : in std_logic_vector(31 downto 0); -- second operand
        cin : in std_logic; -- carry in
        sum : out std_logic_vector(31 downto 0); -- (op1 + op2) mod N
        cout : out std_logic -- carry out
    );
    end component;

    signal a : std_logic_vector(31 downto 0);
    signal b : std_logic_vector(31 downto 0);
    signal sum : std_logic_vector(31 downto 0);
    signal cout : std_logic;
    signal cin : std_logic;
begin
    UUT: entity work.adder(rca_rtl) port map (
        op1 => a,
        op2 => b,
        sum => sum,
        cout => cout,
        cin => cin
    );


    -- validate rca for the first 3 bits
    process begin
        cin <= '0';
        for i in 0 to 7 loop
            for j in 0 to 7 loop
                a <= std_logic_vector(to_unsigned(i, a'length));
                b <= std_logic_vector(to_unsigned(j, b'length));
                wait for 100 ns;
                assert cout = '0' report "rca: invalid carry out for: " & integer'image(i) & " + " & integer'image(j);
                assert sum = std_logic_vector(to_unsigned(i + j, a'length)) report "rca: invalid sum for: " & integer'image(i) & " + " & integer'image(j);
            end loop;
        end loop;
        wait;
    end process;
end;