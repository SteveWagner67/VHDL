--------------------------------------------------
-- Author: 				Steve Wagner
-- Matrikelnummer: 	175309
-- Datum: 				23/11/2015
-- Brief:				Debounce each button
--------------------------------------------------

-- Library Declaration --
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

--------------------------------------------
--	   SUB ENTITY                         --
--------------------------------------------
ENTITY debounce IS
PORT(
		clk50M			:IN			std_logic; 		--Clock 50MHz
		button			:IN			std_logic;		--Button to debounce
		push				:OUT			std_logic 		--Real push or not
	);
END debounce;

--------------------------------------------
--        ARCHITECTURE	                  --
--------------------------------------------
ARCHITECTURE Behaviour OF debounce IS
-- Interne signal declaration --
SIGNAL countClk	: INTEGER 	:= 0; 				--Signal to count

SIGNAL pushBtn		: std_logic	:='0';          --Signal to represent a push

BEGIN

-- Registered Process --
dbc_proc : PROCESS (clk50M, button)
	BEGIN
		IF(clk50M'EVENT AND clk50M='1') THEN
			--Button pushed
			IF(button='0') THEN
				--Increment the clock counter
				countClk<=countClk+1;
			
				pushBtn<='1';

				
			--Button released
			ELSE	
				--Last state of the button was a push
				IF(pushBtn='1') THEN
					IF (countClk >= 500) THEN 	--pushing during 10ms means that's a real push(500 because 10.000ns/20ns -> 20 ns = 1/50MHz)
						push<='1'; --real push
					ELSE	
						push<='0'; --bug
					END IF;
					
				ELSE
					push<='0'; -- new
				END IF;
				
				countClk<=0;
				pushBtn<='0'; --new
			END IF;			
			
		END IF;
	
END PROCESS dbc_proc;

END Behaviour;