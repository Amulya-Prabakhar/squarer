-- Project		: COEN6501
-- File Name	: not_gate_tb.vhd 
-- Author		: Sibi Ravichandran 
-- Date			: 02- November- 2018
-- Description	: 
--					The function of this test bench is to test the functionality of 
-- NOT Gate.

-- Declare library files:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration:
entity not_tb is
	-- No port is required for a testbench 
end not_tb;

-- Architecture Declaration
architecture rtl of not_tb is

-- Component declaration for NOT Gate:
Component not_gate
	port( A : in std_logic;
		  C : out std_logic);
end Component ;

--inputs
signal a: std_logic:= '0';

--outputs
signal c : std_logic;

begin
	uut: not_gate PORT MAP(a=>A,c=>C);
	
	--Stimulus Process
	stim_proc:process
	begin
		wait for 100 ps;
		a<='1';
		
		wait for 100 ps;
		a<='0';

	end process;
end rtl;

-- end of not_gate_tb.vhd