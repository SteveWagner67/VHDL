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
SIGNAL 	snSecVal		:INTEGER		:=0;	--Single number value for the seconds
SIGNAL	tSecVal		:INTEGER		:=0;	--Tens value for the seconds
SIGNAL	snMinVal		:INTEGER		:=0;	--Single number value for the minutes
SIGNAL	tMinVal		:INTEGER		:=0;	--Tens value for the minutes	
SIGNAL 	timeOver		:std_logic	:='0';--Time over

SIGNAL 	bStart		:std_logic  :='0';--state of the start/stop button
SIGNAL   bipSig		:std_logic	:='0';--Signal for the bipper


SIGNAL   debug		:std_logic	:='0';--debug
SIGNAL	second		:INTEGER		:=0;	--debug

--Component declaration


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
	
	--Value at number fo the second's units
	counterValue		:OUT 			INTEGER
	);
END COMPONENT;


--Decounter
COMPONENT decounter
PORT(
		clk				:IN			std_logic;--Clock 50MHz
		clk1Hz			:IN			std_logic;--Clock 1Hz
		startBtn			:IN			std_logic;--Button for Start/Stop
		countVal			:IN			INTEGER;	 --Value in second of the counter		
		
		decVal			:OUT			INTEGER;	--Value of the decounter
		snSecVal			:OUT			INTEGER;--Single number value for the seconds
		tSecVal			:OUT 			INTEGER;--Tens value for the seconds
		snMinVal			:OUT 			INTEGER;--Single number value for the minutes
		tMinVal			:OUT 			INTEGER--Tens value for the minutes		
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
		IF(startBtn = '0') AND (clk50MHz'EVENT AND clk50MHz='1') THEN
			bStart<= NOT bStart;
		END IF;
	
END PROCESS button_proc;


--convert_proc : PROCESS (countValue)
--	BEGIN
--		tMinVal<=(countValue/600);
--		snMinVal<=((countValue mod 600)/60);
--		tSecVal<=(((countValue mod 600) mod 60)/10);
--		snSecVal<=(((countValue mod 600) mod 60) mod 10);
	
--END PROCESS convert_proc;

timeOver_proc : PROCESS (clk50MHz, bStart, snSecVal, tSecVal, snMinVal, tMinVal)
	BEGIN
		--Time is over
		IF (clk50MHz'EVENT AND clk50MHz='1') THEN
			IF (snSecVal=0) AND (tSecVal=0) AND (snMinVal=0) AND (tMinVal=0) AND (bStart='1') THEN
				timeOver<='1';
			ELSE
				timeOver<='0';		
			END IF;
		END IF;
END PROCESS timeOver_proc;



	

--Component Instantiation (the signals in the port map are from the entity or the intern signal declared in this file!)
--Clock 1Hz
clock1Hz : COMPONENT freqDiv
PORT MAP (clk50MHz, bStart, 1000, clk1Hz); --1.000.000.000ns -> 1s

--Clock 1/4Hz
clockQHz : COMPONENT freqDiv
PORT MAP (clk50MHz, timeOver, 250, clkQ1Hz); --125.000.000 ns -> 125ms

--Signal's frequency 1kHz
freqSignal : COMPONENT freqDiv
PORT MAP (clk50MHz, bipSig, 33, freq3kHz); --1.000.000ns

--Counter
count : COMPONENT counter
PORT MAP (clk50MHz, clrBtn, bStart, incSecBtn, incMinBtn, debug, countValue);

--Decounter
decount : COMPONENT decounter
PORT MAP (clk50MHz, clk1Hz, bStart, countValue, decValue, snSecVal, tSecVal, snMinVal, tMinVal);


--Display the single numbers of a second on a segment
dispSnSec: COMPONENT display
PORT MAP (clk50MHz, snSecVal, snsSeg);


--Display the tens of a second on a segment
dispTSec: COMPONENT display
PORT MAP (clk50MHz, tSecVal, tsSeg);


--Display the single numbers of a minute on a segment
dispSnMin: COMPONENT display
PORT MAP (clk50MHz, snMinVal, snmSeg);


--Display the tens of a second on a minute
dispTMin: COMPONENT display
PORT MAP (clk50MHz, tMinVal, tmSeg);


--Audio
bipper : COMPONENT audio
PORT MAP (clk50MHz, clkQ1Hz, freq3kHz, timeOver, decValue, endIndicLed, second, bipSig);



END Behaviour;