LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY WH4574_MOUSE_CONNECT IS
	PORT(CLK : IN STD_LOGIC;
		 BCD0,BCD1,BCD2,BCD3,BCD4,BCD5,BCD6,BCD7 : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
		 DATA : BUFFER STD_LOGIC;
		 Q_1K,Q_2K: OUT STD_LOGIC
		 );
END ENTITY WH4574_MOUSE_CONNECT;

ARCHITECTURE BEHAV of WH4574_MOUSE_CONNECT IS
	SIGNAL DAT0 : STD_LOGIC_VECTOR(32 DOWNTO 0);
	SIGNAL CC  : INTEGER RANGE 0 TO 24;
	SIGNAL DD  : INTEGER RANGE 0 TO 52;
	SIGNAL EE  : INTEGER RANGE 0 TO 1;	
	SIGNAL S   : INTEGER RANGE 0 TO 255;
	SIGNAL BAI,SHI,GE : INTEGER RANGE 0 TO 9; 
	
	BEGIN

    PROCESS(CLK,DD)
	BEGIN
		IF CLK'EVENT AND CLK='1' THEN			
			CASE CC IS
				--SEND RESET COMMAND
				WHEN 0 => CC <= CC + 1;
				WHEN 1 => DATA <= DAT0(0);
						  CC <= CC + 1;
				WHEN 2 => DATA <= DAT0(1);
					   	  CC <= CC + 1;
				WHEN 3 => DATA <= DAT0(2);
						  CC <= CC + 1;
				WHEN 4 => DATA <= DAT0(3);
						  CC <= CC + 1;
				WHEN 5 => DATA <= DAT0(4);
						  CC <= CC + 1;
				WHEN 6 => DATA <= DAT0(5);
						  CC <= CC + 1;
				WHEN 7 => DATA <= DAT0(6);
						  CC <= CC + 1;
				WHEN 8 => DATA <= DAT0(7);
						  CC <= CC + 1;				
				WHEN 9 => DATA <= DAT0(8);
						  CC <= CC + 1;
				WHEN 10 => DATA <= DAT0(9);
						   CC <= CC + 1;
				WHEN 11 => DATA <= DAT0(10);
						   CC <= CC + 1;
				-- RESET OVER
				
					   
				-- SEND ENABLE DATA REPORT
				WHEN 12 => IF DD = 13 THEN
							CC <= CC + 1;
						   END IF;
				WHEN 13 => DATA <= DAT0(0);
						  CC <= CC + 1;
				WHEN 14 => DATA <= DAT0(1);
					   	  CC <= CC + 1;
				WHEN 15 => DATA <= DAT0(2);
						  CC <= CC + 1;
				WHEN 16 => DATA <= DAT0(3);
						  CC <= CC + 1;
				WHEN 17 => DATA <= DAT0(4);
						  CC <= CC + 1;
				WHEN 18 => DATA <= DAT0(5);
						  CC <= CC + 1;
				WHEN 19 => DATA <= DAT0(6);
						  CC <= CC + 1;
				WHEN 20 => DATA <= DAT0(7);
						  CC <= CC + 1;				
				WHEN 21 => DATA <= DAT0(8);
						  CC <= CC + 1;
				WHEN 22 => DATA <= DAT0(9);
						   CC <= CC + 1;
				WHEN 23 => CC <= CC + 1;
				
				WHEN OTHERS => NULL;					   
			END CASE;
		END IF;
    END PROCESS;
    
    PROCESS(CLK,CC)
	VARIABLE I : INTEGER RANGE 0 TO 20;
	BEGIN
	IF CLK'EVENT AND CLK = '0' THEN
		IF EE = 0 THEN
			DAT0(10 DOWNTO 0) <= "01111111101";
			EE <= 1;
		END IF;	
			CASE DD IS			
				-- RECEIVE AND JUDGE REPLY
				WHEN 0 => IF CC = 12 THEN 
							IF DATA = '0' THEN
								DD <= DD + 1;
							END IF;
						   END IF;
				WHEN 1 => DAT0(1) <= DATA;
						   DD <= DD + 1;
				WHEN 2 => DAT0(2) <= DATA;
						   DD <= DD + 1;				    
				WHEN 3 => DAT0(3) <= DATA;
						   DD <= DD + 1;
				WHEN 4 => DAT0(4) <= DATA;
						   DD <= DD + 1;
				WHEN 5 => DAT0(5) <= DATA;
						   DD <= DD + 1;
				WHEN 6 => DAT0(6) <= DATA;
						   DD <= DD + 1;
				WHEN 7 => DAT0(7) <= DATA;
						   DD <= DD + 1;					    
				WHEN 8 => DAT0(8) <= DATA;
						   DD <= DD + 1;
				WHEN 9 => DAT0(9) <= DATA;
						   DD <= DD + 1;
				WHEN 10 => DAT0(10) <= DATA;
						   DD <= DD + 1;
				WHEN 11 =>  DD <= DD + 1;
						   				
				--WAIT RECEIVE 0X00
				WHEN 12 => IF I = 20 THEN
								I :=0;
								DD <= DD + 1;
						   ELSE
								I := I + 1;
						   END IF;
						   DAT0(10 DOWNTO 0) <= "01111010011";
				
				--SAVE RECEIVED DATA_SECTION 1:
				WHEN 13 => IF CC = 24 THEN
							IF DATA = '0' THEN 
								DD <= DD + 1;
							END IF;
						   END IF;
						   BCD3 <= "1111";
				WHEN 14 => DAT0(1) <= DATA;
						   DD <= DD + 1;
				WHEN 15 => DAT0(2) <= DATA;
						   DD <= DD + 1;					    
				WHEN 16 => DAT0(3) <= DATA;
						   DD <= DD + 1;
				WHEN 17 => DAT0(4) <= DATA;
						   DD <= DD + 1;
				WHEN 18 => DAT0(5) <= DATA;
						   DD <= DD + 1;
				WHEN 19 => DAT0(6) <= DATA;
						   DD <= DD + 1;
				WHEN 20 => DAT0(7) <= DATA;
						   DD <= DD + 1;						    
				WHEN 21 => DAT0(8) <= DATA;
						   DD <= DD + 1;
				WHEN 22 => DAT0(9) <= DATA;
						   DD <= DD + 1;
				WHEN 23 => DAT0(10) <= DATA;
						   DD <= DD + 1;
						   BCD4 <= "1111";		
				--SAVE RECEIVED DATA_SECTION 2:
				WHEN 24 => DAT0(11) <= DATA;
						   DD <= DD + 1;
				WHEN 25 => DAT0(12) <= DATA;
						   DD <= DD + 1;					    
				WHEN 26 => DAT0(13) <= DATA;
						   DD <= DD + 1;
				WHEN 27 => DAT0(14) <= DATA;
						   DD <= DD + 1;
				WHEN 28 => DAT0(15) <= DATA;
						   DD <= DD + 1;
				WHEN 29 => DAT0(16) <= DATA;
						   DD <= DD + 1;
				WHEN 30 => DAT0(17) <= DATA;
						   DD <= DD + 1;					    
				WHEN 31 => DAT0(18) <= DATA;
						   DD <= DD + 1;
				WHEN 32 => DAT0(19) <= DATA;
						   DD <= DD + 1;
				WHEN 33 => DAT0(20) <= DATA;
						   DD <= DD + 1;
						   BCD5 <= "1111";					   
				--SAVE RECEIVED DATA_SECTION 3:
				WHEN 34 => DAT0(21) <= DATA;
						   DD <= DD + 1;
				WHEN 35 => DAT0(22) <= DATA;
						   DD <= DD + 1;				    
				WHEN 36 => DAT0(23) <= DATA;
						   DD <= DD + 1;
				WHEN 37 => DAT0(24) <= DATA;
						   DD <= DD + 1;
				WHEN 38 => DAT0(25) <= DATA;
						   DD <= DD + 1;
				WHEN 39 => DAT0(26) <= DATA;
						   DD <= DD + 1;
				WHEN 40 => DAT0(27) <= DATA;
						   DD <= DD + 1;					    
				WHEN 41 => DAT0(28) <= DATA;
						   DD <= DD + 1;
				WHEN 42 => DAT0(29) <= DATA;
						   DD <= DD + 1;
				WHEN 43 => DAT0(30) <= DATA;
						   DD <= DD + 1;
				WHEN 44 => DAT0(31) <= DATA;
						   DD <= DD + 1;
				WHEN 45 => DAT0(32) <= DATA;
						   DD <= DD + 1;
				BCD6<= "1111";
				
				
				
				--JUDGE FLOW?
				WHEN 46 => IF (DAT0(1) OR DAT0(2)) = '1' THEN
								Q_1K <= '1';
						   END IF;
						   DD <= DD + 1;
				--JUDGE PRESS?
				WHEN 47 => IF (DAT0(6) OR DAT0(7) OR DAT0(8)) = '1' THEN
								Q_2K <= '1';
						   END IF;
						   DD <= DD + 1;
						   
				--JUDGE AND DISPLAY MARK-X
				WHEN 48 => IF DAT0(4) = '1' THEN
								BCD0 <= "1111";--MINUS MARK
						   ELSE 
								BCD0 <= "1110";--MIE DENG
						   END IF;
						   DD <= DD + 1;
				--JUDGE AND DISPLAY MARK-Y						   
				WHEN 49 => IF DAT0(3) = '1' THEN
								BCD0 <= "1111";--MINUS MARK
						   ELSE 
								BCD0 <= "1110";--MIE DENG
						   END IF;
						   DD <= DD + 1;
				
				--DISPLAY MOVE-X
				WHEN 50 => S <= CONV_INTEGER(DAT0(19 DOWNTO 12));
						   BAI <= (S MOD 100);
						   SHI <= (S REM 100);
						   SHI <= (SHI MOD 10);
						   GE  <= (SHI REM 10);
						   BCD1 <= CONV_STD_LOGIC_VECTOR(BAI,4);
						   BCD2 <= CONV_STD_LOGIC_VECTOR(SHI,4);
						   BCD3 <= CONV_STD_LOGIC_VECTOR(GE,4);
						   DD <= DD + 1;					   						   								
				--DISPLAY MOVE-Y				
				WHEN 51 => S <= CONV_INTEGER(DAT0(30 DOWNTO 22));
						   BAI <= (S MOD 100);
						   SHI <= (S REM 100);
						   SHI <= (SHI MOD 10);
						   GE  <= (SHI REM 10);
						   BCD5 <= CONV_STD_LOGIC_VECTOR(BAI,4);
						   BCD6 <= CONV_STD_LOGIC_VECTOR(SHI,4);
						   BCD7 <= CONV_STD_LOGIC_VECTOR(GE,4);	
						   DD <= 13;
						   					

				WHEN OTHERS => NULL;		   								
			END CASE;
		END IF;
	END PROCESS;
END BEHAV;    
     