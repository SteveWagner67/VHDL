--------------------------------------------------
-- Author: 				Steve Wagner
-- Matrikelnummer: 	175309
-- Datum: 				14/11/2015
-- Brief:				Decounter
--------------------------------------------------

-- Library Declaration --
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std;

--------------------------------------------
--	  SUB ENTITY	                        --
--------------------------------------------
ENTITY decounter IS
PORT(
		clk				:IN			std_logic;		--Clock 50MHz
		clk1Hz			:IN			std_logic;		--Clock 1Hz
		start				:IN			std_logic;		--State of Start/stop

		snSecIn			:IN			INTEGER;			--Single number of the second coming from the counter
		tSecIn			:IN 			INTEGER;			--Tens of the second coming from the counter
		snMinIn			:IN 			INTEGER;			--Single number of the minute coming from the counter
		tMinIn			:IN 			INTEGER;			--Tens of the minute coming from the counter
		
		changeIn			:IN			std_logic;		--Change coming from the counter
		
		changeOut		:OUT			std_logic;		--Change going to the counter
		
		timeOver			:OUT			std_logic;		--Time over going to the audio, the counter and the freqDiv
		
		snSecOut			:OUT			INTEGER;			--Single number of the second going to the display and the counter
		tSecOut			:OUT 			INTEGER;			--Tens of the second going to the display and the counter
		snMinOut			:OUT 			INTEGER;			--Single number of the minute going to the display and the counter
		tMinOut			:OUT 			INTEGER			--Tens of the minute going to the display and the counter
	 );
END decounter;


ARCHITECTURE Behaviour OF decounter IS
--- Intern Signal Declaration ----
SIGNAL 		precState		:std_logic:='1'; 		--Precedent state of the 1-Hz-clock

SIGNAL 		snSec				 :INTEGER	:=0; 		--Single number of the second used internal
SIGNAL 		tSec 				 :INTEGER	:=0; 		--Tens of the second used internal
SIGNAL 		snMin				 :INTEGER	:=0; 		--Single number of the minute used internal
SIGNAL 		tMin				 :INTEGER	:=0; 		--Tens of the minute used internal


BEGIN

-- Registered Process --
dec_proc : PROCESS (clk, clk1Hz, start)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			--Stop and value change by pressing a button (increments or clear)
			IF (start='0') THEN
			
				--Change of the time coming from the counter -> save this time to start decounting with this one
				IF(changeIn='1') THEN
					IF(snSecIn<=0) THEN
						snSec<=0;
					ELSE
					snSec<=snSecIn;
					END IF;
			
					IF(tSecIn<=0) THEN
						tSec<=0;
					ELSE
					tSec<=tSecIn;
					END IF;
			
					IF(snMinIn<=0) THEN
						snMin<=0;
					ELSE
						snMin<=snMinIn;
					END IF;
			
					IF(tMinIn<=0) THEN
						tMin<=0;
					ELSE
						tMin<=tMinIn;	
					END IF;
				
					changeOut<='1';
					
				ELSE
					changeOut<='0';
				END IF;
				
				--Time isn't over
				timeOver<='0';
				
			--Start
			ELSE
				IF(clk'EVENT AND clk='1') THEN
				--1 second passed and last state of the 1-Hz-clock was a low state
					IF(clk1Hz='1') AND (precState='1') THEN
						--Last state is a high state
						precState<='0';
						IF(snSec<=0) THEN
							IF(tSec<=0) THEN
								IF(snMin<=0) THEN
									IF(tMin<=0) THEN
										tMin<=0;
										snMin<=0;
										tSec<=0;
										snSec<=0;
										timeOver<='1'; --Time is over
									ELSE
										tMin<=tMin-1;
										snMin<=9;
										tSec<=5;
										snSec<=9;
									END IF;
								ELSE
									snMin<=snMin-1;
									tSec<=5;
									snSec<=9;
								END IF;
							ELSE
								tSec<=tSec-1;
								snSec<=9;
							END IF;			
						ELSE
							snSec<=snSec-1;
						END IF;
					
						--Time change -> send to the counter
						changeOut<='1';
					
					--Low state of the 1-Hz-clock
					ELSIF (clk1Hz='0') THEN
						--Last state is a low state
						precState<='1';
						--No change occured in decounter
						changeOut<='0';
								
					ELSE
						--No change occured in decounter
						changeOut<='0';
					END IF;
				
				END IF;
				
			END IF;
			
			--Send the time to counter and display
			snSecOut<=snSec;
			tSecOut<=tSec;
			snMinOut<=snMin;
			tMinOut<=tMin;
		END IF;
		
END PROCESS dec_proc;

END Behaviour;

