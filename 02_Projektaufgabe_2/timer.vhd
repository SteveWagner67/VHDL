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
		clrBtn			:IN			std_logic; 		--Button clear
		startBtn			:IN			std_logic; 		--Button Start/Stop
		incSecBtn		:IN			std_logic; 		--Button for increment the seconds
		incMinBtn		:IN			std_logic; 		--Button for increment the minutes
	
		clk50MHz			:IN			std_logic; 		--Clock 50MHz
	
		endIndicLed		:OUT			std_logic_vector(8 downto 0); --Led to indicate the end of the timer
		
		snsSeg			:OUT 			std_logic_vector(6 downto 0);	--7-bits-vector for 7-Segment for the single number of the second	 
		tsSeg				:OUT 			std_logic_vector(6 downto 0); --7-bits-vector for 7-Segment for the single number of the second
		snmSeg			:OUT 			std_logic_vector(6 downto 0);	--7-bits-vector for 7-Segment for the single number of the minute	
		tmSeg				:OUT 			std_logic_vector(6 downto 0);  --7-bits-vector for 7-Segment for the single number of the minute
		
		bipOut			:OUT			std_logic		--Output for the signal head (pin28 for the signal and pin30 for the ground)
	
	);
END timer;

--------------------------------------------
--        ARCHITECTURE	                  --
--------------------------------------------
ARCHITECTURE Behaviour OF timer IS

--Intern signal declaration
SIGNAL		dbcStart			:std_logic:='0'; 		--Start button after deboucing
SIGNAL 		dbcIncSec		:std_logic:='0';		--Increment second button after debouncing
SIGNAL 		dbcIncMin		:std_logic:='0';		--Increment minute button after deboucing
SIGNAL 		dbcClr			:std_logic:='0';		--Clear button after deboucing

SIGNAL   	clk1Hz			:std_logic:='0';		--Clock 1Hz
SIGNAL   	clkQ1Hz			:std_logic:='0';		--Clock 1/4Hz
SIGNAL   	freq3kHz			:std_logic:='0';		--Frequency of 3kHz

SIGNAL 		snSecIn			:INTEGER		:=0;		--Single number value for the seconds
SIGNAL		tSecIn			:INTEGER		:=0;		--Tens value for the seconds
SIGNAL		snMinIn			:INTEGER		:=0;		--Single number value for the minutes
SIGNAL		tMinIn			:INTEGER		:=0;		--Tens value for the minutes	

SIGNAL 		timeOver			:std_logic:='0';		--Time over

SIGNAL 		start				:std_logic:='0';		--state of the start/stop button
SIGNAL   	bipSig			:std_logic:='0';		--Signal for the bipper

SIGNAL 	snSecOut				:INTEGER		:=0;		--Single number value for the seconds
SIGNAL	tSecOut				:INTEGER		:=0;		--Tens value for the seconds
SIGNAL	snMinOut				:INTEGER		:=0;		--Single number value for the minutes
SIGNAL	tMinOut				:INTEGER		:=0;		--Tens value for the minutes	

SIGNAL 	changeCnt			:std_logic:='0';	 	--For the change of the time in counter
SIGNAL 	changeDcnt			:std_logic:='0';	 	--For the change of the time in decounter



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
		clk50M			:IN			std_logic;		--Clock 50MHz
		en					:IN			std_logic;		--Enable the clock
		periodns			:IN			INTEGER; 		--Period of the signal in ns
		clkOut			:OUT			std_logic 		--Clock output
	);
END COMPONENT;


