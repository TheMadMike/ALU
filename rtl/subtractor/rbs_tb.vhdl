library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rbs_tb is
end rbs_tb;

architecture rbs_tb_arch of rbs_tb is
    component rbs
    port (
        op1 : in std_logic_vector(31 downto 0); -- first operand
        op2 : in std_logic_vector(31 downto 0); -- second operand
        bin : in std_logic; -- borrow in
        diff : out std_logic_vector(31 downto 0); -- (op1 - op2) mod N
        bout : out std_logic -- borrow out
    );
    end component;

    signal a : std_logic_vector(31 downto 0);
    signal b : std_logic_vector(31 downto 0);
    signal diff : std_logic_vector(31 downto 0);
    signal bout : std_logic;
    signal bin : std_logic;
begin
    UUT: rbs port map (
        op1 => a,
        op2 => b,
        diff => diff,
        bout => bout,
        bin => bin
    );

    -- validate rbs for the first few bits
    process begin
        bin <= '0';
        for i in 7 to 15 loop
            for j in 0 to 7 loop
                a <= std_logic_vector(to_unsigned(i, a'length));
                b <= std_logic_vector(to_unsigned(j, b'length));
                wait for 100 ns;
                assert diff = std_logic_vector(to_unsigned(i - j, a'length)) report "rca: invalid difference for: " & integer'image(i) & " + " & integer'image(j);
            end loop;
        end loop;
        wait;
    end process;
end;