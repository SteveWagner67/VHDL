--------------------------------------------------
-- Author: 				Steve Wagner
-- Matrikelnummer: 	175309
-- Datum: 				13/11/2015
-- Brief:				Timer - main file
--------------------------------------------------
-- Library Declaration --
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std;

--------------------------------------------
--	   TOP ENTITY                          --
--------------------------------------------
ENTITY timer IS
PORT(
	--Input on the board--
	clrBtn			:IN			std_logic; --Button clear
	startBtn			:IN			std_logic; --Button Start/Stop
	incSecBtn		:IN			std_logic; --Button for increment of the seconds
	incMinBtn		:IN			std_logic; --Button for increment of the minutes
	clk50MHz			:IN			std_logic; --Clock 50MHz
	
	
	endIndicLed		:OUT			std_logic_vector(8 downto 0); --Led to indicate the end of the timer
	
	--7 bits for 7Segment for the single number of the second
	snsSeg			:OUT 			std_logic_vector(6 downto 0);		
	
	--7 bits for 7Segment for the single number of the second
	tsSeg				:OUT 			std_logic_vector(6 downto 0);
	
	--7 bits for 7Segment for the single number of the minute
	snmSeg			:OUT 			std_logic_vector(6 downto 0);		
	
	--7 bits for 7Segment for the single number of the minute
	tmSeg				:OUT 			std_logic_vector(6 downto 0)
	
	);
END timer;

--------------------------------------------
--        ARCHITECTURE	                  --
--------------------------------------------
ARCHITECTURE Behaviour OF timer IS

--Intern signal declaration
SIGNAL 	countValue	:INTEGER 	:=0;	--Counter value in second
SIGNAL	decValue		:INTEGER		:=0;	--Decounter value in second
SIGNAL   clk1Hz		:std_logic	:='0';--Clock 1Hz
SIGNAL   clkQ1Hz		:std_logic	:='0';--Clock 1/4Hz
SIGNAL   freq3kHz		:std_logic	:='0';--Frequency of 3kHz

SIGNAL 	snSecValIn		:INTEGER		:=0;	--Single number value for the seconds
SIGNAL	tSecValIn		:INTEGER		:=0;	--Tens value for the seconds
SIGNAL	snMinValIn		:INTEGER		:=0;	--Single number value for the minutes
SIGNAL	tMinValIn		:INTEGER		:=0;	--Tens value for the minutes	
SIGNAL 	timeOver		:std_logic	:='0';--Time over

SIGNAL 	bStart		:std_logic  :='0';--state of the start/stop button
SIGNAL   bipSig		:std_logic	:='0';--Signal for the bipper


SIGNAL   debug		:std_logic	:='0';--debug
SIGNAL	qSecond		:INTEGER		:=0;	--debug

SIGNAL 	snSecValOut		:INTEGER		:=0;	--Single number value for the seconds
SIGNAL	tSecValOut		:INTEGER		:=0;	--Tens value for the seconds
SIGNAL	snMinValOut		:INTEGER		:=0;	--Single number value for the minutes
SIGNAL	tMinValOut		:INTEGER		:=0;	--Tens value for the minutes	

SIGNAL  	pushStart		:std_logic	:='0';

SIGNAL 	changCnt			:std_logic	:='0';
SIGNAL 	changDcnt			:std_logic	:='0';

SIGNAL 	tmOv					:std_logic 	:='0'; --debug

SIGNAL	dbcStart			:std_logic:='0'; 			--Start button after deboucing
SIGNAL 	dbcIncSec		:std_logic:='0';			--Increment second button after debouncing
SIGNAL 	dbcIncMin		:std_logic:='0';			--Increment minute button after deboucing
SIGNAL 	dbcClr			:std_logic:='0';			--Clear button after deboucing
--Component declaration

--Debounce
COMPONENT debounce 
PORT(
		clk50M			:IN			std_logic; 		--Clock 50MHz
		button			:IN			std_logic;		--Button to debounce
		push				:OUT			std_logic 		--Real push or not
	);
END COMPONENT;

--Frequency
COMPONENT freqDiv
PORT(
	clk50M				:IN			std_logic;--Clock 50MHz
	en						:IN			std_logic;--Enable the clock
	periodns				:IN			INTEGER;  --Period of the signal in ns
	clkOut				:OUT			std_logic --Clock output
	);
END COMPONENT;


