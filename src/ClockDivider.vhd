library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ClockDivider is
    Port 
	 ( 
		CLK : in  STD_LOGIC;
      CLK_OUT : out  STD_LOGIC
	 );
end ClockDivider;

architecture Behavioral of ClockDivider is

	constant delay:integer := 32000000 / 240; -- 32000000 CLK/second ... 60fps per quad
	
begin
	
	process(CLK)
	
		variable counter : integer range 0 to delay := 0;
		
		begin
		
			if(CLK'event AND CLK='1') then
				if(counter = delay) then
					counter := 0;
					CLK_OUT <= '1';
				else
					counter := counter + 1;
					CLK_OUT <= '0';
				end if;
				
			end if;
	end process;
	
end Behavioral;

