library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.ALL;

entity DataMemory is
port(
    addr : in std_logic_vector ( 31 downto 0 );
    writeData : in std_logic_vector ( 31 downto 0 );
    memWrite : in std_logic;
    memRead : in std_logic;
    clk: in std_logic;
    readData : out std_logic_vector ( 31 downto 0 ));
end DataMemory ;

architecture behavior of DataMemory is
begin
    data_mem: process(clk)--(addr, memRead, memWrite)
        subtype word is std_logic_vector(7 downto 0);
        type mem_array is array(natural range <>) of word;    
        --variable memory: mem_array(4096 to 4128); 268435456
        variable memory: mem_array(268435456 to 268435487);
        variable word_addr : natural;
    begin
        word_addr := conv_integer(addr(31 downto 0));
        if rising_edge(clk) then
            if memWrite='1' then
                memory(word_addr) := writeData(31 downto 24);
                memory(word_addr+1) := writeData(23 downto 16);
                memory(word_addr+2) := writeData(15 downto 8);
                memory(word_addr+3) := writeData(7 downto 0);
            end if;
        elsif falling_edge(clk) then
            readData <= "00000000000000000000000000000000";
            if memRead='1' then
                readData <= memory(word_addr) & memory(word_addr+1) & memory(word_addr+2) & memory(word_addr+3);
            end if;
        end if;
    end process data_mem;
end architecture behavior;