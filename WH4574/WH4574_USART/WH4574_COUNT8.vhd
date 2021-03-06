LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY WH4574_COUNT8 IS
	PORT(
			CLK : IN STD_LOGIC;
			Q : OUT STD_LOGIC_VECTOR(0 TO 7));
END WH4574_COUNT8;
ARCHITECTURE RTL OF WH4574_COUNT8 IS
	SIGNAL CC : STD_LOGIC_VECTOR(0 TO 7);
	BEGIN
		PROCESS(CLK)
		BEGIN
			IF CLK = '1' AND CLK'EVENT THEN
				IF CC = "11111111" THEN
					CC <= "00000000";
				ELSE 
					CC <= CC + '1';
				END IF;
			END IF;
		END PROCESS;
	Q <= CC;	
END RTL;
						