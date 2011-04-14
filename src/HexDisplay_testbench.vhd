
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY HexDisplay_testbench IS
END HexDisplay_testbench;
 
ARCHITECTURE behavior OF HexDisplay_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HexDisplay
    PORT(
         CLK : IN  std_logic;
			NUMBER : in  UNSIGNED(15 downto 0);
         DIGIT : INOUT  STD_LOGIC_VECTOR(0 to 3);
         SEG : INOUT  STD_LOGIC_VECTOR(0 to 7)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal NUMBER : UNSIGNED(15 downto 0) := x"ABCD";

 	--Outputs
   signal DIGIT : STD_LOGIC_VECTOR(0 to 3);
   signal SEG : STD_LOGIC_VECTOR(0 to 7);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HexDisplay PORT MAP (
          CLK => CLK,
          NUMBER => NUMBER,
          DIGIT => DIGIT,
          SEG => SEG
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*2000;

      -- insert stimulus here 

      wait;
   end process;

END;
