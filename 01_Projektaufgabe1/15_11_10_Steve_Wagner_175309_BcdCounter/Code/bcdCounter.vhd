-------------------------------------------
-- Author: Steve Wagner
-- Matrikelnummer: 175309
-- Datum: 	10/11/2015
--------------------------------------------


-- Library Declaration --
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std;

--------------------------------------------
--	   SUB ENTITY                         --
--------------------------------------------
ENTITY bcdcounter IS
PORT(
	rst				:IN			std_logic; --Reset
	clk				:IN			std_logic; --Clock 1Hz
	en				:IN			std_logic; --Enable
	--Output Coder
	b0_cod			:OUT		std_logic; --LSB
	b1_cod			:OUT		std_logic;
	b2_cod			:OUT		std_logic;
	b3_cod			:OUT		std_logic  --MSB
	
	);
END bcdcounter;

--------------------------------------------
--        ARCHITECTURE	                    --
--------------------------------------------
ARCHITECTURE Behaviour OF bcdcounter IS
-- Interne signal declaration --
SIGNAL countBcd, countClk	: INTEGER := 0; --Variable to count
BEGIN

-- Registered Process --
clk_proc : PROCESS (clk,rst,en)
	BEGIN
		IF (rst='0') THEN -- Active Low Reset --
			countBcd<=0;
			countClk<=0;
		ELSIF (clk'EVENT AND clk='1' AND clk'LAST_VALUE='0') THEN
			IF (en='1') THEN --Count--
				--Increment the clock counter
				countClk<=countClk+1;
				IF (countClk = 50000000) THEN --1 second passed
					countClk<=0;
					countBcd<=countBcd+1;
					IF (countBcd=9) THEN
						countBcd<=0;
					END IF;
				END IF;
			ELSE 	--en='0' -> Stop counting --
			END IF;
		END IF;
END PROCESS clk_proc;

-- Counter Process --	
counter_proc : PROCESS (countBcd)
	BEGIN
		CASE countBcd IS 
			--Counter = 0--
			WHEN 0 =>
				b0_cod <= '0';
				b1_cod <= '0';
				b2_cod <= '0';
				b3_cod <= '0';
				
			--Counter = 1--
			WHEN 1 =>
				b0_cod <= '1';
				b1_cod <= '0';
				b2_cod <= '0';
				b3_cod <= '0';
				
			--Counter = 2--
			WHEN 2 =>
				b0_cod <= '0';
				b1_cod <= '1';
				b2_cod <= '0';
				b3_cod <= '0';
				
			--Counter = 3--
			WHEN 3 =>
				b0_cod <= '1';
				b1_cod <= '1';
				b2_cod <= '0';
				b3_cod <= '0';
		
			--Counter = 4--
			WHEN 4 =>
				b0_cod <= '0';
				b1_cod <= '0';
				b2_cod <= '1';
				b3_cod <= '0';
				
			--Counter = 5--
			WHEN 5 =>
				b0_cod <= '1';
				b1_cod <= '0';
				b2_cod <= '1';
				b3_cod <= '0';
				
			--Counter = 6--
			WHEN 6 =>
				b0_cod <= '0';
				b1_cod <= '1';
				b2_cod <= '1';
				b3_cod <= '0';
				
			--Counter = 7--
			WHEN 7 =>
				b0_cod <= '1';
				b1_cod <= '1';
				b2_cod <= '1';
				b3_cod <= '0';
				
			--Counter = 8--
			WHEN 8 =>
				b0_cod <= '0';
				b1_cod <= '0';
				b2_cod <= '0';
				b3_cod <= '1';
				
			--Counter = 9--
			WHEN 9 =>
				b0_cod <= '1';
				b1_cod <= '0';
				b2_cod <= '0';
				b3_cod <= '1';		
				
			WHEN others =>
		END CASE;
END PROCESS counter_proc;

END Behaviour;