library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity UART_TEST is
port(
     clk,ce:in std_logic;
	 we:in std_logic;--'1'send
	 re:out std_logic;--receiving
	 dat_in:in std_logic_vector(7 downto 0);
	 dat_out:buffer std_logic_vector(7 downto 0);
	 rx:in std_logic;
	 tx:out std_logic;
	 finish:buffer std_logic
);
end UART_TEST;

architecture behave of UART_TEST is
type state is (s0,s1,s2,s3);
type modetype is (waiting,send,receive);
signal pre_s,nx_s:state:=s0;
signal clock,clk_out:std_logic;
signal start,timed:std_logic;
signal start2,timed2:std_logic;
signal mode:modetype;
signal en:std_logic:='0';
signal dat:std_logic_vector(8 downto 0);
signal dat_o:std_logic_vector(8 downto 0);
signal t,s:std_logic;
begin

dat_out<=dat_o(8 downto 1);
s<=dat_o(0);



tx<=not clk_out  when mode=receive else
      t when mode=send else
	  '0' ;
	  
cdiv:process(clk,en)--1us
 variable cnt:integer range 0 to 25;
begin
  if(en='0')then
    clk_out<='1';
	cnt:=0;
  elsif(clk'event and clk='1')then
    cnt:=cnt+1;
    if(cnt=25)then
      cnt:=0;
	  clk_out<=not clk_out;
    end if;
  end if;	
end process cdiv;


--com:process(clock)
--begin
  --if(clock'event and clock='1')then
  --pre_s<=nx_s;
  --end if;
--end process  com;



con:process(clk,ce)

begin
  if(ce='0')then
    nx_s<= s0;
  elsif(clk'event and clk='1')then 
    case nx_s is
    when s0=>	  --wait
	  finish<='1';
	  mode<=waiting;
	  start<='0';
	  start2<='0';
	  en<='0';
	  if(rx='1')then
	    finish<='0';
		mode<=receive;
		start<='1';
		en<='1';
		nx_s<=s1;--receive
		
	  elsif(we='1')then
	    finish<='0';
		mode<=send;	
        start2<='1';
		en<='0';
		nx_s<=s2;--send
	  else
	    start<='0';
	    start2<='0';
	    mode<=waiting; 
	    finish<='1';
		en<='0';
        nx_s<=s0;--wait	  
	  end if;
	when s1=>        --receive
	  start<='1';
	  re<='1';
	  finish<='0';
	  mode<=receive;
	  en<='1';
	  if(timed='1')then
	    start<='0';
	    finish<='1';
	    mode<=waiting;
		re<='0';
		en<='0';
	    nx_s<=s0;
	  else
	    start<='1';
	    finish<='0';
	    mode<=receive;
		re<='1';
		en<='1';
		nx_s<=s1;
	  end if;
	when s2=>  --send
	  start2<='1';
	  finish<='0';
	  en<='0';
	   mode<=send;
	  if(timed2='1')then
	    start2<='0';
	    finish<='1';
	    en<='0';
	    mode<=waiting;		
	    nx_s<=s3;
	  else
	    start<='1';
	    finish<='0';
	    en<='0';
	     mode<=send;
		nx_s<=s2;
	  end if;
	when s3=>
	   
	  if(rx='0')then	    
	    nx_s<=s0;
	  else
	    nx_s<=s3; 
	  end if;
	when others=>
	  nx_s<=s0;
	end case;
  end if;
end process con;
	   
rec:process(clk_out,start)  --receive
 variable count:integer range 0 to 9;
begin
  if(start='0')then
    count:=0;
	timed<='0';
  elsif(clk_out'event and clk_out='1')then
    dat_o<=dat_o(7 downto 0)& rx;
    count:=count+1;
	if(count=9)then
	  count:=0;
	  timed<='1';
	end if;
  end if;
end process rec;

sen:process(rx,start2,dat_in)  --send
 variable count:integer range 0 to 10;
begin
  
  if(start2='0')then
    count:=0;
	timed2<='0';
	t<='1';
	dat<=dat_in&'0';
  elsif(rx'event and rx='1')then
    t<=dat(8);
    dat<=dat(7 downto 0)& '0';
    count:=count+1;
	if(count=9)then
	  count:=0;
	  timed2<='1';
	end if;
  end if;
end process sen;


end behave;
