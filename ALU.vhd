library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mipsalu is
port (
    a : in std_logic_vector ( 31 downto 0 );
    b : in std_logic_vector ( 31 downto 0 );
    aluctl : in std_logic_vector ( 3 downto 0 );
    aluout : out std_logic_vector( 31 downto 0 );
    z : out std_logic
);
end mipsalu;

architecture Behavioral of mipsalu is
signal reg_a : signed( 31 downto 0 ) := (others => '0'); -- signals to hold values of input.
signal reg_b : signed( 31 downto 0 ) := (others => '0');
signal reg_res : signed( 31 downto 0 ) := (others => '0');
begin
    reg_a <= signed(a); -- Must convert inputs into signed.
    reg_b <= signed(b);
    aluout <= std_logic_vector(reg_res); -- output the result.
    process(reg_a, reg_b, aluctl) is -- Run the following process if A, B or operation changes.
    begin
        case aluctl is
            when "0000" =>
                reg_res <= reg_a and reg_b;
            when "0001" =>
                reg_res <= reg_a or reg_b;
            when "0010" =>
                reg_res <= reg_a + reg_b;
            when "0011" =>
                reg_res <= reg_a - reg_b;
            when "0100" =>
                if (a < b) then
                    reg_res <= to_signed(1,reg_res'length); -- output HIGH
                else
                    reg_res <= to_signed(0,reg_res'length); -- output LOW
                end if;
            when "0101" =>
                reg_res <= shift_left(reg_b, 16); -- shifting left for lui.
            when others =>
                reg_res <= to_signed(0,reg_res'length);
        end case;   
    end process;
    z <= '1' when reg_res = 0 -- set zero flag to HIGH whenever output is 0.
        else '0';
end Behavioral;