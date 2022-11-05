library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb is
end alu_tb;

architecture alu_tb_arch of alu_tb is
    component alu
    port (
        clk       : in std_logic; -- clock input
        operation : in std_logic_vector(3 downto 0); -- op. type
        op_a      : in std_logic_vector(31 downto 0); -- the first operand
        op_b      : in std_logic_vector(31 downto 0); -- the second operand
        cin       : in std_logic; -- carry/borrow input
        result    : out std_logic_vector(31 downto 0);
        cout      : out std_logic -- carry/borrow output
    );
    end component;

    signal a : std_logic_vector(31 downto 0);
    signal b : std_logic_vector(31 downto 0);
    signal result : std_logic_vector(31 downto 0);
    signal operation : std_logic_vector(3 downto 0);
    signal cout : std_logic;
    signal cin : std_logic;
    signal clk : std_logic := '0';
begin
    UUT: alu port map (
        op_a => a,
        op_b => b,
        operation => operation,
        result => result,
        cout => cout,
        cin => cin,
        clk => clk
    );

    clk <= not clk after 100 ns;

    -- test sample operations
    process begin
        cin <= '0';
        a <= x"00_FF_FF_FF";
        b <= x"00_00_00_81";
        operation <= b"0000"; -- xor
        wait for 200 ns;
        
        operation <= b"0011"; -- add
        
        wait for 200 ns;

        operation <= b"0100"; -- subtract

        wait for 200 ns;

        wait;
    end process;
end;