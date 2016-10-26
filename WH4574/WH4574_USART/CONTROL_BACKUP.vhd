LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY WH4574_CONTROL_BACKUP IS
	PORT(
			CLK : IN STD_LOGIC;
			DATA_IN  : OUT STD_LOGIC_VECTOR(0 TO 7)
		);
END ENTITY;
ARCHITECTURE RTL OF WH4574_CONTROL_BACKUP IS
	SIGNAL SBUF : STD_LOGIC_VECTOR(0 TO 7);
	SIGNAL S : INTEGER RANGE 0 TO 3;
	BEGIN

		PROCESS(CLK)
		BEGIN
			IF CLK = '1' AND CLK'EVENT THEN
				CASE S IS
					WHEN 0 => SBUF <= "01000001";--A
							  DATA_IN <= SBUF;
							  SBUF <= "01010100";--T
							  DATA_IN <= SBUF;						  					  
							  SBUF <= "00001101";--HUI CHE
							  DATA_IN <= SBUF;
							  S <= S + 1;						  
					WHEN 1 => SBUF <= "01000001";--A
							  DATA_IN <= SBUF;
						      SBUF <= "01010100";--T
							  DATA_IN <= SBUF;					  					  
					          SBUF <= "00001101";--HUI CHE
							  DATA_IN <= SBUF;
							  S <= S + 1;	
					WHEN 2 => SBUF <= "01000001";--A
							  DATA_IN <= SBUF;
							  SBUF <= "01010100";--T
							  DATA_IN <= SBUF;					  					  
							  SBUF <= "00001101";--HUI CHE
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  								  							  
					WHEN 3 => SBUF <= "01000001";--A
							  DATA_IN <= SBUF;
						      SBUF <= "01010100";--T
							  DATA_IN <= SBUF;					
					          SBUF <= "01000100";--D
							  DATA_IN <= SBUF;
							  SBUF <= "00110001";--1
							  DATA_IN <= SBUF;
							  SBUF <= "00110011";--3
							  DATA_IN <= SBUF;
							  SBUF <= "00110110";--6
							  DATA_IN <= SBUF;
							  SBUF <= "00110110";--6
							  DATA_IN <= SBUF;
							  SBUF <= "00110111";--7
							  DATA_IN <= SBUF;
							  SBUF <= "00110110";--6
							  DATA_IN <= SBUF;
							  SBUF <= "00111000";--8
							  DATA_IN <= SBUF;
							  SBUF <= "00110100";--4
							  DATA_IN <= SBUF;
							  SBUF <= "00110111";--7
							  DATA_IN <= SBUF;
							  SBUF <= "00110101";--5
							  DATA_IN <= SBUF;
							  SBUF <= "00110101";--5
							  DATA_IN <= SBUF;
							  SBUF <= "00111010";--;
							  DATA_IN <= SBUF;
							  SBUF <= "00001011";--HUICHE
							  DATA_IN <= SBUF;
								  				  							  
				END CASE;
			END IF;
		END PROCESS;
END RTL;
						