-- Project		: COEN6501
-- File Name	: ripple_carry_8_bit_tb.vhd 
-- Author		: Sibi Ravichandran 
-- Date			: 02- November- 2018
-- Description	: 
--					The function of this test bench is to test the functionality of 
-- 8-bit Ripple Carry Adder.

-- Declare library files:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration: 
entity ripple_carry_8_bit_tb is
	-- No port declarations for test bench
end ripple_carry_8_bit_tb;

-- Architecture Implementation:
architecture rtl of ripple_carry_8_bit_tb is

-- Component declaration for 8-Bit Ripple Carry Adder:
Component ripple_carry_8bit
	port( A, B	: in std_logic_vector (7 downto 0);
		  carry_in	: in std_logic;
		  sum 		: out std_logic_vector (7 downto 0);
		  carry_out : out std_logic);
end Component;

--inputs
signal a: std_logic_vector(7 downto 0):= "00000000";
signal b: std_logic_vector(7 downto 0):= "00000000";
signal carry_in: std_logic:= '0';

--outputs
signal sum: std_logic_vector(7 downto 0);
signal carry_out : std_logic;

begin
	uut: ripple_carry_8bit PORT MAP(a=>A,b=>B,carry_in=>carry_in,sum=>sum,carry_out=>carry_out);
	
	--Stimulus Process
	stim_proc:process
	begin
		wait for 100 ps;
		a<="00011100";
		b<="00001001";
		carry_in<='0';
		
		wait for 100 ps;
		a<="00000010";
		b<="00011001";
		carry_in<='1';
		
		wait for 100 ps;
		a<="00110100";
		b<="00010101";
		carry_in<='0';
		
		wait for 100 ps;
		a<="11111111";
		b<="11111111";
		carry_in<='0';
		
		wait for 100 ps;
		a<="11111111";
		b<="11111111";
		carry_in<='1';
		
	end process;
end rtl;

-- end of ripple_carry_8_bit_tb.vhd