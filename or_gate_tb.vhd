-- Project		: COEN6501
-- File Name	: or_gate_tb.vhd 
-- Author		: Sibi Ravichandran 
-- Date			: 02- November- 2018
-- Description	: 
--					The function of this test bench is to test the functionality of 
-- OR Gate.

-- Declare library files:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration:
entity or_tb is
	-- No port is required for a testbench 
end or_tb;

-- Architecture Declaration
architecture rtl of or_tb is

-- Component declaration for OR Gate:
Component or_gate
	port( A, B : in std_logic;
		  C : out std_logic);
end Component ;

--inputs
signal a: std_logic:= '0';
signal b: std_logic:= '0';

--outputs
signal c : std_logic;

begin
	uut: or_gate PORT MAP(a=>A,b=>B,c=>C);
	
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

-- end of or_gate_tb.vhd