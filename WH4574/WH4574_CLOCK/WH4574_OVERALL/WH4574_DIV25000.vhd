LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY WH4574_DIV25000 IS
	PORT(CLK : IN STD_LOGIC;
			 Q : OUT STD_LOGIC);
END ENTITY WH4574_DIV25000;

ARCHITECTURE BEHAV of WH4574_DIV25000 IS
	SIGNAL COUNT : STD_LOGIC_VECTOR(13 DOWNTO 0);
	SIGNAL QQ : STD_LOGIC;
	BEGIN

    PROCESS(CLK)
	BEGIN
		IF CLK'EVENT AND CLK = '1' THEN
			IF COUNT = "00000000000000" THEN
				COUNT <= "11000011010011";
				QQ <= NOT QQ;
			ELSE
				COUNT <= COUNT-1;
			END IF;
		END IF;
    END PROCESS;
    
    Q <= QQ;
END BEHAV;    
     