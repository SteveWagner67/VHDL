-------------------------------------------
-- Author: Steve Wagner
-- Matrikelnummer: 175309
-- Datum: 	10/11/2015
--------------------------------------------

-- Library Declaration --
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

--------------------------------------------
--	   TOP ENTITY	                      --
--------------------------------------------
ENTITY bcdDecoder IS
PORT(
	--Should be written to have the same parameters as in the component bcdcounter
	rst				:IN		std_logic; --Reset
	clk				:IN		std_logic; --Clock 1Hz
	en					:IN		std_logic; --Enable

	--7-Segment Input--
	a_seg				:OUT		std_logic;
	b_seg				:OUT 		std_logic;
	c_seg				:OUT		std_logic;
	d_seg				:OUT		std_logic;
	e_seg				:OUT		std_logic;
	f_seg				:OUT 		std_logic;
	g_seg				:OUT		std_logic
	);
END bcdDecoder;


--------------------------------------------
--        ARCHITECTURE	                    --
--------------------------------------------
ARCHITECTURE Behaviour OF bcdDecoder IS
-- Interne signal declaration --
SIGNAL b0, b1, b2, b3	: std_logic; -- represents bx_cod from bcdCounter


--Component declaration --
COMPONENT bcdcounter
PORT(
	rst				:IN		std_logic; --Reset
	clk				:IN		std_logic; --Clock 1Hz
	en					:IN		std_logic; --Enable
	--Output Coder
	b0_cod			:OUT		std_logic; --LSB
	b1_cod			:OUT		std_logic;
	b2_cod			:OUT		std_logic;
	b3_cod			:OUT		std_logic  --MSB
	
	);
END COMPONENT;



BEGIN

-- Decoder Process - if a change of b0 b1 b2 or b3 occurs--	
decoder_proc : PROCESS (b0, b1, b2, b3)
	BEGIN
		-- 0 --
		IF (b0='0') AND (b1='0') AND (b2='0') AND (b3='0') THEN
			a_seg <= '0';
			b_seg <= '0';
			c_seg <= '0';
			d_seg <= '0';
			e_seg <= '0';
			f_seg <= '0';
			g_seg <= '1';
	
		-- 1 --
		ELSIF (b0='1') AND (b1='0') AND (b2='0') AND (b3='0') THEN
			a_seg <= '1';
			b_seg <= '0';
			c_seg <= '0';
			d_seg <= '1';
			e_seg <= '1';
			f_seg <= '1';
			g_seg <= '1';
		
		-- 2 --
		ELSIF (b0='0') AND (b1='1') AND (b2='0') AND (b3='0') THEN
			a_seg <= '0';
			b_seg <= '0';
			c_seg <= '1';
			d_seg <= '0';
			e_seg <= '0';
			f_seg <= '1';
			g_seg <= '0';
		
		-- 3 --
		ELSIF (b0='1') AND (b1='1') AND (b2='0') AND (b3='0') THEN
			a_seg <= '0';
			b_seg <= '0';
			c_seg <= '0';
			d_seg <= '0';
			e_seg <= '1';
			f_seg <= '1';
			g_seg <= '0';
		
		-- 4 --	
		ELSIF (b0='0') AND (b1='0') AND (b2='1') AND (b3='0') THEN
			a_seg <= '1';
			b_seg <= '0';
			c_seg <= '0';
			d_seg <= '1';
			e_seg <= '1';
			f_seg <= '0';
			g_seg <= '0';
		
		-- 5 --
		ELSIF (b0='1') AND (b1='0') AND (b2='1') AND (b3='0') THEN
			a_seg <= '0';
			b_seg <= '1';
			c_seg <= '0';
			d_seg <= '0';
			e_seg <= '1';
			f_seg <= '0';
			g_seg <= '0';
		
		-- 6 --
		ELSIF (b0='0') AND (b1='1') AND (b2='1') AND (b3='0') THEN
			a_seg <= '0';
			b_seg <= '1';
			c_seg <= '0';
			d_seg <= '0';
			e_seg <= '0';
			f_seg <= '0';
			g_seg <= '0';
		
		-- 7 --
		ELSIF (b0='1') AND (b1='1') AND (b2='1') AND (b3='0') THEN
			a_seg <= '0';
			b_seg <= '0';
			c_seg <= '0';
			d_seg <= '1';
			e_seg <= '1';
			f_seg <= '1';
			g_seg <= '1';
		
		-- 8 --
		ELSIF (b0='0') AND (b1='0') AND (b2='0') AND (b3='1') THEN
			a_seg <= '0';
			b_seg <= '0';
			c_seg <= '0';
			d_seg <= '0';
			e_seg <= '0';
			f_seg <= '0';
			g_seg <= '0';
		
		-- 9 --
		ELSIF (b0='1') AND (b1='0') AND (b2='0') AND (b3='1') THEN
			a_seg <= '0';
			b_seg <= '0';
			c_seg <= '0';
			d_seg <= '0';
			e_seg <= '1';
			f_seg <= '0';
			g_seg <= '0';
		END IF;
END PROCESS decoder_proc;

-- Instantiation of the component declared above in the architecture with the entity 
countDec: COMPONENT bcdcounter
PORT MAP(
		 rst    => rst,				
		 clk	  => clk,	
		 en	  => en,		
		 b0_cod => b0 ,
		 b1_cod => b1 ,
		 b2_cod => b2 ,
		 b3_cod => b3
		);


END Behaviour;