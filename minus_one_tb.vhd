-- Project		: COEN6501
-- File Name	: minus_one_tb.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 03- November- 2018
-- Description	: 
--					The function of this test bench is to test the functionality of 
-- minus one component which employs 8-Bit Ripple carry adder to subtract the 1 from the 16 bit input.

-- Declare library files:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration: 
entity minus_one_tb is
	-- No port declarations for test bench
end minus_one_tb;

-- Architecture Implementation:
architecture rtl of minus_one_tb is

-- Component declaration for minus_one:
Component minus_one
	port( A  	: in std_logic_vector (15 downto 0);
		  Z		: out std_logic_vector (15 downto 0));
end Component;

--inputs
signal a: std_logic_vector (15 downto 0):= "0000000000000000";

--outputs
signal z : std_logic_vector(15 downto 0);

begin
	uut: minus_one PORT MAP(a=>A,z=>Z);
	
	--Stimulus Process
	stim_proc:process
	begin
		wait for 100 ps;
		a<="0000000100000001";
		
		wait for 100 ps;
		a<="0001010100010101";
		
		wait for 100 ps;
		a<="0010101000101010";
		
		wait for 100 ps;
		a<="0010101100101011";
		
	end process;
end rtl;

-- end of minus_one_tb.vhd