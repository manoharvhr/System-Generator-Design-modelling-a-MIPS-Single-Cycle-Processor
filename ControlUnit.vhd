library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.ALL;

entity ControlUnit is 
port(
    opcode: in std_logic_vector(5 downto 0);
    regDst: out std_logic;
    jump: out std_logic;
    branch: out std_logic;
    memRead: out std_logic;
    memToReg: out std_logic;
    aluOp: out std_logic_vector(1 downto 0);
    memWrite: out std_logic;
    aluSrc: out std_logic;
    regWrite: out std_logic
);
end ControlUnit;

architecture behavior of ControlUnit is
begin
    ctrl_unit: process(opcode)
    begin
        case opcode is 
        
            when "000000" => -- R-Type
                regDst <= '1';
                aluSrc <= '0';
                memToReg <= '0';
                regWrite <= '1';
                memRead <= '0';
                memWrite <= '0';
                branch <= '0';
                jump <= '0';
                aluOp <= "10"; -- See IR[5:0]
            when "001000" => -- I-Type addi
                regDst <= '0';
                jump <= '0';
                branch <= '0';
                memRead <= '0';
                memToReg <= '0';
                aluOp <= "00"; -- ADD
                memWrite <= '0';
                aluSrc <= '1';
                regWrite <= '1';
            when "101011" => -- I-Type sw
                --regDst <= '0';
                aluSrc <= '1';
                --memToReg <= '1';
                regWrite <= '0';
                memRead <= '0';
                memWrite <= '1';
                branch <= '0';
                jump <= '0';
                aluOp <= "00"; -- ADD                
            when "100011" => -- I-Type lw
                regDst <= '0';
                aluSrc <= '1';
                memToReg <= '1';
                regWrite <= '1';
                memRead <= '1';
                memWrite <= '0';
                branch <= '0';
                jump <= '0';
                aluOp <= "00"; -- ADD                
            when "000100" => -- I-Type beq
                --regDst <= '0';
                aluSrc <= '0';
                --memToReg <= '1';
                regWrite <= '0';
                memRead <= '0';
                memWrite <= '0';
                branch <= '1';
                jump <= '0';
                aluOp <= "01"; -- SUB                 
            when "001111" => -- I-Type lui
                regDst <= '0';
                aluSrc <= '1'; -- We will have to shift it to the left by 16
                memToReg <= '0';
                regWrite <= '1';
                memRead <= '0';
                memWrite <= '0';
                branch <= '0';
                jump <= '0';
                aluOp <= "11"; -- SHIFT LEFT BY 16    
            when others => null;
                
        end case;
    end process ctrl_unit;
end architecture behavior;