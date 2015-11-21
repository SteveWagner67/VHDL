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
		
-- TEST modulus OR division
--		countVal		:IN		INTEGER;--Value in second of the counter				
--		decVal		:OUT		INTEGER;--Value of the decounter
--		snSecVal		:OUT		INTEGER;--Single number value for the seconds
--		tSecVal		:OUT 		INTEGER;--Tens value for the seconds
--		snMinVal		:OUT 		INTEGER;--Single number value for the minutes
--		tMinVal		:OUT 		INTEGER--Tens value for the minutes	
-- END TEST modulus OR division

-- TEST AndLogic
		snSecIn		:IN		INTEGER;--Single number value for the seconds
		tSecIn		:IN 		INTEGER;--Tens value for the seconds
		snMinIn		:IN 		INTEGER;--Single number value for the minutes
		tMinIn		:IN 		INTEGER;--Tens value for the minutes	
		
		snSecOut		:OUT		INTEGER;--Single number value for the seconds
		tSecOut		:OUT 		INTEGER;--Tens value for the seconds
		snMinOut		:OUT 		INTEGER;--Single number value for the minutes
		tMinOut		:OUT 		INTEGER--Tens value for the minutes	

-- END TEST AndLogic
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


BEGIN

-- Registered Process --
dec_proc : PROCESS (clk, clk1Hz,startBtn)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
				
			--Stop
			IF (startBtn='0') THEN
-- TEST modulus OR division			
--				--Save the value of the counter
--				IF(countVal<=0) THEN
--					internCount<=0;
--				
--				ELSE
--					internCount<=countVal;
--				END IF;
-- END TEST modulus OR division	
			
-- TEST AndLogic
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
				
-- END TEST AndLogic		
			--Start
			ELSE
-- TEST modulus OR division			
				--1 second passed
--				IF(clk1Hz='1') AND (decount='1') THEN	
--					decount<='0';
--					internCount<=internCount-1;
--					IF(internCount<=0) THEN
--						internCount<=0;
--					END IF;
--						
--				ELSIF (clk1Hz='0') THEN
--					decount<='1';
--				END IF;
-- END TEST modulus OR division


-- TEST AndLogic
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
							END IF;
						ELSE
							snMin<=snMin-1;
						END IF;
					ELSE
						tSec<=tSec-1;
					END IF;			
				ELSE
					snSec<=snSec-1;
				END IF;

-- END TEST AndLogic
			END IF;	
-- TEST modulus OR division				
--			decVal<=internCount;
-- END TEST modulus OR division				
		END IF;
		
		
		
END PROCESS dec_proc;

-- TEST modulus OR division	
--convert_proc : PROCESS (clk, internCount)
--	BEGIN
--		IF (clk'EVENT AND clk='1') THEN
--	
---- TEST modulus
----			tMinVal<=(internCount/600);
----			snMinVal<=((internCount mod 600)/60);
----			tSecVal<=(((internCount mod 600) mod 60)/10);
----			snSecVal<=(((internCount mod 600) mod 60) mod 10);
---- END TEST modulus
--			
---- TEST division
----			tMin<=(internCount/600);
----			snMin<=((internCount/60)-(tMin*10));
----			tSec<=((internCount/10) - (tMin*60) - (snMin*6));
----			snSec<=(internCount - (tMin*600) - (snMin*60) - (tSec*10));
----					
----			tMinVal<=tMin;
----			snMinVal<=snMin;
----			tSecVal<=tSec;
----			snSecVal<=snSec;
---- END TEST division
--		END IF;
--	
--END PROCESS convert_proc;
-- END TEST modulus OR division	



convert_proc : PROCESS (clk, snSec, tSec, snMin, tMin)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			snSecOut<=snSec;
			tSecOut<=tSec;
			snMinOut<=snMin;
			tMinOut<=tMin;
		END IF;
	
END PROCESS convert_proc;

END Behaviour;

