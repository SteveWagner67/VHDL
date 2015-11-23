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
		start				:IN			std_logic;		--Start/Stop state

		snSecIn			:IN			INTEGER;			--Single number value for the seconds coming from the counter
		tSecIn			:IN 			INTEGER;			--Tens value for the seconds coming from the counter
		snMinIn			:IN 			INTEGER;			--Single number value for the minutes coming from the counter
		tMinIn			:IN 			INTEGER;			--Tens value for the minutes coming from the counter

		changeIn			:IN			std_logic;		--State of the change of the counter value
		
		changeOut		:OUT			std_logic;		--State of the change of the decounter value
		
		snSecOut			:OUT			INTEGER;			--Single number value for the seconds
		tSecOut			:OUT 			INTEGER;			--Tens value for the seconds
		snMinOut			:OUT 			INTEGER;			--Single number value for the minutes
		tMinOut			:OUT 			INTEGER			--Tens value for the minutes	
	 );
END decounter;


ARCHITECTURE Behaviour OF decounter IS
--- Intern Signal Declaration ----
SIGNAL 	tMin				:INTEGER		:=0;			--Single number value of the second internal
SIGNAL 	snMin		 		:INTEGER		:=0;			--Tens value of the second internal 
SIGNAL 	tSec 		 		:INTEGER		:=0;			--Single number value of the minutes internal
SIGNAL 	snSec		 		:INTEGER		:=0;			--Tens value of the minutes inernal

SIGNAL	precState		:std_logic 	:='1';		--Signal to wait of each rising edge of the 1Hz clock to decrement

BEGIN

-- Registered Process --
dec_proc : PROCESS (clk, clk1Hz, start)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			--Stop case
			IF (start='0') THEN
				--The value changed in counter
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
					
					--Informe the counter that the value changed
					changeOut<='1';
					
				ELSE
					changeOut<='0';
				END IF;
				
			--Start case
			ELSE
				IF(clk'EVENT AND clk='1')THEN	
					--1 second passed and precedent state's value is a low state of the clock
					IF(clk1Hz='1') AND (precState='1') THEN
						--Reset the precedent state value of the clock
						precState<='0';
						IF(snSec<=0) THEN
							IF(tSec<=0) THEN
								IF(snMin<=0) THEN
									IF(tMin<=0) THEN
										tMin<=0;
										snMin<=0;
										tSec<=0;
										snSec<=0;
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
					
						--Inform the counter that the value has changed
						changeOut<='1';
										
					ELSIF (clk1Hz='0') THEN
						--To be sure that it decrement every second and not every 20ns when clk1Hz='1'
						precState<='1';
						changeOut<='0';
								
					ELSE
						changeOut<='0';
					END IF;
				
				END IF;
			END IF;
			
			--Send the new value to the counter and the displays
			snSecOut<=snSec;
			tSecOut<=tSec;
			snMinOut<=snMin;
			tMinOut<=tMin;
			
		END IF;
		
END PROCESS dec_proc;

END Behaviour;

