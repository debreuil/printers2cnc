
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Quad7Seg is
    Port 
	 ( 
		SLOT : in UNSIGNED (1 downto 0);
		VALUE : in UNSIGNED (3 downto 0);
		DIGIT : out  STD_LOGIC_VECTOR (0 to 3);
		SEG : out  STD_LOGIC_VECTOR (0 to 7)
	 );	 
end Quad7Seg;

architecture Behavioral of Quad7Seg is

begin
	process(SLOT, VALUE)
		begin
		
			case SLOT is
				when "00" => DIGIT <= "1110";
				when "01" => DIGIT <= "1101";
				when "10" => DIGIT <= "1011";
				when others => DIGIT <= "0111";
			end case;
			
			case VALUE is
				when "0000" => SEG <= B"1111_1100";	-- 0
				when "0001" => SEG <= B"0110_0000";	-- 1
				when "0010" => SEG <= B"1101_1010";	-- 2
				when "0011" => SEG <= B"1111_0010";	-- 3
				when "0100" => SEG <= B"0110_0110";	-- 4
				when "0101" => SEG <= B"1011_0110";	-- 5
				when "0110" => SEG <= B"1011_1110";	-- 6
				when "0111" => SEG <= B"1110_0000";	-- 7
				when "1000" => SEG <= B"1111_1110";	-- 8
				when "1001" => SEG <= B"1111_0110";	-- 9
				when "1010" => SEG <= B"1110_1110";	-- A
				when "1011" => SEG <= B"0011_1110";	-- B
				when "1100" => SEG <= B"1001_1100";	-- C
				when "1101" => SEG <= B"0111_1010";	-- D
				when "1110" => SEG <= B"1001_1110";	-- E
				when others => SEG <= B"1000_1110";	-- F
			end case;
			
		
	end process;

end Behavioral;

