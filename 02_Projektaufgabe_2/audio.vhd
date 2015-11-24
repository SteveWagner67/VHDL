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
	
	timeOver			:IN			std_logic; --Time over coming from the decounter

	bipLed			:OUT			std_logic_vector(8 downto 0); --Leds to simulate the bipper 
	bipper			:OUT			std_logic  --Bipper when the timer is over
	);
END audio;

--------------------------------------------
--        ARCHITECTURE	                  --
--------------------------------------------
ARCHITECTURE Behaviour OF audio IS
--Intern signal declaration
SIGNAL qSecond		:INTEGER 	:=0; --250ms's counter
SIGNAL second		:INTEGER 	:=0; -- 1 second's counter

SIGNAL bipON		:std_logic	:='0'; --State of the bip

SIGNAL precState		:std_logic  :='1'; --Precedent state of the 1/4-Hz-Clock

BEGIN


audio_proc : PROCESS (clk, clkQHz, freqSignal, timeOver)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			--Time is over
			IF(timeOver='1')THEN
			
				--one minute passed
				IF(second<60) THEN
				
						--high state of the 1/4-Hz-Clock
						IF(clkQHz='1') THEN
							--Change the precedent state of the 1/4-Hz-Clock
							precState<='1';
						
							--Bip ON
							IF(bipON = '1') THEN
								--High state of the signal's frequency 
								IF(freqSignal='1') THEN
									bipLed<="111111111";
									bipper<='1';
									
								--Low state of the signal's frequency 	
								ELSE
									bipLed<="000000000";
									bipper<='0';
								END IF;
								
							--Bip OFF
							ELSE
								bipLed<="000000000";
								bipper<='0';
							END IF;
							
						--Low state of the 250ms period	
						ELSE	
							bipLed<="000000000";
							bipper<='0';

							
							--Increment the counter each 1/4-Hz-clock
							If(precState='1') THEN
								--Change the precedent state of the 1/4-Hz-Clock
								precState<='0';
								qSecond<=qSecond+1;
								
								--1 second passed
								IF((qSecond mod 4)=0) THEN
									bipON<= NOT bipON;
									second<=second+1;
								END IF;
								
							END IF;
					
						END IF;	
				--60 second passed
				ELSE
					--To show that the 60 sec passed
					bipLed<="111111111";
				END IF;
			
			--Timer isn't over	
			ELSIF (timeOver='0') THEN
				qSecond<=0;
				second<=0;
				bipper<='0';
				bipLed<="000000000";
			END IF;
		END IF;
		
END PROCESS audio_proc;
				
	


END Behaviour;