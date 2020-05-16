-- Project		: COEN6501
-- File Name	: reg_16_bit_tb.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 03- November- 2018
-- Description	: 
--					The function of this test bench is to test the functionality of 
-- 16-Bit Register.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity reg_16_bit_tb is
	-- No port declarations for test bench
end reg_16_bit_tb;

-- Architecture implementation: 
architecture rtl of reg_16_bit_tb is

-- Component declaration for 16-Bit Register:
Component reg_16_bit 
	port( data_in : in std_logic_vector (15 downto 0);
		  clock, load, clear: in std_logic; 
		  data_out : out std_logic_vector (15 downto 0));
end Component;

--inputs
signal data_in: std_logic_vector (15 downto 0):= "0000000000000000";
signal clock: std_logic := '0';
signal load: std_logic  := '0';
signal clear: std_logic := '0';

--outputs
signal data_out: std_logic_vector (15 downto 0);
constant clk_period : time := 100 ps;

begin
	uut: reg_16_bit PORT MAP(data_in=>data_in,clock=>clock,load=>load,clear=>clear,data_out=>data_out);
	  
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

		wait for 200 ps;
		data_in<="0010111100101111";
		clear<='0';
		load<='1';
		
		wait for 200 ps;
		data_in<="0000011000101000";
		clear<='0';
		load<='1';
	
		wait for 200 ps;	
		data_in<="0101001100101111";
		clear<='0';
		load<='1';

		wait for 200 ps;
		data_in<="0011000000101110";
		clear<='0';
		load<='0';
		
		wait for 200 ps;	
		data_in<="0110011101111111";
		clear<='0';
		load<='1';

		wait for 200 ps;
		data_in<="0010111100000001";
		clear<='1';
		load<='1';
		
		wait for 200 ps;	
		data_in<="0010111100111100";
		clear<='0';
		load<='1';
		
  end process;
end rtl;
 
-- end of reg_16_bit_tb.vhd