--Counter
COMPONENT counter
PORT(
		clk				:IN			std_logic;		--Clock 50MHz
		clr				:IN			std_logic;		--State of the clear button
		start				:IN			std_logic; 		--State of start/stop button 
		incSec			:IN			std_logic; 		--State of increment second's button
		incMin			:IN			std_logic; 		--State of increment minute's button

		snSecIn			:IN 			INTEGER; 		--Single number of the second coming from the decounter
		tSecIn			:IN 			INTEGER; 		--Tens of the second coming from the decounter
		snMinIn			:IN 			INTEGER; 		--Single number of the minute coming from the decounter
		tMinIn			:IN 			INTEGER; 		--Tens of the minute coming from the decounter
	
		timeOver			:IN			std_logic; 		--Time over coming from the decounter
	
		changeIn			:IN			std_logic; 		--Change coming from the decounter
		
		changeOut		:OUT			std_logic; 		--Change of the counter going to the decounter
	
		snSecOut			:OUT 			INTEGER;			--Single number of the second going to the decounter
		tSecOut			:OUT 			INTEGER; 		--Tens of the second coming going to the decounter
		snMinOut			:OUT 			INTEGER;			--Single number of the minute going to the decounter
		tMinOut			:OUT 			INTEGER 			--Tens of the minute going to the decounter
	);
END COMPONENT;


--Decounter
COMPONENT decounter
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
END COMPONENT;


--Display on 7-Segment
COMPONENT display
PORT(
		clk				:IN			std_logic;		--Clock 50MHz
		nb					:IN			INTEGER;			--Number to display
		sgm				:OUT 			std_logic_vector(6 downto 0)	--7-bits-vector number for the segment (g downto a)
	);
END COMPONENT;


--Audio
COMPONENT audio
PORT(
		clk				:IN			std_logic;		--Clock 50MHz
		clkQHz			:IN			std_logic; 		--Clock 1/4Hz
		freqSignal		:IN			std_logic;		--Signal frequency
	
		timeOver			:IN			std_logic; 		--Time over
	
		bipLed			:OUT			std_logic_vector(8 downto 0); --Led to show the end of the decounter
		bipper			:OUT			std_logic		--Bipper
	);
END COMPONENT;



BEGIN


--Process to toggle start/stop state
button_proc : PROCESS (clk50MHz, startBtn)
	BEGIN
		IF (clk50MHz'EVENT AND clk50MHz='1') THEN
			--State of the debounce start
			IF(dbcStart='1') THEN
				start<= NOT start;
			END IF;
			
		END IF;
END PROCESS button_proc;


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
PORT MAP (clk50MHz, start, 1000000000, clk1Hz); --1.000.000.000ns -> 1s - TEST 500

--Clock 1/4Hz
clockQHz : COMPONENT freqDiv
PORT MAP (clk50MHz, timeOver, 250000000, clkQ1Hz); --250.000.000 ns -> 250ms - TEST 250

--Signal's frequency 3kHz
freqSignal : COMPONENT freqDiv
PORT MAP (clk50MHz, timeOver, 333333, freq3kHz); --333.333ns - TEST 50

--Counter
count : COMPONENT counter
PORT MAP (clk50MHz, dbcClr, start, dbcIncSec, dbcIncMin, snSecOut, tSecOut, snMinOut, tMinOut, timeOver,changeDcnt, changeCnt, snSecIn, tSecIn, snMinIn, tMinIn);

--Decounter
decount : COMPONENT decounter
PORT MAP (clk50MHz, clk1Hz, start, snSecIn, tSecIn, snMinIn, tMinIn, changeCnt, changeDcnt, timeOver, snSecOut, tSecOut, snMinOut, tMinOut);

--Display the single numbers of a second on a segment
dispSnSec: COMPONENT display
PORT MAP (clk50MHz, snSecOut, snsSeg);

--Display the tens of a second on a segment
dispTSec: COMPONENT display
PORT MAP (clk50MHz, tSecOut, tsSeg);

--Display the single numbers of a minute on a segment
dispSnMin: COMPONENT display
PORT MAP (clk50MHz, snMinOut, snmSeg);

--Display the tens of a second on a minute
dispTMin: COMPONENT display
PORT MAP (clk50MHz, tMinOut, tmSeg);

--Audio
bipper : COMPONENT audio
PORT MAP (clk50MHz, clkQ1Hz, freq3kHz, timeOver, endIndicLed, bipOut);



END Behaviour;