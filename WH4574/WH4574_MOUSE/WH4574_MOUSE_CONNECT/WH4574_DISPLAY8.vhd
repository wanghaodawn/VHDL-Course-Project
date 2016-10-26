library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity WH4574_DISPLAY8 is
port(din0,din1,din2,din3,din4,din5,din6,din7:in std_logic_vector(3 downto 0);
     clk:in std_logic;
     led_sa,led_sb,led_sc:out std_logic;
     led_a,led_b,led_c,led_d,led_e,led_f,led_g,led_dp:out std_logic);
 end entity;
 
 architecture behav of WH4574_DISPLAY8 is 
 signal seg:std_logic_vector(6 downto 0);
 signal sel:std_logic_vector( 2 downto 0);
 signal num:std_logic_vector(3 downto 0);
 signal s:std_logic_vector(2 downto 0);
 begin
 led_sa<=sel(0);
 led_sb<=sel(1);
 led_sc<=sel(2);
 led_a<=seg(0);
 led_b<=seg(1);
 led_c<=seg(2);
 led_d<=seg(3);
 led_e<=seg(4);
 led_f<=seg(5);
 led_g<=seg(6);
 process(clk)
begin
if rising_edge(clk) then
 if s="111" then
    s<="000";
    else s<=s+'1';
 end if;
 end if;
 end process;
 process(s,din0,din1,din2,din3,din4,din5,din6,din7)
begin
if s="000" then
sel<="000";
num<=din0;
led_dp<='0';
elsif s="001" then
sel<="001" ;num<=din1;
led_dp<='0';
elsif s="010" then
sel<="010" ;num<=din2;
led_dp<='1';
elsif s="011" then
sel<="011" ;num<=din3;
led_dp<='0';
elsif s="100" then
sel<="100" ;num<=din4;
led_dp<='1';
elsif s="101" then
sel<="101" ;num<=din5;
led_dp<='0';
elsif s="110" then
sel<="110";num<=din6;
led_dp<='0';
else 
sel<="111";num<=din7;
led_dp<='0';
end if;
end process;

seg<="0111111" when num=0 else
     "0000110" when num=1 else
     "1011011" when num=2 else
     "1001111" when num=3 else
     "1100110" when num=4 else
     "1101101" when num=5 else
     "1111101" when num=6 else
     "0000111" when num=7 else
     "1111111" when num=8 else
     "1101111" when num=9 else
     "1110111" when num=10 else
     "1111100" when num=11 else
     "0111001" when num=12 else
     "1011110" when num=13 else
     "ZZZZZZZ" when num=14 else--GUAN DENG
     "0100000" when num=15 else--MINUS MARK
     "ZZZZZZZ";
     end behav;

