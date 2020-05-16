-- Project		: COEN6501
-- File Name	: partial_product_tb.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 03- November- 2018
-- Description	: 
--					The function of this test bench is to test the functionality of the component 
-- which is used to determine the values of the partial prodcuts using AND Gate.

-- Declare library files:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration: 
entity partial_product_tb is
	-- No port declarations for test bench
end partial_product_tb;

-- Architecture Implementation:
architecture rtl of partial_product_tb is

-- Component declaration for partial_product:
Component partial_product 
	port( A  	: in std_logic_vector (7 downto 0);
		  P		: out std_logic_vector (64 downto 1));
end Component;

--inputs
signal a: std_logic_vector (7 downto 0):= "00000000";

--outputs
signal p : std_logic_vector(64 downto 1);

begin
	uut: partial_product PORT MAP(a=>A,p=>P);
	
	--Stimulus Process
	stim_proc:process
	begin
		wait for 100 ps;
		a<="00000001";
		
		wait for 100 ps;
		a<="00010101";
		
		wait for 100 ps;
		a<="10101010";
		
		wait for 100 ps;
		a<="10101011";
		
	end process;
end rtl;

-- end of partial_product_tb.vhd