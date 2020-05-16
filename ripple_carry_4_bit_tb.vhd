-- Project		: COEN6501
-- File Name	: ripple_carry_4_bit_tb.vhd 
-- Author		: Sibi Ravichandran 
-- Date			: 02- November- 2018
-- Description	: 
--					The function of this test bench is to test the functionality of 
-- 4-bit Ripple Carry Adder.

-- Declare library files:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration: 
entity ripple_carry_4_bit_tb is
	-- No port declarations for test bench
end ripple_carry_4_bit_tb;

-- Architecture Implementation:
architecture rtl of ripple_carry_4_bit_tb is

-- Component declaration for 4-Bit Ripple Carry Adder:
Component ripple_carry_4bit
	port( A, B  	: in std_logic_vector (3 downto 0);
		  carry_in	: in std_logic;
		  sum 		: out std_logic_vector (3 downto 0);
		  carry_out : out std_logic);
end Component;


--inputs
signal a: std_logic_vector(3 downto 0) := "0000";
signal b: std_logic_vector(3 downto 0) := "0000";
signal carry_in: std_logic:= '0';

--outputs
signal sum: std_logic_vector(3 downto 0);
signal carry_out : std_logic;

begin
	uut: ripple_carry_4bit PORT MAP(a=>A,b=>B,carry_in=>carry_in,sum=>sum,carry_out=>carry_out);
	--Stimulus Process
	stim_proc:process
	begin
		wait for 100 ps;
		a<="0001";
		b<="0001";
		carry_in<='0';
		
		wait for 100 ps;
		a<="0010";
		b<="0011";
		carry_in<='1';
		
		wait for 100 ps;
		a<="0100";
		b<="0011";
		carry_in<='0';
		
		wait for 100 ps;
		a<="0111";
		b<="1111";
		carry_in<='0';
		
		wait for 100 ps;
		a<="1111";
		b<="1111";
		carry_in<='1';
		
	end process;
end rtl;

-- end of ripple_carry_4bit.vhd