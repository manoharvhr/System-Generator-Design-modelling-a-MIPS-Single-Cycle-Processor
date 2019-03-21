library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.ALL;

entity InstructionMemory is
port(
    addr : in std_logic_vector ( 31 downto 0 );
    inst : out std_logic_vector ( 31 downto 0 ));
end InstructionMemory ;

architecture behavior of InstructionMemory is
begin
    inst_mem: process(addr) -- Process is executed whenever the input address to the block is changed.
        subtype word is std_logic_vector(31 downto 0); -- Define a type for a word, which is 32 bits.
        type mem_array is array(natural range <>) of word; -- Define another type which is an array of words.
        variable memory: mem_array(0 to 16) := -- Create and initialise (or pre-load) the instruction memory. The instructions are taken from the simulator.
        (X"20080005", -- addi $t0, $zero, 5 I
        X"20090007", -- addi I
        X"00005020", -- add R
        X"3c0b1000", -- lui I
        X"200c0001", -- addi I
        X"00006820", -- add R
        X"ad6a0000", -- sw I
        X"8d6a0000", -- lw I
        X"014b6824", -- and R
        X"014b6825", -- or R
        X"01485020", -- add R
        X"012c4822", -- sub R
        X"216b0004", -- addi I
        X"ad6a0000", -- sw I
        X"012c682a", -- slt R
        X"11a0fff8", -- beq I
        X"00000000"); -- empty instruction
        variable word_addr : natural;
    begin -- Now when address changes...
        word_addr := conv_integer(addr(31 downto 2)); -- Convert the input into an integer so we can simply pass to the array. Note that the 2 LSB are the byte offset which is excluded when converting.
        inst <= memory(word_addr); -- Return the instruction.
    end process inst_mem;
end architecture behavior;