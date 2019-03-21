library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.ALL;

entity ALUControl is 
port(
    funct: in std_logic_vector(5 downto 0);
    aluOp: in std_logic_vector(1 downto 0);
    alucntrl: out std_logic_vector(3 downto 0)
);
end ALUControl;

architecture behavior of ALUControl is
begin
    aluctrl: process(funct, aluOp) -- ALU Control will take actions whenever there is a change in funct or aluOp
    begin
        case aluOp is -- Based on operations, the ALU code is driven.
        when "00" => -- ADD
            alucntrl <= "0010";
        when "01" => -- SUB
            alucntrl <= "0011";
        when "10" => -- See IR[5:0]
            case funct is
            when "100000" => -- ADD
                alucntrl <= "0010";
            when "100010" => -- SUB
                alucntrl <= "0011";
            when "100100" => -- AND
                alucntrl <= "0000";
            when "100101" => -- OR
                alucntrl <= "0001";
            when "101010" => -- SLT
                alucntrl <= "0100";
            when others => null;
            end case;
        when "11" =>
            alucntrl <= "0101";
        when others => null;
        end case;
    end process aluctrl;
end architecture behavior;