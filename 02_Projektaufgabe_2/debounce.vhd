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
ENTITY debounce IS
PORT(
	clk50M			:IN			std_logic; --Clock 50MHz
	button			:IN			std_logic; --Button to debounce
	push				:OUT			std_logic --Real push or not
	);
END debounce;

--------------------------------------------
--        ARCHITECTURE	                  --
--------------------------------------------
ARCHITECTURE Behaviour OF debounce IS
-- Interne signal declaration --
SIGNAL countClk	: INTEGER 	:= 0; --Variable to count

BEGIN

-- Registered Process --
dbc_proc : PROCESS (clk50M, button)
	BEGIN
		IF(clk50M'EVENT AND clk50M='1') THEN
			--Button pushed
			IF(button='0') THEN
				--Increment the clock counter
				countClk<=countClk+1; 						

			--Button released
			ELSE
				IF (countClk >= 500) THEN 	--pushing during 10ms means that's a real push(500 because countClk++ every 20ns) 
					push<='1'; --real push
				ELSE	
					push<='0'; --bug
				END IF;
				
				countClk<=0;
			END IF;
			
		END IF;
	
END PROCESS dbc_proc;

END Behaviour;