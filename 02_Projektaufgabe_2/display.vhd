--------------------------------------------------
-- Author: 				Steve Wagner
-- Matrikelnummer: 	175309
-- Datum: 				14/11/2015
-- Brief:				Display on 7-Segment
--------------------------------------------------

-- Library Declaration --
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std;

ENTITY display IS
PORT(
		clk				:IN			std_logic;		--Clock 50MHz
		nb					:IN			INTEGER;			--Number to display
		sgm				:OUT 			std_logic_vector(6 downto 0)	--7-bits-vector number for the segment (g downto a)
	);
END display;


--------------------------------------------
--        ARCHITECTURE	                  --
--------------------------------------------
ARCHITECTURE Behaviour OF display IS

BEGIN	

-- Convert the integer into a 7-bits-vector (for the segment) --
convert_bin : PROCESS (clk, nb)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			case nb IS
				-- 0 --
				WHEN 0 =>
					sgm <= "1000000";
				-- 1 --
				WHEN 1 =>
					sgm <= "1111001";
				-- 2 --
				WHEN 2 =>
					sgm <= "0100100";
				-- 3 --
				WHEN 3 =>
					sgm <= "0110000";
				-- 4 --
				WHEN 4 =>
					sgm <= "0011001";
				-- 5 --
				WHEN 5 =>
					sgm <= "0010010";
				-- 6 --
				WHEN 6 =>
					sgm <= "0000010";
				-- 7 --
				WHEN 7 =>
					sgm <= "1111000";
				-- 8 --
				WHEN 8 =>
					sgm <= "0000000";
				-- 9 --
				WHEN 9 =>
					sgm <= "0010000";
				-- REST --
				WHEN OTHERS =>
					sgm <= "1111111";		
			END CASE;
		END IF;
END PROCESS convert_bin;


END Behaviour;