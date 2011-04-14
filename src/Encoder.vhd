library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity Encoder is
	port(
		CLK: in std_logic;
		MOT_A: out std_logic;
		MOT_B: out std_logic;
		LED: out   STD_LOGIC_VECTOR (0 to 1);
		ENC_A: in std_logic;
		ENC_B: in std_logic;
		DIGIT : out  STD_LOGIC_VECTOR (0 to 3);
		SEG : out  STD_LOGIC_VECTOR (0 to 7)
	);
end Encoder;

architecture behavioral of Encoder is

	signal NUMBER_VALUE : UNSIGNED(15 downto 0) := (others => '0');
	signal CLK_OUT : STD_LOGIC := '0';
	signal prevA, prevB: std_logic;
	signal currA, currB: std_logic;
	
begin

	clkDiv : entity work.ClockDivider(Behavioral) port map (CLK, CLK_OUT);
	hd : entity work.HexDisplay(Behavioral) port map (CLK_OUT, NUMBER_VALUE, DIGIT, SEG);
	
	read_rotary: process(clk)
	
	variable counter : integer range 0 to 16#FFFF# := 16#1000#;	
	
	begin
		if CLK'event and CLK = '1' then
		
			prevA <= currA;
			prevB <= currB;
			
			if prevA /= currA OR prevB /= currB then
			
				if prevA = '0' and currA = '1' then -- a rising
					if currB = '1' then
						counter := counter - 1;
					elsif currB = '0' then					
						counter := counter + 1;
					end if;
				elsif prevA = '1' and currA = '0' then -- a falling
					if currB = '1' then			
						counter := counter + 1;
					elsif currB = '0' then
						counter := counter - 1;
					end if;
				elsif prevB = '0' and currB = '1' then -- b rising
					if currA = '1' then			
						counter := counter + 1;
					elsif currA = '0' then
						counter := counter - 1;
					end if;
				elsif prevB = '1' and currB = '0' then -- b falling
					if currA = '1' then
						counter := counter - 1;
					elsif currA = '0' then			
						counter := counter + 1;
					end if;
				else
					counter := counter;
				end if;
			end if;
			
			currA <= ENC_A;
			currB <= ENC_B;
			
			if counter > 16#1100# then
				MOT_A <= '0';
				MOT_B <= '1';
--				if counter MOD 4 = 0 then
--					MOT_B <= '0';
--				else
--					MOT_B <= '1';
--				end if;
--				
				LED(0) <= '0';
				LED(1) <= '1';
			elsif counter < 16#900# then
				MOT_A <= '1';
				MOT_B <= '0';
				LED(0) <= '1';
				LED(1) <= '0';
			end if;
			
		end if;
		
		NUMBER_VALUE <= to_unsigned(counter, NUMBER_VALUE'length);
		--LED <= std_logic_vector(to_unsigned(counter, LED'length)); -- 16#1000#
	end process;
end behavioral;


