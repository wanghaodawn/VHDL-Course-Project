LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY WH4574_COUNT24 IS
	PORT(
			CLK : IN STD_LOGIC;
			BCD10,BCD1 : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
			CO : OUT STD_LOGIC);
END WH4574_COUNT24;
ARCHITECTURE RTL OF WH4574_COUNT24 IS
	SIGNAL CO_1 : STD_LOGIC;
	SIGNAL CC : INTEGER RANGE 0 TO 23;
	BEGIN
		PROCESS(CLK)
		BEGIN
			IF CLK = '1' AND CLK'EVENT THEN
				CASE CC IS
					WHEN 0 => BCD1 <= "0000"; BCD10 <= "0000"; CC <= CC + 1;CO_1 <= '0';
					WHEN 1 => BCD1 <= "0001"; BCD10 <= "0000"; CC <= CC + 1;CO_1 <= '0';					
					WHEN 2 => BCD1 <= "0010"; BCD10 <= "0000"; CC <= CC + 1;CO_1 <= '0';
					WHEN 3 => BCD1 <= "0011"; BCD10 <= "0000"; CC <= CC + 1;CO_1 <= '0';
					WHEN 4 => BCD1 <= "0100"; BCD10 <= "0000"; CC <= CC + 1;CO_1 <= '0';
					WHEN 5 => BCD1 <= "0101"; BCD10 <= "0000"; CC <= CC + 1;CO_1 <= '0';
					WHEN 6 => BCD1 <= "0110"; BCD10 <= "0000"; CC <= CC + 1;CO_1 <= '0';
					WHEN 7 => BCD1 <= "0111"; BCD10 <= "0000"; CC <= CC + 1;CO_1 <= '0';
					WHEN 8 => BCD1 <= "1000"; BCD10 <= "0000"; CC <= CC + 1;CO_1 <= '0';
					WHEN 9 => BCD1 <= "1001"; BCD10 <= "0000"; CC <= CC + 1;CO_1 <= '0';
					WHEN 10 => BCD1 <= "0000"; BCD10 <= "0001"; CC <= CC + 1;CO_1 <= '0';
					WHEN 11 => BCD1 <= "0001"; BCD10 <= "0001"; CC <= CC + 1;CO_1 <= '0';					
					WHEN 12 => BCD1 <= "0010"; BCD10 <= "0001"; CC <= CC + 1;CO_1 <= '0';
					WHEN 13 => BCD1 <= "0011"; BCD10 <= "0001"; CC <= CC + 1;CO_1 <= '1';
					WHEN 14 => BCD1 <= "0100"; BCD10 <= "0001"; CC <= CC + 1;CO_1 <= '1';
					WHEN 15 => BCD1 <= "0101"; BCD10 <= "0001"; CC <= CC + 1;CO_1 <= '1';
					WHEN 16 => BCD1 <= "0110"; BCD10 <= "0001"; CC <= CC + 1;CO_1 <= '1';
					WHEN 17 => BCD1 <= "0111"; BCD10 <= "0001"; CC <= CC + 1;CO_1 <= '1';
					WHEN 18 => BCD1 <= "1000"; BCD10 <= "0001"; CC <= CC + 1;CO_1 <= '1';
					WHEN 19 => BCD1 <= "1001"; BCD10 <= "0001"; CC <= CC + 1;CO_1 <= '1';
					WHEN 20 => BCD1 <= "0000"; BCD10 <= "0010"; CC <= CC + 1;CO_1 <= '1';
					WHEN 21 => BCD1 <= "0001"; BCD10 <= "0010"; CC <= CC + 1;CO_1 <= '1';
					WHEN 22 => BCD1 <= "0010"; BCD10 <= "0010"; CC <= CC + 1;CO_1 <= '1';
					WHEN 23 => BCD1 <= "0011"; BCD10 <= "0010"; CC <= 0;	 CO_1 <= '1';
					WHEN 24 => BCD1 <= "0100"; BCD10 <= "0010"; CC <= CC + 1;CO_1 <= '1';
					WHEN 25 => BCD1 <= "0101"; BCD10 <= "0010"; CC <= 0;	 CO_1 <= '1';
				END CASE;
			END IF;
		END PROCESS;	
		CO <= NOT CO_1;
END RTL;
						