--------------------------------------------------
-- Author: 				Steve Wagner
-- Matrikelnummer: 	175309
-- Datum: 				13/11/2015
-- Brief:				To become a special frequenz
--------------------------------------------------

-- Library Declaration --
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

--------------------------------------------
--	   SUB ENTITY                         --
--------------------------------------------
ENTITY freqDiv IS
PORT(
	clk50M			:IN			std_logic; --Clock 50MHz
	en					:IN			std_logic; --Enable the clock
	periodns			:IN			INTEGER; --Period of the signal in ns
	clkOut			:OUT			std_logic--Clock output
	);
END freqDiv;

--------------------------------------------
--        ARCHITECTURE	                  --
--------------------------------------------
ARCHITECTURE Behaviour OF freqDiv IS
-- Interne signal declaration --
SIGNAL countClk	: INTEGER 	:= 0; --Variable to count
SIGNAL state		: std_logic := '0'; --Variable for the counter in second

BEGIN

-- Registered Process --
clk_proc : PROCESS (clk50M, en)
	BEGIN
		IF(clk50M'EVENT AND clk50M='1') THEN
			--activation of the counter
			IF(en='1') THEN
			
				countClk<=countClk+1; 						

			ELSE
				state<='0';
			END IF;
					
			clkOut<=state;
			
		END IF;
		
		--If the half of the period in ns occured
		IF (countClk >= (periodns/40)) AND (clk50M'EVENT AND clk50M='1') THEN 	--40 because 50Mhz -> 20ns and to have an half a period
			state <= NOT state; --to have a periodic signal with the half of the period at '1' and the other half at '0'
			countClk<=0;	
		END IF;
				
END PROCESS clk_proc;

END Behaviour;