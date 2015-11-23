--------------------------------------------------
-- Author: 				Steve Wagner
-- Matrikelnummer: 	175309
-- Datum: 				14/11/2015
-- Brief:				Audio
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
	clk					:IN			std_logic;		--Clock 50MHz
	clkQHz				:IN			std_logic; 		--Clock 1/4Hz
	freqSignal			:IN			std_logic; 		--Signal frequency
	
	timeOver				:IN			std_logic; 		--Time over
	
	bipLed				:OUT			std_logic_vector(8 downto 0); --Led to show the end of the decounter
	bipper				:OUT			std_logic
	);
END audio;

--------------------------------------------
--        ARCHITECTURE	                  --
--------------------------------------------
ARCHITECTURE Behaviour OF audio IS
--Intern signal declaration
SIGNAL 		qSecond			:INTEGER  :=0; 		-- quarter of a second
SIGNAL	 	hSecond			:INTEGER  :=0; 		-- half of a second

SIGNAL 		bipON				:std_logic:='0';		-- Bipper state

SIGNAL 		precState		:std_logic:='1';		--Signal to wait of each rising edge of the 1Hz clock

BEGIN


audio_proc : PROCESS (clk, clkQHz, freqSignal, timeOver)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			--time over
			IF(timeOver='1')THEN
			
				--one minute passed (120 because with increment every 500ms)
				IF(hSecond<120) THEN
				
						--high state of the 125ms period
						IF(clkQHz='1') THEN
							--allow to increment the qSecond every period and not every 20ns
							If(precState='1') THEN
								precState<='0';
								qSecond<=qSecond+1;
								
-- TEST without arithmetic
--								IF(qSecond>=4) THEN
--									hSecond<=hSecond+1;
--									qSecond<=1;
--									bipON<= NOT bipON;
--								END IF;
-- END TEST without arithmetic

-- TEST modulus
								--1/2 second passed
								IF((qSecond mod 4)=0) THEN
									bipON<= NOT bipON;
									hSecond<=hSecond+1; 
								END IF;
-- END TEST modulus
								
							END IF;
						
							--Bip ON
							IF(bipON = '1') THEN
								--Frequence of 3KHz to heard a sound (high state)
								IF(freqSignal='1') THEN
									bipLed<="111111111";
									bipper<='1';
								--Frequence of 3KHz to heard a sound (low state)	
								ELSE
									bipLed<="000000000";
									bipper<='0';
								END IF;
														
							--Bip OFF
							ELSE
								bipLed<="000000000";
								bipper<='0';
							END IF;
							
						--low state of the 125ms period	
						ELSE	
							--In all case in the low state of the period
							bipLed<="000000000";
							bipper<='0';
							precState<='1';
											
						END IF;
					ELSE
					--Put the led ON to prevent that the minute is over
					bipLed<="111111111";
				END IF;
			
			--Timer is not over	
			ELSIF (timeOver='0') THEN
				qSecond<=0;
				hSecond<=0;
				bipper<='0';
				bipLed<="000000000";
			END IF;
		END IF;
		
END PROCESS audio_proc;
				
	


END Behaviour;