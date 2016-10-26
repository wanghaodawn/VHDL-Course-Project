LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY WH4574_COUNT26 IS
	PORT(
			CLK : IN STD_LOGIC;
			Q : OUT STD_LOGIC);
END WH4574_COUNT26;
ARCHITECTURE RTL OF WH4574_COUNT26 IS
	SIGNAL CC : INTEGER RANGE 0 TO 25;
	BEGIN
		PROCESS(CLK)
		BEGIN
			IF CLK = '1' AND CLK'EVENT THEN
				CASE CC IS
					WHEN 0 => CC <= CC + 1;Q <= '0';
					WHEN 1 => CC <= CC + 1;Q <= '0';
					WHEN 2 => CC <= CC + 1;Q <= '0';
					WHEN 3 => CC <= CC + 1;Q <= '0';
					WHEN 4 => CC <= CC + 1;Q <= '0';
					WHEN 5 => CC <= CC + 1;Q <= '0';
					WHEN 6 => CC <= CC + 1;Q <= '0';
					WHEN 7 => CC <= CC + 1;Q <= '0';
					WHEN 8 => CC <= CC + 1;Q <= '0';
					WHEN 9 => CC <= CC + 1;Q <= '0';
					WHEN 10 => CC <= CC + 1;Q <= '0';
					WHEN 11 => CC <= CC + 1;Q <= '0';
					WHEN 12 => CC <= CC + 1;Q <= '0';
					WHEN 13 => CC <= CC + 1;Q <= '1';
					WHEN 14 => CC <= CC + 1;Q <= '1';
					WHEN 15 => CC <= CC + 1;Q <= '1';
					WHEN 16 => CC <= CC + 1;Q <= '1';
					WHEN 17 => CC <= CC + 1;Q <= '1';
					WHEN 18 => CC <= CC + 1;Q <= '1';
					WHEN 19 => CC <= CC + 1;Q <= '1';
					WHEN 20 => CC <= CC + 1;Q <= '1';
					WHEN 21 => CC <= CC + 1;Q <= '1';
					WHEN 22 => CC <= CC + 1;Q <= '1';
					WHEN 23 => CC <= CC + 1;Q <= '1';
					WHEN 24 => CC <= CC + 1;Q <= '1';
					WHEN 25 => CC <= 0;	    Q <= '1';
				END CASE;
			END IF;
		END PROCESS;	
END RTL;
						