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
    data_mem: process(clk) -- This is a Synchronous Data Memory. The following process is executed whenever changes to the clk signal is seen.
        subtype word is std_logic_vector(7 downto 0); -- Here the word type is created to represent a byte of data. This Data Memory is accessible at byte level.
        type mem_array is array(natural range <>) of word; -- Create a new type to represent the memory, which simply is an array.
        variable memory: mem_array(268435456 to 268435487); -- The values here for the memory range are taken from the simulator as to align it with the application.
        variable word_addr : natural;
    begin
        word_addr := conv_integer(addr(31 downto 0)); -- Obtain the address needed to be accessed. Note that here the 2 LSB are not excluded as memory is accessible at byte level.
        if rising_edge(clk) then -- When it is the rising edge...
            if memWrite='1' then -- AND memWrite is HIGH, go ahead and write data. Note that it is important to write as early as possible and read as late as possible.
                memory(word_addr) := writeData(31 downto 24);
                memory(word_addr+1) := writeData(23 downto 16);
                memory(word_addr+2) := writeData(15 downto 8);
                memory(word_addr+3) := writeData(7 downto 0);
            end if;
        elsif falling_edge(clk) then -- If it is the falling edge instead...
            readData <= "00000000000000000000000000000000"; -- If it is falling edge, output initially 0s to easily debug.
            if memRead='1' then -- AND the memRead signal is HIGH, output data from the memory.
                readData <= memory(word_addr) & memory(word_addr+1) & memory(word_addr+2) & memory(word_addr+3);
            end if;
        end if;
    end process data_mem;
end architecture behavior;