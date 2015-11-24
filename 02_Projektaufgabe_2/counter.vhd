--------------------------------------------------
-- Author: 				Steve Wagner
-- Matrikelnummer: 	175309
-- Datum: 				13/11/2015
-- Brief:				Counter
--------------------------------------------------
-- Library Declaration --
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std;

--------------------------------------------
--	   SUB ENTITY                          --
--------------------------------------------
ENTITY counter IS
PORT(
	clk				:IN			std_logic;--Clock 50MHz
	clr			:IN			std_logic; --State of the clear button
	start			:IN			std_logic; --State of start/stop button 
	incSec		:IN			std_logic; --State of increment second's button
	incMin		:IN			std_logic; --State of increment minute's button

	snSecIn			:IN 				INTEGER; --Single number of the second coming from the decounter
	tSecIn			:IN 				INTEGER; --Tens of the second coming from the decounter
	snMinIn			:IN 				INTEGER; --Single number of the minute coming from the decounter
	tMinIn			:IN 				INTEGER; --Tens of the minute coming from the decounter
	
	timeOver			:IN				std_logic; --Time over coming from the decounter
	
	
	changeIn		:IN				std_logic; --Change coming from the decounter
	
	changeOut			:OUT				std_logic; --Change of the counter going to the decounter
	
	snSecOut			:OUT 				INTEGER;--Single number of the second going to the decounter
	tSecOut			:OUT 				INTEGER; --Tens of the second coming going to the decounter
	snMinOut			:OUT 				INTEGER;--Single number of the minute going to the decounter
	tMinOut			:OUT 				INTEGER --Tens of the minute going to the decounter
	);
END counter;

--------------------------------------------
--        ARCHITECTURE	                  --
--------------------------------------------
ARCHITECTURE Behaviour OF counter IS
-- Interne signal declaration --

--Intern value
SIGNAL snSec			:INTEGER		:=0;
SIGNAL tSec				:INTEGER		:=0;
SIGNAL snMin			:INTEGER		:=0;
SIGNAL tMin				:INTEGER		:=0;


SIGNAL 	snSecSave	:INTEGER		:=0;	--Single number value for the seconds
SIGNAL	tSecSave		:INTEGER		:=0;	--Tens value for the seconds
SIGNAL	snMinSave		:INTEGER		:=0;	--Single number value for the minutes
SIGNAL	tMinSave		:INTEGER		:=0;	--Tens value for the minutes

SIGNAL 	tmOv					:std_logic 	:='0';

SIGNAL 	change		:std_logic:='0';

SIGNAL 	precState	:std_logic :='0';



BEGIN

-- Count second Process --
count_sec_proc : PROCESS (clk, clr, start, incSec, incMin)
	BEGIN
		IF(clk'EVENT AND clk='1') THEN
			--if in a moment the time is over save it
			IF(timeOver='1') THEN
				tmOv<='1';
			END IF;
			
			--Stop state
			IF(start='0')THEN

				--Change of the time coming from the decounter -> timer isn't over anymore
				IF(changeIn='1') THEN
					tmOv<='0';
				END IF;
			
			
				--If the timer was over -> begin the counter with the last saved value
				IF(tmOv='1') THEN
					snSec<=snSecSave;
					tSec<=tSecSave;
					snMin<=snMinSave;
					tMin<=tMinSave;
					change<='1';
				--timer isn't over and last state was a start -> begin the counter with the value coming from the decounter
				ELSIF (tmOv='0') AND (precState='1') THEN
					--Last state is a stop
					precState<='0';
					snSec<=snSecIn;
					tSec<=tSecIn;
					snMin<=snMinIn;
					tMin<=tMinIn;
				END IF;
								
				--State of the debounced clr button is a high state
				IF(clr='1')THEN
					snSec<=0;
					tSec<=0;
					snMin<=0;
					tMin<=0;
					--Time changed
					change<='1';
				END IF;

				--State of the debounced increment second button is a high state
				IF(incSec='1')THEN
					IF(snSec=9) THEN
						IF(tSec=5) THEN
							tSec<=0;
							
						ELSE
							tSec<=tSec+1;
						END IF;
						
						snSec<=0;
						
					ELSE
						snSec<=snSec+1;
					END IF;
					
					--Time changed
					change<='1';
						
				END IF;
				
				--State of the debounced increment minute button is a high state
				IF(incMin='1')THEN
					
					IF(snMin=9) THEN
						IF(tMin=9) THEN
							tMin<=0;
							
						ELSE
							tMin<=tMin+1;
						END IF;
						
						snMin<=0;
						
					ELSE
						snMin<=snMin+1;
					END IF;
					
					--Time changed
					change<='1';
								
				END IF;
					
				--If a change occured in the counter -> save the time 
				IF(change='1') THEN
					change<='0';
					snSecSave<=snSec;
					tSecSave<=tSec;
					snMinSave<=snMin;
					tMinSave<=tMin;
				END IF;

				--Send the time to the decounter
				snSecOut<=snSec;
				tSecOut<=tSec;
				snMinOut<=snMin;
				tMinOut<=tMin;	
				
			--Start case
			ELSE
				--Last state is a start
				precState<='1';
			END IF;
	
			changeOut<=change;
		END IF;	
	
		
END PROCESS count_sec_proc;


END Behaviour;