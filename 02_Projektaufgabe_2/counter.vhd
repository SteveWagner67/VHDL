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
	clrBtn			:IN			std_logic; --Button Clear
	bStart			:IN			std_logic; --State of start/stop button 
	incSecBtn		:IN			std_logic; --Button to increment the seconds
	incMinBtn		:IN			std_logic; --Button to increment the minutes
	
	debug				:OUT			std_logic;
	
	
-- TEST modulus OR division
	--Value of the counter in seconds
--	counterValue	:OUT 			INTEGER
-- END TEST modulus OR division

-- TEST AndLogic
	snSec			:OUT 				INTEGER;
	tSec			:OUT 				INTEGER;
	snMin			:OUT 				INTEGER;
	tMin			:OUT 				INTEGER
-- END TEST AndLogic
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


SIGNAL snSecInt			:INTEGER		:=0;
SIGNAL tSecInt				:INTEGER		:=0;
SIGNAL snMinInt			:INTEGER		:=0;
SIGNAL tMinInt				:INTEGER		:=0;



BEGIN

-- Count second Process --
count_sec_proc : PROCESS (clk, clrBtn, bStart, incSecBtn, incMinBtn)
	BEGIN		
		
			--Stop state
			IF(bStart='0') THEN

			

				--Button to increment the seconds is tasted
				IF(incSecBtn='0') THEN
					pushSec<='1';
				END IF;
				
				
				--Button to increment the minutes is tasted
				IF(incMinBtn='0') THEN
					pushMin<='1';
				END IF;
				
				
				
				
-- TEST modulus OR division	
--				--clear button tasted
--				IF(clrBtn='0') THEN
--					countSec<=0;
--					countMin<=0;
--				END IF;
--			
--				IF(pushSec='1') THEN
--					--Button should be released to increment
--					IF(incSecBtn='1') THEN
--						pushSec<='0';
--						countSec<=countSec+1;
--					END IF;
--				END IF;
--				
--				
--				IF(pushMin='1') THEN
--					--Button should be released to increment
--					IF(incMinBtn='1') THEN
--						pushMin<='0';
--						countMin<=countMin+1;
--					END IF;
--				END IF;
-- END TEST modulus OR division	

-- TEST AndLogic
				--clear button tasted
				IF(clrBtn='0') THEN
					snSecInt<=0;
					tSecInt<=0;
					snMinInt<=0;
					tMinInt<=0;
				END IF;


				IF(pushSec='1') THEN
					--Button should be released to increment
					IF(incSecBtn='1') THEN
						pushSec<='0';
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
				END IF;
				
				
				IF(pushMin='1') THEN
					--Button should be released to increment
					IF(incMinBtn='1')THEN
						pushMin<='0';
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
				END IF;
				
				IF (clk'EVENT AND clk='1') THEN
					snSec<=snSecInt;
					tSec<=tSecInt;
					snMin<=snMinInt;
					tMin<=tMinInt;
				END IF;
-- END TEST AndLogic								
			END IF;


-- TEST modulus OR division	
	
--			--TODO add here if countSec>=60 if the minute doesn't increment
--		
--			--Save the counter's value in second
--			internCount<=((countMin*60)+(countSec));
--		
--
--				--minimum 00m00m and maximum 99m59s
--				IF(internCount > 5999) OR (internCount < 0)  THEN
--					counterValue<=0;
--					internCount<=0;
--					countSec<=0;
--					countMin<=0;
--				ELSE
--					counterValue<=internCount;
--				END IF;
	
-- END TEST modulus OR division
	
			debug<=pushMin;
			
	
		
END PROCESS count_sec_proc;


END Behaviour;