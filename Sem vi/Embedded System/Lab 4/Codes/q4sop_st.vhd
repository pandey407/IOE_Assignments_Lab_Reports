LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY q4_sop IS PORT (
	X1, X2, X3, X4 : IN STD_LOGIC;
	Y : OUT STD_LOGIC
);
END q4_sop;

ARCHITECTURE structural OF q4_sop IS
	SIGNAL A1, A2, A3, A4, A5, A6 : STD_LOGIC;

	COMPONENT q4_and IS PORT (
		a, b, c : IN STD_LOGIC;
		o : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT q4_or IS PORT (
		a, b, c : IN STD_LOGIC;
		o : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT q4_not IS PORT (
		a : IN STD_LOGIC;
		o : OUT STD_LOGIC
		);
	END COMPONENT;

BEGIN
	N1 : q4_not PORT MAP(a => X1, o => A1);
	N2 : q4_not PORT MAP(a => X2, o => A2);
	N3 : q4_not PORT MAP(a => X3, o => A3);
	N4 : q4_and PORT MAP(a => A1, b => A3, c => '1', o => A4);
	N5 : q4_and PORT MAP(a => A2, b => A3, c => '1', o => A5);
	N6 : q4_and PORT MAP(a => X1, b => X2, c => X3, o => A6);
	N7 : q4_or PORT MAP(a => A4, b => A5, c => A6, o => Y);
END structural;