library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
Entity dataMemory IS
	PORT (
		address: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		WriteData : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		memRead : IN STD_LOGIC;
		memWrite: IN STD_LOGIC;
		readData: OUT STD_LOGIC_vECTOR(31 DOWNTO 0)
	);

END dataMemory;

ARCHITECTURE Behavioral OF dataMemory IS
	TYPE RAM_16_x_32 IS ARRAY (0 TO 15) OF std_logic_vector(31 DOWNTO 0);
	SIGNAL DM : RAM_16_x_32 := (
X"00000000", -- assume starts at 0x10001000
X"00000000",
X"00000000",
X"00000000",
X"00000000",
X"00000000",
X"00000000",
X"00000000",
X"00000000",
X"00000000",
X"00000000",
X"00000000",
X"00000000",
X"00000000",
X"00000000",
X"00000000"
);

BEGIN 
	PROCESS (memWrite, memRead) -- pulse on write 

BEGIN 
    readData <= X"00000000";
	IF (memWrite = '1') THEN
	DM((to_integer(unsigned(address)) - 268435356) / 4) <= WriteData;
	END IF;
	IF (memRead = '1') THEN
		readData <= DM((to_integer(unsigned(address)) - 268435356)/4);
	END IF;
	
END PROCESS;
end Behavioral;
