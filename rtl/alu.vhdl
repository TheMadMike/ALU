library ieee;
use ieee.std_logic_1164.all;

-- arithmetic logic unit (top level module)

entity alu is
    generic (
        N : positive := 31
    );
    port (
        clk       : in std_logic; -- clock input
        operation : in std_logic_vector(3 downto 0); -- op. type
        op_a      : in std_logic_vector(N downto 0); -- the first operand
        op_b      : in std_logic_vector(N downto 0); -- the second operand
        cin       : in std_logic; -- carry/borrow input
        result    : out std_logic_vector(N downto 0);
        cout      : out std_logic -- carry/borrow output
    );
end alu;

architecture alu_rtl of alu is
    signal sum : std_logic_vector(N downto 0);
    signal adder_cout : std_logic;
    signal diff : std_logic_vector(N downto 0);
    signal sub_bout : std_logic;
begin

    adder : entity work.adder(rca_rtl) port map (
        op1 => op_a,
        op2 => op_b,
        cin => cin,
        cout => adder_cout,
        sum => sum
    );

    subtractor : entity work.rbs(rbs_rtl) port map (
        op1 => op_a,
        op2 => op_b,
        bin => cin,
        bout => sub_bout,
        diff => diff
    );

    process (clk) begin
        if rising_edge(clk) then
            case operation is
                when "0000" => -- xor
                    cout <= '0';
                    result <= op_a xor op_b;
                when "0001" => -- or
                    cout <= '0';
                    result <= op_a or op_b;
                when "0010" => -- and
                    cout <= '0';
                    result <= op_a and op_b;
                when "0011" => -- add
                    cout <= adder_cout;
                    result <= sum;
                when "0100" => -- subtract
                    cout <= sub_bout;
                    result <= diff;
                when others => -- others to be implemented
                    cout <= '0';
                    result <= (others => '0'); 
            end case;
        end if;
    end process;

end alu_rtl;