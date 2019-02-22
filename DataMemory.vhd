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
    readData : out std_logic_vector ( 31 downto 0 ));
end DataMemory ;

architecture behavior of DataMemory is
begin
    data_mem: process(addr, memRead, memWrite)
        subtype word is std_logic_vector(31 downto 0);
        type mem_array is array(natural range <>) of word;    
        variable memory: mem_array(4096 to 4127);
        variable word_addr : natural;
    begin
        word_addr := conv_integer(addr(31 downto 0));
        if memRead='1' then
            readData <= memory(word_addr);
        elsif memWrite='1' then
            memory(word_addr) := writeData;
        end if;
    end process data_mem;
end architecture behavior;