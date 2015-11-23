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
	clk				:IN			std_logic;		--Clock 50MHz
	clr				:IN			std_logic;		--Clear state
	start				:IN			std_logic; 		--Start/Stop state
	incSec			:IN			std_logic; 		--Increment second's state
	incMin			:IN			std_logic; 		--Increment minute's state
	
	snSecIn			:IN 			INTEGER;			--Single number of the second coming from the decounter
	tSecIn			:IN 			INTEGER;			--Tens of the second coming from the decounter
	snMinIn			:IN 			INTEGER;			--Single number of the minute coming from the decounter
	tMinIn			:IN 			INTEGER;			--Tens of the second coming from the decounter
	
	timeOver			:IN			std_logic;		--Timeover state
	
	changeIn			:IN			std_logic;		--State of the change of the decounter value
	
	changeOut		:OUT			std_logic;		--State of the change of the counter value
		
	snSecOut			:OUT 			INTEGER;			--Single number of the seconds
	tSecOut			:OUT 			INTEGER;			--Tens of the seconds
	snMinOut			:OUT 			INTEGER;			--Single number of the minutes
	tMinOut			:OUT 			INTEGER 			--Tens of the minutes
	);
END counter;

--------------------------------------------
--        ARCHITECTURE	                  --
--------------------------------------------
ARCHITECTURE Behaviour OF counter IS
-- Interne signal declaration --
SIGNAL 	snSec				:INTEGER	:=0;			--Single number value for the seconds used internal
SIGNAL	tSec				:INTEGER	:=0;			--Tens value for the seconds used internal
SIGNAL 	snMin				:INTEGER	:=0;			--Single number value for the minute used internal
SIGNAL 	tMin				:INTEGER	:=0;			--Tens value of the minute used internal

SIGNAL 	snSecSave		:INTEGER	:=0;			--Single number value for the seconds saved during decounting
SIGNAL	tSecSave			:INTEGER	:=0;			--Tens value for the seconds saved during decounting
SIGNAL	snMinSave		:INTEGER	:=0;			--Single number value for the minutes saved during decounting
SIGNAL	tMinSave			:INTEGER	:=0;			--Tens value for the minutes saved during decounting

SIGNAL 	tmOv				:std_logic:='0';		--Timeover

SIGNAL 	change			:std_logic:='0';		--Change of the value internal

SIGNAL 	precState		:std_logic :='0';		--Last state (start/stop)


BEGIN

-- Count second Process --
count_sec_proc : PROCESS (clk, clr, start, incSec, incMin)
	BEGIN
		IF(clk'EVENT AND clk='1') THEN
			--if in a moment the time is over save it
			IF(timeOver='1') THEN
				tmOv<='1';
			END IF;
			
			--Stop case
			IF(start='0')THEN

				--Value of the decounter has changed
				IF(changeIn='1') THEN
					tmOv<='0';
				END IF;
						
				--If the timer was over
				IF(tmOv='1') THEN
					snSec<=snSecSave;
					tSec<=tSecSave;
					snMin<=snMinSave;
					tMin<=tMinSave;
					change<='1';
				--timer isn't over and last state was a start
				ELSIF (tmOv='0') AND (precState='1') THEN
					precState<='0';
					snSec<=snSecIn;
					tSec<=tSecIn;
					snMin<=snMinIn;
					tMin<=tMinIn;
				END IF;
							
				--clear button pressed
				IF(clr='0')THEN
					snSec<=0;
					tSec<=0;
					snMin<=0;
					tMin<=0;
					--Value change
					change<='1';
				END IF;

				--increment second button pressed
				IF(incSec ='1') THEN
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
					--Value changed 
					change<='1';
						
				END IF;
				
				--increment minute button pressed
				IF(incMin='1') THEN
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
					--value changed
					change<='1';
					
				END IF;
					
				--Save the value if changed
				IF(change='1') THEN
					--Reset the state of change value 
					change<='0';
					snSecSave<=snSec;
					tSecSave<=tSec;
					snMinSave<=snMin;
					tMinSave<=tMin;
				END IF;	
				
				--Send the value even if it isn't changed
				snSecOut<=snSec;
				tSecOut<=tSec;
				snMinOut<=snMin;
				tMinOut<=tMin;	
				
			--start
			ELSE
				--To know that it was in start case
				precState<='1';
			END IF;
			-- To inform the decounter that the counter value has changed or not
			changeOut<=change;
		END IF;	
	
		
END PROCESS count_sec_proc;


END Behaviour;