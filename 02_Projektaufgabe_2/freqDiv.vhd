--------------------------------------------------
-- Author: 				Steve Wagner
-- Matrikelnummer: 	175309
-- Datum: 				13/11/2015
-- Brief:				To become an 1Hz-frequenz
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
	clkOut			:OUT			std_logic--Clock state
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
			--Start the counter for the x-Hz-clock
			IF(en='1') THEN
				--Increment the clock counter
				countClk<=countClk+1; 						

			ELSE
				--Low state of the x-Hz-clock
				state<='0';
			END IF;			
			
			--If a half of the whishes period occured 
			IF (countClk >= (periodns/40)) THEN 	--40 because 50Mhz -> 20ns and to have an half a period
				--Toggle the state of the x-Hz-clock
				state <= NOT state;
				countClk<=0;
						
			END IF;
			
			--Send the state of the x-Hz-clock 
			clkOut<=state;
		END IF;
		
		
		
END PROCESS clk_proc;

END Behaviour;