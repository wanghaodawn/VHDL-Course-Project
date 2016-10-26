library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;
entity wh4574_usart is
 port(clk,reset,rxd,rd,wr,cs:in std_logic;
      txd,rdfull,tdempty:out std_logic;
      data_in:in std_logic_vector(7 downto 0);
      data_out:out std_logic_vector(7 downto 0));
end wh4574_usart;
architecture behav of wh4574_usart is
signal scir:std_logic_vector(5 downto 0);
signal shr:std_logic_vector(3 downto 0);
signal slr:std_logic_vector(1 downto 0);
signal scit:std_logic_vector(5 downto 0);
signal sht:std_logic_vector(3 downto 0);
signal slt:std_logic_vector(1 downto 0);
signal dfb:std_logic_vector(7 downto 0);
signal din_latch:std_logic_vector(7 downto 0); 
signal rxdf:std_logic;
signal txdf:std_logic;
signal tdempty_s:std_logic:='1';
signal rdfull_s:std_logic:='0';
 begin
  shr<=scir(5 downto 2);
  slr<=scir(1 downto 0);
  sht<=scit(5 downto 2);
  slt<=scit(1 downto 0);
  tdempty<=tdempty_s;
  rdfull<=rdfull_s;
  
  process(clk,rd,cs)
   begin
    if(rd='0'and cs='0') then
      rdfull_s<='0';
    elsif clk'event and clk='1' then
     if rxdf='1' and shr="1111" and slr="11" then
       data_out<=dfb;
       rdfull_s<='1';
     end if;
   end if;
 end process;
 
 process(wr,cs)
  begin
   if wr'event and wr='1' then
    if cs='0' then
     din_latch<=data_in;
    end if;
   end if;
 end process;
 
 process(clk)
  begin
   if(clk'event and clk='1')then
    if rxd='0' then
     rxdf<='1';
    elsif rxdf='1' and shr="1111" and slr="11" then
     rxdf<='0';
    end if;
   end if;
end process;

process(clk,wr)
 begin
  if (wr='0' and cs='0' )then
   txdf<='0';
   tdempty_s<='0';
  elsif clk'event and clk='1' then
    if ((txdf='0') and (sht="1111") and (slt="11"))or reset='0' then
       tdempty_s<='1';
       txdf<='1';
    end if;
  end if;
end process;

process(clk,reset)
 begin
  if reset='0' then
   scir<="000000";
  elsif clk'event and clk='1' then
   if scir<=27 and rxd='0' then
      scir<="011100";
   elsif scir<=27 and rxd='1' then
      scir<="000000";
   else 
      scir<=scir+1;
   end if;
  end if;
end process;

process(clk,reset)
 begin
  if reset='0' then
   scit<="000000";
  elsif clk'event and clk='1' then
   if scit<=27 then
     if tdempty_s='0' and wr='1' then
      scit<="011100";
     else
      scit<="000000";
   end if ;
   else
    scit<=scit+1;
   end if;
  end if;
end process;

process(clk,reset)
 begin
  if reset='0' then
   dfb<="00000000";
  elsif clk'event and clk='1' then
   if shr>="1000" and shr<="1111" and slr="01" then
    dfb(7)<=rxd;
    for i in 0 to 6 loop
     dfb(i)<=dfb(i+1);
    end loop;
   end if;
  end if;
 end process;
 
 process(sht)
  begin
   case sht is
    when"0111"=>txd<='0';
    when"1000"=>txd<=din_latch(0);
    when"1001"=>txd<=din_latch(1);
    when"1010"=>txd<=din_latch(2);
    when"1011"=>txd<=din_latch(3);
    when"1100"=>txd<=din_latch(4);
    when"1101"=>txd<=din_latch(5);
    when"1110"=>txd<=din_latch(6);
    when"1111"=>txd<=din_latch(7);
    when others=>txd<='1';
    end case;
 end process;
 
end behav;