LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY WH4574_MUX2 IS
  PORT(SEL,A,B : IN STD_LOGIC;
        Q : OUT STD_LOGIC);
END WH4574_MUX2;

ARCHITECTURE BEHAV OF WH4574_MUX2 IS
	BEGIN
		PROCESS(SEL)
		BEGIN
				IF SEL = '0' THEN
					Q <= B;
				ELSIF SEL = '1' THEN
					Q <= A;
				ELSE
					Q <= 'Z';
				END IF;
		END PROCESS;
END BEHAV;
