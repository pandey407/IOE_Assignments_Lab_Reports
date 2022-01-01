LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY q3_not IS
	PORT (
		a : IN STD_LOGIC;
		o : OUT STD_LOGIC);
END q3_not;

ARCHITECTURE behavorial OF q3_not IS

BEGIN
	q3_not : PROCESS (a)

	BEGIN
		o <= a NOR a;
	END PROCESS q3_not;

END behavorial;