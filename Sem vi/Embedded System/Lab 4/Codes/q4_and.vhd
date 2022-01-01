LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY q4_and IS PORT (
	a, b, c : IN STD_LOGIC;
	o : OUT STD_LOGIC
);
END q4_and;

ARCHITECTURE behavorial OF q4_and IS
	SIGNAL F1, F2, F3, F4, F5 : STD_LOGIC;
BEGIN
	q4_and : PROCESS (a, b, c, F1, F2, F3, F4, F5)
	BEGIN
		F1 <= a NOR a;
		F2 <= b NOR b;
		F3 <= c NOR c;
		F4 <= F1 NOR F2;
		F5 <= F4 NOR F4;
		o <= F5 NOR F3;

	END PROCESS q4_and;
END behavorial;