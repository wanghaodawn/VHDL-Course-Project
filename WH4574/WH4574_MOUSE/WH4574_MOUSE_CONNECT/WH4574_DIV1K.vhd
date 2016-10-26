LIBRARY IEEE;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY WH4574_DIV1K IS
 PORT(CLK50M:IN STD_LOGIC;
      CLK1K:OUT STD_LOGIC);
END WH4574_DIV1K;
ARCHITECTURE BEHAV OF WH4574_DIV1K IS
 SIGNAL COUNT1:STD_LOGIC_VECTOR(14 DOWNTO 0);
 SIGNAL COUNT2:STD_LOGIC; 
 SIGNAL CO:STD_LOGIC; 
       BEGIN
  PROCESS(CLK50M)
   BEGIN
   IF CLK50M'EVENT AND CLK50M='1' THEN
    IF COUNT1="110000110100111" THEN
       COUNT1<="000000000000000";
       CO<='1';
       ELSE 
       COUNT1<=COUNT1+'1';
       CO<='0';
    END IF;
   END IF;
  END PROCESS;
   PROCESS(CO)
     BEGIN
     IF CO'EVENT AND CO='1' THEN
      COUNT2<=NOT COUNT2;
     END IF;
   END PROCESS;
   CLK1K<=COUNT2;
END BEHAV;