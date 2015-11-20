--------------------------------------------------
-- Author: 				Steve Wagner
-- Matrikelnummer: 	175309
-- Datum: 				14/11/2015
-- Brief:				Sound
--------------------------------------------------

-- Library Declaration --
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std;

--------------------------------------------
--	   SUB ENTITY                         --
--------------------------------------------
ENTITY audio IS
PORT(
	clk				:IN			std_logic;--Clock 50MHz
	clkQHz			:IN			std_logic; --Clock 1/4Hz
	freqSignal		:IN			std_logic; --Signal frequency
	timeOver			:IN			std_logic; --Time over
	decValue			:IN			INTEGER; --Value of the decounter
	bipLed			:OUT			std_logic_vector(8 downto 0); --Led to show the end of the decounter
	debug			:OUT			INTEGER;
	bipper			:OUT			std_logic
	);
END audio;

--------------------------------------------
--        ARCHITECTURE	                  --
--------------------------------------------
ARCHITECTURE Behaviour OF audio IS
--Intern signal declaration
SIGNAL second		:INTEGER 	:=0;
SIGNAL internBip	:std_logic	:='0';
SIGNAL bipON		:std_logic	:='0';


BEGIN


audio_proc : PROCESS (clk, clkQHz, freqSignal, decValue, timeOver)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			--end of the counter and in start
			IF(decValue = 0) AND (timeOver='1')THEN
				--one minute passed
				IF(second<3000) THEN
						--high state of the 250ms period
						IF(clkQHz='1') THEN
						
							--Bip ON
							IF(bipON = '1') THEN
								IF(freqSignal='1') THEN
									bipLed<="111111111";
									
								ELSE
									bipLed<="000000000";
								END IF;
								
								bipper<='1';
							
							--Bip OFF
							ELSE
								bipLed<="000000000";
								bipper<='0';
							END IF;
							
						--low state of the 250ms period	
						ELSE	
							--In all case in the low state of the period
							bipLed<="000000000";
							bipper<='0';
							
							second<=second+1;
							
							--1 second passed
							IF((second mod 4)=0) THEN
								bipON<= NOT bipON;
							END IF;
						
						END IF;					
				END IF;
			
				
			ELSIF (timeOver='0') THEN
				second<=0;
				bipper<='0';
				bipLed<="000000000";
			END IF;
		END IF;
		
		debug<=second;
		
END PROCESS audio_proc;
				
	


END Behaviour;