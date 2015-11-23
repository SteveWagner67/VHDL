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
	clr				:IN			std_logic; --Button Clear
	bStart			:IN			std_logic; --State of start/stop button 
	incSec			:IN			std_logic; --Button to increment the seconds
	incMin			:IN			std_logic; --Button to increment the minutes
	
	debug				:OUT			std_logic;

	snSecIn			:IN 				INTEGER;
	tSecIn			:IN 				INTEGER;
	snMinIn			:IN 				INTEGER;
	tMinIn			:IN 				INTEGER;
	
	timeOver			:IN				std_logic;
	
	
	vChangeIn		:IN				std_logic;
	
	vChangOut			:OUT				std_logic;
	
	
	tmOver			:OUT				std_logic; --debug
	
	snSecOut			:OUT 				INTEGER;
	tSecOut			:OUT 				INTEGER;
	snMinOut			:OUT 				INTEGER;
	tMinOut			:OUT 				INTEGER
	);
END counter;

--------------------------------------------
--        ARCHITECTURE	                  --
--------------------------------------------
ARCHITECTURE Behaviour OF counter IS
-- Interne signal declaration --
SIGNAL countSec 		:INTEGER		:=0;--Counter for the seconds
SIGNAL countMin 		:INTEGER 	:=0;--Counter for the minutes
SIGNAL internCount	:INTEGER   	:=0;


SIGNAl pushSec			:std_logic	:='0';
SIGNAL pushMin			:std_logic	:='0';

--Intern value
SIGNAL snSecInt			:INTEGER		:=0;
SIGNAL tSecInt				:INTEGER		:=0;
SIGNAL snMinInt			:INTEGER		:=0;
SIGNAL tMinInt				:INTEGER		:=0;


SIGNAL 	snSecSave	:INTEGER		:=0;	--Single number value for the seconds
SIGNAL	tSecSave		:INTEGER		:=0;	--Tens value for the seconds
SIGNAL	snMinSave		:INTEGER		:=0;	--Single number value for the minutes
SIGNAL	tMinSave		:INTEGER		:=0;	--Tens value for the minutes

SIGNAL 	tmOv					:std_logic 	:='0';

SIGNAL 	valChang		:std_logic:='0';

SIGNAL 	statePrec	:std_logic :='0';



BEGIN

-- Count second Process --
count_sec_proc : PROCESS (clk, clr, bStart, incSec, incMin)
	BEGIN
		IF(clk'EVENT AND clk='1') THEN
			--if in a moment the time is over save it
			IF(timeOver='1') THEN
				tmOv<='1';
			END IF;
			
			--Stop state
			IF(bStart='0')THEN

				--Value of the decounter has changed
				IF(vChangeIn='1') THEN
					tmOv<='0';
				END IF;
			
			
				--If the timer was over
				IF(tmOv='1') THEN
					snSecInt<=snSecSave;
					tSecInt<=tSecSave;
					snMinInt<=snMinSave;
					tMinInt<=tMinSave;
					valChang<='1';
				--timer isn't over and last state was a start
				ELSIF (tmOv='0') AND (statePrec='1') THEN
					statePrec<='0';
					snSecInt<=snSecIn;
					tSecInt<=tSecIn;
					snMinInt<=snMinIn;
					tMinInt<=tMinIn;
				END IF;
			
				
				
				--clear button tasted and rising edge of the clock
				IF(clr='0')THEN
					snSecInt<=0;
					tSecInt<=0;
					snMinInt<=0;
					tMinInt<=0;
					--Value change
					valChang<='1';
				END IF;


				IF(incSec ='1') THEN
					valChang<='1';
					IF(snSecInt=9) THEN
						IF(tSecInt=5) THEN
							tSecInt<=0;
							
						ELSE
							tSecInt<=tSecInt+1;
						END IF;
						
						snSecInt<=0;
						
					ELSE
						snSecInt<=snSecInt+1;
					END IF;
						
				END IF;
				
				
				IF(incMin='1') THEN
					--value changed
					valChang<='1';
					IF(snMinInt=9) THEN
						IF(tMinInt=9) THEN
							tMinInt<=0;
							
						ELSE
							tMinInt<=tMinInt+1;
						END IF;
						
						snMinInt<=0;
						
					ELSE
						snMinInt<=snMinInt+1;
					END IF;
				END IF;
					
				--Save the value if changed
				IF(valChang='1') THEN
					valChang<='0';
					snSecSave<=snSecInt;
					tSecSave<=tSecInt;
					snMinSave<=snMinInt;
					tMinSave<=tMinInt;
				END IF;	
				
				snSecOut<=snSecInt;
				tSecOut<=tSecInt;
				snMinOut<=snMinInt;
				tMinOut<=tMinInt;	
				
			--start
			ELSE
				statePrec<='1';
			END IF;
	
			vChangOut<=valChang;
			debug<=pushMin;
			tmOver<=tmOv;
		END IF;	
	
		
END PROCESS count_sec_proc;


END Behaviour;