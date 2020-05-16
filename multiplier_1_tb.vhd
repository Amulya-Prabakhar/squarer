-- Project		: COEN6501
-- File Name	: multiplier_1_tb.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 03- November- 2018
-- Description	: 
--					The function of this test bench is to test the functionality of 
-- multiplier_1 which employs full adder and half adder for the addition of the partial products.

-- Declare library files:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration: 
entity multiplier_1_tb is
	-- No port declarations for test bench
end multiplier_1_tb;

-- Architecture Implementation:
architecture rtl of multiplier_1_tb is

-- Component declaration for multiplier_1:
Component multiplier_1 
	port( A  	: in std_logic_vector (7 downto 0);
		  Z		: out std_logic_vector (15 downto 0));
end component;

--inputs
signal a: std_logic_vector (7 downto 0):= "00000000";

--outputs
signal z : std_logic_vector(15 downto 0);

begin
	uut: multiplier_1 PORT MAP(a=>A,z=>Z);
	
	--Stimulus Process
	stim_proc:process
	begin
		wait for 100 ps;
		a<="00000001";
		
		wait for 100 ps;
		a<="00010101";
		
		wait for 100 ps;
		a<="00101010";
		
		wait for 100 ps;
		a<="00101011";
		
	end process;
end rtl;

-- end of multiplier_1_tb.vhd