-- Project		: COEN6501
-- File Name	: exnor_gate_tb.vhd 
-- Author		: Sibi Ravichandran 
-- Date			: 02- November- 2018
-- Description	: 
--					The function of this test bench is to test the functionality of 
-- EX-NOR Gate.

-- Declare library files:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration:
entity exnor_tb is
	-- No port is required for a testbench 
end exnor_tb;

-- Architecture Declaration
architecture rtl of exnor_tb is

-- Component declaration for EX-NOR Gate:
Component xnor_gate
	port( A, B : in std_logic;
		  C : out std_logic);
end Component ;

--inputs
signal a: std_logic:= '0';
signal b: std_logic:= '0';

--outputs
signal c : std_logic;

begin
	uut: xnor_gate PORT MAP(a=>A,b=>B,c=>C);
	
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

-- end of exnor_gate_tb.vhd