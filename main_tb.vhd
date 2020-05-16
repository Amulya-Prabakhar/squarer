-- Project		: COEN6501
-- File Name	: main_tb.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 03- November- 2018
-- Description	: 
--					The function of this test bench is to test the functionality of 
-- main file which implements the arithemetic unit that performs the operation (A*A)-1

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity main_tb is
	-- No port declarations for test bench
end main_tb;

-- Architecture Implementation:
architecture rtl of main_tb is
  
-- Component Declaration of mainr:  
Component main
	port( A  	: in std_logic_vector (7 downto 0);
	     clock: in std_logic;
       load: in std_logic;
       clear: in std_logic;
       Z		: out std_logic_vector (15 downto 0);
		   end_flag : out std_logic);
end Component;

-- Signal Declarations:
--input of main
signal a_tb: std_logic_vector (7 downto 0):= "00000000";
signal clock: std_logic:='0';
signal load: std_logic:='0';
signal clear: std_logic:='0';

-- output of main
signal z_tb : std_logic_vector(15 downto 0);
signal END_FLAG_tb: std_logic;

constant clk_period : time := 100 ps;
begin
   
UUT: main port map ( A=>a_tb,clock=>clock, load=>load, clear=>clear,Z=>z_tb,end_flag =>END_FLAG_tb);

  -- Process to toggle the value of the clock every 50 ps
  clk_process :process
   begin
        clock <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clock <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
   end process;
  
  -- process for testing the register
	stim_proc:process 
	begin

		wait for 300 ps;
		a_tb<="00101111";
		clear<='0';
		load<='1';
		
		wait for 300 ps;
		a_tb<="10000111";
		clear<='0';
		load<='1';
	
		wait for 300 ps;	
		a_tb<="00001111";
		clear<='0';
		load<='1';

		wait for 300 ps;
		a_tb<="00000011";
		clear<='0';
		load<='0';
		
		wait for 300 ps;	
		a_tb<="01100111";
		clear<='0';
		load<='1';

		wait for 300 ps;
		a_tb<="00000001";
		clear<='1';
		load<='1';
		
		wait for 300 ps;	
		a_tb<="00100100";
		clear<='0';
		load<='1';
		
	end process;
end rtl;

-- end of main_tb.vhd
