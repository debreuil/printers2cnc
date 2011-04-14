-- based on code from Kevin Lidsey

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY Encoder_testbench IS
END Encoder_testbench;
 
ARCHITECTURE behavior OF Encoder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Encoder
    PORT(
         clk : IN  std_logic;
         ENC_A : IN  std_logic;
         ENC_B : IN  std_logic;
         LED : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ENC_A : std_logic := '0';
   signal ENC_B : std_logic := '0';

 	--Outputs
   signal LED : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Encoder PORT MAP (
          clk => clk,
          ENC_A => ENC_A,
          ENC_B => ENC_B,
          LED => LED
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

		ENC_A <= '0';
		ENC_B <= '1';
      wait for clk_period;
		
		ENC_A <= '1';
		ENC_B <= '1';
      wait for clk_period;
		
		ENC_A <= '1';
		ENC_B <= '0';
      wait for clk_period;
		
		ENC_A <= '0';
		ENC_B <= '0';
      wait for clk_period;


		ENC_A <= '0';
		ENC_B <= '1';
      wait for clk_period;
		
		ENC_A <= '1';
		ENC_B <= '1';
      wait for clk_period;
		
		ENC_A <= '1';
		ENC_B <= '0';
      wait for clk_period;
		
		ENC_A <= '0';
		ENC_B <= '0';
      wait for clk_period;


      wait;
   end process;

END;
