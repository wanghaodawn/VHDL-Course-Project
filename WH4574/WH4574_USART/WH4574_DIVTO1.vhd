LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY WH4574_DIVTO1 IS
	PORT(
			CLK : IN STD_LOGIC;
			Q : OUT STD_LOGIC);
END WH4574_DIVTO1;
ARCHITECTURE RTL OF WH4574_DIVTO1 IS
	SIGNAL CC : INTEGER RANGE 0 TO 6;
	SIGNAL S  : STD_LOGIC;
	BEGIN
		PROCESS(CLK)
		BEGIN
			IF CLK = '1' AND CLK'EVENT THEN
				CASE S IS
					WHEN '0' => IF CC = 6 THEN
								S <= '1';
								Q <= '0';
								CC <= 0;
							  ELSE	
								CC <= CC + 1;
								S <= '0';
								Q <= '0';
							  END IF;
					WHEN '1' => IF CC = 6 THEN
								S <= '0';
								Q <= '1';
								CC <= 0;
							  ELSE	
								CC <= CC + 1;
								S <= '1';
								Q <= '1';
							  END IF;					
				END CASE;
			END IF;
		END PROCESS;	
END RTL;
						