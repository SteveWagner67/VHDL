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
		countVal		:IN		INTEGER;--Value in second of the counter		
		
		decVal		:OUT		INTEGER;--Value of the decounter
		snSecVal		:OUT		INTEGER;--Single number value for the seconds
		tSecVal		:OUT 		INTEGER;--Tens value for the seconds
		snMinVal		:OUT 		INTEGER;--Single number value for the minutes
		tMinVal		:OUT 		INTEGER--Tens value for the minutes	
	 );
END decounter;


ARCHITECTURE Behaviour OF decounter IS
--- Intern Signal Declaration ----
SIGNAL internCount :INTEGER	:=0; --Intern counter value
SIGNAL decount		 :std_logic :='1';



BEGIN

-- Registered Process --
dec_proc : PROCESS (clk, clk1Hz,startBtn)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			--Stop
			IF (startBtn='0') THEN
				--Save the value of the counter
				IF(countVal<=0) THEN
					internCount<=0;
				
				ELSE
					internCount<=countVal;
				END IF;
			
			
	
			--Start
			ELSE
				--1 second passed
				IF(clk1Hz='1') AND (decount='1') THEN	
					decount<='0';
					internCount<=internCount-1;
					IF(internCount<=0) THEN
						internCount<=0;
					END IF;
						
				ELSIF (clk1Hz='0') THEN
					decount<='1';
				END IF;
			END IF;			
			decVal<=internCount;
		END IF;
		
		
		
END PROCESS dec_proc;

convert_proc : PROCESS (clk, internCount)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			tMinVal<=(internCount/600);
			snMinVal<=((internCount mod 600)/60);
			tSecVal<=(((internCount mod 600) mod 60)/10);
			snSecVal<=(((internCount mod 600) mod 60) mod 10);
		END IF;
	
END PROCESS convert_proc;

END Behaviour;

