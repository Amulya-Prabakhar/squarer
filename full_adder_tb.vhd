-- Project		: COEN6501
-- File Name	: full_adder_tb.vhd 
-- Author		: Sibi Ravichandran 
-- Date			: 02- November- 2018
-- Description	: 
--					The function of this test bench is to test the functionality of 
-- Full Adder.

-- Declare library files:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration: 
entity full_adder_tb is
	-- No port declarations for test bench
end full_adder_tb;

-- Architecture Implementation:
architecture rtl of full_adder_tb is

-- Component declaration for full adder:
Component full_adder
	port( A, B, carry_in : in std_logic;
		  sum, carry_out : out std_logic);
end Component;

--inputs
signal a: std_logic:= '0';
signal b: std_logic:= '0';
signal carry_in: std_logic:= '0';

--outputs
signal sum : std_logic;
signal carry_out : std_logic;

begin
	uut: full_adder PORT MAP(a=>A,b=>B,carry_in=>carry_in,sum=>sum,carry_out=>carry_out);
	
	--Stimulus Process
	stim_proc:process
	begin
		wait for 100 ps;
		a<='0';
		b<='0';
		carry_in<='0';
		
		wait for 100 ps;
		a<='0';
		b<='0';
		carry_in<='1';
		
		wait for 100 ps;
		a<='0';
		b<='1';
		carry_in<='0';
		
		wait for 100 ps;
		a<='0';
		b<='1';
		carry_in<='1';
		
		wait for 100 ps;
		a<='1';
		b<='0';
		carry_in<='0';
		
		wait for 100 ps;
		a<='1';
		b<='0';
		carry_in<='1';
		
		wait for 100 ps;
		a<='1';
		b<='1';
		carry_in<='0';
		
		wait for 100 ps;
		a<='1';
		b<='1';
		carry_in<='1';
		
	end process;
end rtl;

-- end of full_adder_tb.vhd