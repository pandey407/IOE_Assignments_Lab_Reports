LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY q4_not IS
	PORT (
		a : IN STD_LOGIC;
		o : OUT STD_LOGIC);
END q4_not;

ARCHITECTURE behavorial OF q4_not IS

BEGIN
	q4_not : PROCESS (a)

	BEGIN
		o <= a NOR a;
	END PROCESS q4_not;

END behavorial;