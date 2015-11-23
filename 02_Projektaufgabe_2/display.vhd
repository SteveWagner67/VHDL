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
		nbVal				:IN			INTEGER;			--Value in integer of the number to display
		sgm				:OUT 			std_logic_vector(6 downto 0)	--Value in a 7-bits-vector for the segment (g downto a)
	);
END display;



--------------------------------------------
--        ARCHITECTURE	                  --
--------------------------------------------
ARCHITECTURE Behaviour OF display IS
--- Intern Signal Declaration ----
SIGNAL valVec	:std_logic_vector(3 downto 0)	:= "1111";--Value in 4 bits
BEGIN	

-- Convert the value in binary 4 bits --
bin_proc : PROCESS (clk, nbVal)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			--Convert the integer to a 4-bits-vector
			CASE nbVal IS
				WHEN 0 =>
					valVec<="0000";
				WHEN 1 =>
					valVec<="0001";
				WHEN 2 =>
					valVec<="0010";
				WHEN 3 =>
					valVec<="0011";
				WHEN 4 =>
					valVec<="0100";
				WHEN 5 =>
					valVec<="0101";
				WHEN 6 =>
					valVec<="0110";
				WHEN 7 =>
					valVec<="0111";
				WHEN 8 =>
					valVec<="1000";
				WHEN 9 =>
					valVec<="1001";
				WHEN OTHERS =>
					valVec<="1111";
			END CASE;
		END IF;
END PROCESS bin_proc;



convert_bin : PROCESS (clk, valVec)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			-- Convert the 4 bits-vector into a 7-bits-vector (for the segment)
			case valVec IS
				-- 0 --
				WHEN "0000" =>
					sgm <= "1000000";
				-- 1 --
				WHEN "0001" =>
					sgm <= "1111001";
				-- 2 --
				WHEN "0010" =>
					sgm <= "0100100";
				-- 3 --
				WHEN "0011" =>
					sgm <= "0110000";
				-- 4 --
				WHEN "0100" =>
					sgm <= "0011001";
				-- 5 --
				WHEN "0101" =>
					sgm <= "0010010";
				-- 6 --
				WHEN "0110" =>
					sgm <= "0000010";
				-- 7 --
				WHEN "0111" =>
					sgm <= "1111000";
				-- 8 --
				WHEN "1000" =>
					sgm <= "0000000";
				-- 9 --
				WHEN "1001" =>
					sgm <= "0010000";
				-- REST --
				WHEN OTHERS =>
					sgm <= "1111111";		
			END CASE;
		END IF;
END PROCESS convert_bin;


END Behaviour;