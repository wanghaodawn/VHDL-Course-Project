LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY WH4574_CONTROL IS
	PORT(
			CLK : IN STD_LOGIC;
			DATA_IN  : OUT STD_LOGIC_VECTOR(0 TO 7);
			SEL : OUT STD_LOGIC
		);
END WH4574_CONTROL;
ARCHITECTURE RTL OF WH4574_CONTROL IS
	SIGNAL SBUF : STD_LOGIC_VECTOR(0 TO 7);
	SIGNAL S : INTEGER RANGE 0 TO 25;
	BEGIN

		PROCESS(CLK)
		BEGIN
			IF CLK = '1' AND CLK'EVENT THEN
				CASE S IS
					WHEN 0 => SEL <= '0';
							  S <= S + 1;
							  
					WHEN 1 => SBUF <= "01000001";--A
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';								  
					WHEN 2 => SBUF <= "01010100";--T
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';								  						  					  
					WHEN 3	=> SBUF <= "00001101";--HUI CHE
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '1';						  							  							  							  							  							  							  
							  							  						  
					WHEN 4 => SEL <= '0';
							  SBUF <= "01000001";--A
							  DATA_IN <= SBUF;
							  S <= S + 1;								  
					WHEN 5 => SBUF <= "01010100";--T
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';								  					  					  
					WHEN 6 => SBUF <= "00001101";--HUI CHE
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '1';	
							  
					WHEN 7 => SEL <= '0';
							  SBUF <= "01000001";--A
							  DATA_IN <= SBUF;
							  S <= S + 1;								  
					WHEN 8 => SBUF <= "01010100";--T
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';								  					  					  
					WHEN 9 => SBUF <= "00001101";--HUI CHE
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '1';
												  								  							  
					WHEN 10 => SEL <= '0';
							  SBUF <= "01000001";--A
							  DATA_IN <= SBUF;
							  S <= S + 1;								  
					WHEN 11 => SBUF <= "01010100";--T
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';								  					
					WHEN 12 => SBUF <= "01000100";--D
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';								  
					WHEN 13 => SBUF <= "00110001";--1
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';							  								  
					WHEN 14 => SBUF <= "00110011";--3
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';							  								  
					WHEN 15 => SBUF <= "00110110";--6
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';							  								  
					WHEN 16 => SBUF <= "00110110";--6
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';							  								  
					WHEN 17 => SBUF <= "00110111";--7
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';							  								  
					WHEN 18 => SBUF <= "00110110";--6
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';							  								  
					WHEN 19 => SBUF <= "00111000";--8
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';							  								  
					WHEN 20 => SBUF <= "00110100";--4
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';							  								  
					WHEN 21 => SBUF <= "00110111";--7
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';							  								  
					WHEN 22 => SBUF <= "00110101";--5
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';							  								  
					WHEN 23 => SBUF <= "00110101";--5
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';							  								  
					WHEN 24 => SBUF <= "00111011";--;
							  DATA_IN <= SBUF;
							  S <= S + 1;
							  SEL <= '0';							  								  
					WHEN 25 => SBUF <= "00001011";--HUICHE
							  DATA_IN <= SBUF;
							  SEL <= '1';
	
				END CASE;
			END IF;
		END PROCESS;
		
END RTL;
						