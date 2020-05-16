-- Project		: COEN6501
-- File Name	: signed_to_unsigned_tb.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 03- November- 2018
-- Description	: 
--					The function of this test bench is to test the functionality of 
-- component used to convert the 8-bit signed binary number to unsigned number.

-- Declare library files:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration: 
entity sign_to_unsign_tb is
	-- No port declarations for test bench
end sign_to_unsign_tb;

-- Architecture Implementation:
architecture rtl of sign_to_unsign_tb is

-- Component declaration for sign_to_unsign:
Component sign_2_unsign
	port( input  	: in std_logic_vector (7 downto 0);
		  A 		: out std_logic_vector (7 downto 0));
end Component;

--inputs
signal input: std_logic_vector (7 downto 0):= "00000000";
--outputs
signal A : std_logic_vector (7 downto 0);

begin
	uut: sign_2_unsign PORT MAP(input=>input,A=>A);
	
	--Stimulus Process
	stim_proc:process
	begin
		wait for 100 ps;
		input<="00111001";
		
		wait for 100 ps;
		input<="10001001";
		
		wait for 100 ps;
		input<="00001001";
		
		wait for 100 ps;
		input<="10000101";
		
		wait for 100 ps;
		input<="11111111";
		
		wait for 100 ps;
		input<="00111100";

	end process;
end rtl;

-- end of sign_to_unsign_tb.vhd