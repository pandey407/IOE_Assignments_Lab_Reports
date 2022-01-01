LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY q4_or IS PORT (
	a, b, c : IN STD_LOGIC;
	o : OUT STD_LOGIC
);
END q4_or;

ARCHITECTURE behavorial OF q4_or IS
	SIGNAL G1, G2, G3 : STD_LOGIC;

BEGIN
	q4_or : PROCESS (a, b, c, G1, G2, G3)

	BEGIN
		G1 <= a NOR b;
		G2 <= G1 NOR G1;
		G3 <= G2 NOR c;
		o <= G3 NOR G3;
	END PROCESS q4_or;

END behavorial;