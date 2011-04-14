--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:45:47 03/31/2011
-- Design Name:   
-- Module Name:   C:/edev/papilio/xpapilio/LEDTest/Quad7Seg_testbench.vhd
-- Project Name:  LEDTest
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Quad7Seg
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Quad7Seg_testbench IS
END Quad7Seg_testbench;
 
ARCHITECTURE behavior OF Quad7Seg_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Quad7Seg
    PORT(
         SLOT : IN  std_logic_vector(1 downto 0);
         VALUE : IN  std_logic_vector(3 downto 0);
         DIGIT : OUT  std_logic_vector(0 to 3);
         SEG : OUT  std_logic_vector(0 to 7)
        );
    END COMPONENT;
    

   --Inputs
   signal SLOT : std_logic_vector(1 downto 0) := (others => '0');
   signal VALUE : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal DIGIT : std_logic_vector(0 to 3);
   signal SEG : std_logic_vector(0 to 7);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Quad7Seg PORT MAP (
          SLOT => SLOT,
          VALUE => VALUE,
          DIGIT => DIGIT,
          SEG => SEG
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
