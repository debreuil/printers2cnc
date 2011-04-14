
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity HexDisplay is
    Port 
	 ( 
		CLK_DIV : in  STD_LOGIC;
		NUMBER : in  UNSIGNED(15 downto 0);
		DIGIT : out  STD_LOGIC_VECTOR (0 to 3);
		SEG : out  STD_LOGIC_VECTOR (0 to 7)
	 );
end HexDisplay;

architecture Behavioral of HexDisplay is
	
	signal SLOT : UNSIGNED(1 downto 0) := (others => '0');
	signal VALUE : UNSIGNED(3 downto 0) := (others => '0');

	begin
		q7s: entity work.Quad7Seg(Behavioral) port map (SLOT, VALUE, DIGIT, SEG);
	
		process(CLK_DIV)
		
			variable counter : integer range 0 to 3 := 0;
			
			begin
				if(CLK_DIV'event and CLK_DIV='1') then
					
					if(counter < 3) then
						counter := counter + 1;
					else 
						counter := 0;
					end if;
					
					case counter is
						when 0 => VALUE <= NUMBER(3 downto 0);
						when 1 => VALUE <= NUMBER(7 downto 4);
						when 2 => VALUE <= NUMBER(11 downto 8);
						when others => VALUE <= NUMBER(15 downto 12);
					end case;
					
					SLOT <= to_unsigned(counter, SLOT'length);
						
				end if;
		end process;
		
end Behavioral;

