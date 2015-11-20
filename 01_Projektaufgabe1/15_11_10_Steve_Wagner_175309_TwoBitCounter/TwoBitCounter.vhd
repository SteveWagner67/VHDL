-------------------------------------------
-- Author: Steve Wagner
-- Matrikelnummer: 175309
-- Datum: 	10/11/2015
--------------------------------------------
-- Library Declaration --
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

--------------------------------------------
--	   ENTITY	                        --
--------------------------------------------
ENTITY twobitcounter IS
PORT(
	reset		:IN	std_logic;
	clk		:IN	std_logic;
	up		:IN	std_logic;
	down		:IN	std_logic;
	q_0		:OUT	std_logic;
	q_1		:OUT	std_logic;
	b		:OUT	std_logic; --borrow
	c		:OUT	std_logic  --carry
	);
END twobitcounter;

--------------------------------------------
--        ARCHITECTURE	                    --
--------------------------------------------
ARCHITECTURE behave OF twobitcounter IS

TYPE state IS (st_0,st_1,st_2,st_3);
SIGNAL mode, nxt_mode : state;

BEGIN

-- Registered Process --
clk_proc : PROCESS (clk,reset)
	BEGIN
		IF (reset='0') THEN -- Active Low Reset --
			mode <= st_0;
		ELSIF (clk'EVENT AND clk='1' AND clk'LAST_VALUE='0') THEN
			mode <= nxt_mode;
		END IF;
	END PROCESS clk_proc;

-- Combinational Process --	
counter_proc : PROCESS (mode,up,down)
	BEGIN 
	CASE mode IS
	    	WHEN st_0 =>
	      	IF up='1' AND down='0' THEN
	         	nxt_mode <= st_1;
	      	ELSIF up='0' AND down='1' THEN 
	         	nxt_mode <= st_3;
	      	END IF;
			WHEN st_1 =>
				IF up='1' AND down='0' THEN
	         	nxt_mode <= st_2;
	      	ELSIF up='0' AND down='1' THEN 
	         	nxt_mode <= st_0;
	      	END IF;
			WHEN st_2 =>
				IF up='1' AND down='0' THEN
	         	nxt_mode <= st_3;
	      	ELSIF up='0' AND down='1' THEN 
	         	nxt_mode <= st_1;
				END IF;
			WHEN st_3 =>
				IF up='1' AND down='0' THEN
	         	nxt_mode <= st_0;
	      	ELSIF up='0' AND down='1' THEN 
	         	nxt_mode <= st_2;
				END IF;
	END CASE;
END PROCESS counter_proc;
	   
-- Output Process --
output_proc : PROCESS (mode,up,down)
	BEGIN
		IF mode=st_0 AND up='0' AND down='1' THEN 
			b<='1';
		ELSE b<='0';
		END IF;

		IF mode=st_3 AND up='1' AND down='0' THEN 
			c<='1';
		ELSE c<='0';
		END IF;
		
		IF mode=st_0 OR mode=st_1 THEN
			q_1<='0';
		ELSE q_1<='1';
		END IF;

		IF mode=st_0 OR mode=st_2 THEN
			q_0<='0';
		ELSE q_0<='1';
		END IF;
	END PROCESS;
END behave;