--Counter
COMPONENT counter
PORT(
	clk					:IN			std_logic;--Clock 50MHz
	clrBtn				:IN			std_logic;--Button Clear
	bStart				:IN			std_logic;--State of start/stop button
	incSecBtn			:IN			std_logic;--Button for increment of the seconds
	incMinBtn			:IN			std_logic;--Button for increment of the minutes
	
	debug				:OUT	std_logic;

	
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
END COMPONENT;


--Decounter
COMPONENT decounter
PORT(
		clk				:IN			std_logic;--Clock 50MHz
		clk1Hz			:IN			std_logic;--Clock 1Hz
		startBtn			:IN			std_logic;--Button for Start/Stop

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
END COMPONENT;


--Display on 7-Segment
COMPONENT display
PORT(
		clk					:IN			std_logic;--Clock 50MHz
		nbVal				:IN			INTEGER;--Value at integer of a number
		sgm				:OUT 			std_logic_vector(6 downto 0)--Value in  bits for the segment (g downto a)
	);
END COMPONENT;


--Audio
COMPONENT audio
PORT(
	clk					:IN			std_logic;--Clock 50MHz
	clkQHz				:IN			std_logic; --Clock 1/4Hz
	freqSignal			:IN			std_logic; --Signal frequency
	timeOver				:IN			std_logic; --Time over
	decValue				:IN			INTEGER; --Value of the decounter
	bipLed				:OUT			std_logic_vector(8 downto 0); --Led to show the end of the decounter
	debug			:OUT			INTEGER;
	bipper				:OUT			std_logic
	);
END COMPONENT;



BEGIN



button_proc : PROCESS (clk50MHz, startBtn)
	BEGIN
		IF (clk50MHz'EVENT AND clk50MHz='1') THEN
--			IF(startBtn = '0') THEN
--				pushStart<='1';
--			END IF;
--	
--			IF(pushStart='1')THEN
--				--Wait of the start's button is released
--				IF(startBtn='1') THEN
--					pushStart<='0';
--					bStart<= NOT bStart;
--				END IF;
--			END IF;

			IF(dbcStart='1') THEN
				bStart<= NOT bStart;
			END IF;
		END IF;
END PROCESS button_proc;



timeOver_proc : PROCESS (clk50MHz, bStart, snSecValOut, tSecValOut, snMinValOut, tMinValOut)
	BEGIN
		--Time is over
		IF (clk50MHz'EVENT AND clk50MHz='1') THEN
			IF (snSecValOut=0) AND (tSecValOut=0) AND (snMinValOut=0) AND (tMinValOut=0) AND (bStart='1') THEN
				timeOver<='1';
			ELSE
				timeOver<='0';		
			END IF;
		END IF;
END PROCESS timeOver_proc;



	

--Component Instantiation (the signals in the port map are from the entity or the intern signal declared in this file!)

--Debounce the start button
startDbc : COMPONENT debounce
PORT MAP (clk50MHz, startBtn, dbcStart);

--Debounce the increment second button
incSecDbc : COMPONENT debounce
PORT MAP (clk50MHz, incSecBtn, dbcIncSec);

--Debounce the increment minute button
incMinDbc : COMPONENT debounce
PORT MAP (clk50MHz, incMinBtn, dbcIncMin);

--Debounce the clear button
clrDbc : COMPONENT debounce
PORT MAP (clk50MHz, clrBtn, dbcClr);

--Clock 1Hz
clock1Hz : COMPONENT freqDiv
PORT MAP (clk50MHz, bStart, 1000000000, clk1Hz); --1.000.000.000ns -> 1s - TEST 500

--Clock 1/4Hz
clockQHz : COMPONENT freqDiv
PORT MAP (clk50MHz, timeOver, 250000000, clkQ1Hz); --250.000.000 ns -> 250ms - TEST 250

--Signal's frequency 3kHz
freqSignal : COMPONENT freqDiv
PORT MAP (clk50MHz, bipSig, 333333, freq3kHz); --333.333ns - TEST 33

--Counter
count : COMPONENT counter
PORT MAP (clk50MHz, clrBtn, bStart, dbcIncSec, dbcIncMin, debug, snSecValOut, tSecValOut, snMinValOut, tMinValOut, timeOver,changDcnt, changCnt, tmOv, snSecValIn, tSecValIn, snMinValIn, tMinValIn);

--Decounter
decount : COMPONENT decounter
PORT MAP (clk50MHz, clk1Hz, bStart, snSecValIn, tSecValIn, snMinValIn, tMinValIn, changCnt, changDcnt, snSecValOut, tSecValOut, snMinValOut, tMinValOut);

--Display the single numbers of a second on a segment
dispSnSec: COMPONENT display
PORT MAP (clk50MHz, snSecValOut, snsSeg);

--Display the tens of a second on a segment
dispTSec: COMPONENT display
PORT MAP (clk50MHz, tSecValOut, tsSeg);

--Display the single numbers of a minute on a segment
dispSnMin: COMPONENT display
PORT MAP (clk50MHz, snMinValOut, snmSeg);

--Display the tens of a second on a minute
dispTMin: COMPONENT display
PORT MAP (clk50MHz, tMinValOut, tmSeg);

--Audio
bipper : COMPONENT audio
PORT MAP (clk50MHz, clkQ1Hz, freq3kHz, timeOver, decValue, endIndicLed, qSecond, bipSig);



END Behaviour;