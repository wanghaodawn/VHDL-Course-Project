LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY WH4574_DIV50 IS
	PORT(
			CLK : IN STD_LOGIC;
			Q : OUT STD_LOGIC);
END WH4574_DIV50;
ARCHITECTURE RTL OF WH4574_DIV50 IS
	SIGNAL CC : INTEGER RANGE 0 TO 49;
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
					WHEN 13 => CC <= CC + 1;Q <= '0';
					WHEN 14 => CC <= CC + 1;Q <= '0';
					WHEN 15 => CC <= CC + 1;Q <= '0';
					WHEN 16 => CC <= CC + 1;Q <= '0';
					WHEN 17 => CC <= CC + 1;Q <= '0';
					WHEN 18 => CC <= CC + 1;Q <= '0';
					WHEN 19 => CC <= CC + 1;Q <= '0';
					WHEN 20 => CC <= CC + 1;Q <= '0';
					WHEN 21 => CC <= CC + 1;Q <= '0';
					WHEN 22 => CC <= CC + 1;Q <= '0';
					WHEN 23 => CC <= CC + 1;Q <= '0';
					WHEN 24 => CC <= CC + 1;Q <= '0';
					WHEN 25 => CC <= CC + 1;Q <= '1';
					WHEN 26 => CC <= CC + 1;Q <= '1';
					WHEN 27 => CC <= CC + 1;Q <= '1';
					WHEN 28 => CC <= CC + 1;Q <= '1';
					WHEN 29 => CC <= CC + 1;Q <= '1';
					WHEN 30 => CC <= CC + 1;Q <= '1';
					WHEN 31 => CC <= CC + 1;Q <= '1';
					WHEN 32 => CC <= CC + 1;Q <= '1';
					WHEN 33 => CC <= CC + 1;Q <= '1';
					WHEN 34 => CC <= CC + 1;Q <= '1';
					WHEN 35 => CC <= CC + 1;Q <= '1';
					WHEN 36 => CC <= CC + 1;Q <= '1';
					WHEN 37 => CC <= CC + 1;Q <= '1';
					WHEN 38 => CC <= CC + 1;Q <= '1';
					WHEN 39 => CC <= CC + 1;Q <= '1';
					WHEN 40 => CC <= CC + 1;Q <= '1';
					WHEN 41 => CC <= CC + 1;Q <= '1';
					WHEN 42 => CC <= CC + 1;Q <= '1';
					WHEN 43 => CC <= CC + 1;Q <= '1';
					WHEN 44 => CC <= CC + 1;Q <= '1';
					WHEN 45 => CC <= CC + 1;Q <= '1';
					WHEN 46 => CC <= CC + 1;Q <= '1';
					WHEN 47 => CC <= CC + 1;Q <= '1';
					WHEN 48 => CC <= CC + 1;Q <= '1';
					WHEN 49 => CC <= 0;     Q <= '1';			
				END CASE;
			END IF;
		END PROCESS;	
END RTL;
						