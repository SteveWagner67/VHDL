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
		clk			:IN		std_logic;--Clock 50MHz
		clk1Hz		:IN		std_logic;--Clock 1Hz
		startBtn		:IN		std_logic;--Button for Start/Stop

		snSecIn		:IN		INTEGER;--Single number value for the seconds
		tSecIn		:IN 		INTEGER;--Tens value for the seconds
		snMinIn		:IN 		INTEGER;--Single number value for the minutes
		tMinIn		:IN 		INTEGER;--Tens value for the minutes	
		
		changIn		:IN		std_logic;
		
		changOut		:OUT		std_logic;
		
		snSecOut		:OUT		INTEGER;--Single number value for the seconds
		tSecOut		:OUT 		INTEGER;--Tens value for the seconds
		snMinOut		:OUT 		INTEGER;--Single number value for the minutes
		tMinOut		:OUT 		INTEGER--Tens value for the minutes	
	 );
END decounter;


ARCHITECTURE Behaviour OF decounter IS
--- Intern Signal Declaration ----
SIGNAL internCount :INTEGER	:=0; --Intern counter value
SIGNAL decount		 :std_logic :='1';

SIGNAL tMin			 :INTEGER	:=0;
SIGNAL snMin		 :INTEGER	:=0;
SIGNAL tSec 		 :INTEGER	:=0;
SIGNAL snSec		 :INTEGER	:=0;

SIGNAL valChang	:std_logic	:='0';

BEGIN

-- Registered Process --
dec_proc : PROCESS (clk, clk1Hz, startBtn)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			--Stop and value change by pressing a button (increments or clear)
			IF (startBtn='0') THEN
			
				IF(changIn='1') THEN
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
				
					changOut<='1';
					
				ELSE
					changOut<='0';
				END IF;
				
			--Start
			ELSE
				IF(clk'EVENT AND clk='1') THEN
				--1 second passed
					IF(clk1Hz='1') AND (decount='1') THEN	
						--To wait of the next rising edge of the clock
						decount<='0';
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
					
						changOut<='1';
					
					
					ELSIF (clk1Hz='0') THEN
						--To wait of the next rising edge of the clock
						decount<='1';
						changOut<='0';
								
					ELSE
						changOut<='0';
					END IF;
				
				END IF;
				
			END IF;
				
			snSecOut<=snSec;
			tSecOut<=tSec;
			snMinOut<=snMin;
			tMinOut<=tMin;
		END IF;
		
END PROCESS dec_proc;

END Behaviour;

