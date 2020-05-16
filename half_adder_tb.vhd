-- Project		: COEN6501
-- File Name	: half_adder_tb.vhd 
-- Author		: Sibi Ravichandran 
-- Date			: 02- November- 2018
-- Description	: 
--					The function of this test bench is to test the functionality of 
-- Half Adder.

-- Declare library files:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration: 
entity half_adder_tb is
	-- No port declarations for test bench
end half_adder_tb;

-- Architecture Implementation:
architecture rtl of half_adder_tb is

-- Component declaration for half adder:
Component half_adder
	port( A, B : in std_logic;
		  sum, carry : out std_logic);
end Component;

--inputs
signal a: std_logic:= '0';
signal b: std_logic:= '0';

--outputs
signal sum : std_logic;
signal carry : std_logic;

begin
	uut: half_adder PORT MAP(a=>A,b=>B,sum=>sum,carry=>carry);
	
	--Stimulus Process
	stim_proc:process
	begin
		wait for 100 ps;
		a<='1';
		b<='0';
		
		wait for 100 ps;
		a<='0';
		b<='1';
		
		wait for 100 ps;
		a<='0';
		b<='0';
		
		wait for 100 ps;
		a<='1';
		b<='1';
		
	end process;
end rtl;

-- end of half_adder_tb.vhd