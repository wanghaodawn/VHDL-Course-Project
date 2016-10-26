library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;
entity wh4574_div1k is
 port(clk50m:in std_logic;
      clk1k:out std_logic);
end wh4574_div1k;
architecture behav of wh4574_div1k is
 signal count1:std_logic_vector(14 downto 0);
 signal count2:std_logic; 
 signal co:std_logic; 
       begin
  process(clk50m)
   begin
   if clk50m'event and clk50m='1' then
    if count1="110000110100111" then
       count1<="000000000000000";
       co<='1';
       else 
       count1<=count1+'1';
       co<='0';
    end if;
   end if;
  end process;
   process(co)
     begin
     if co'event and co='1' then
      count2<=not count2;
     end if;
   end process;
   clk1k<=count2;
end behav;