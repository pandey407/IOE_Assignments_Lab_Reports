LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY q3 IS PORT (
	X1, X2, X3 : IN STD_LOGIC;
	F : OUT STD_LOGIC
);
END q3;

ARCHITECTURE structural OF q3 IS
	SIGNAL A1, A2, A3, A4, A5, A6 : STD_LOGIC;

	COMPONENT q3_and IS PORT (
		a, b, c : IN STD_LOGIC;
		o : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT q3_or IS PORT (
		a, b, c : IN STD_LOGIC;
		o : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT q3_not IS PORT (
		a : IN STD_LOGIC;
		o : OUT STD_LOGIC
		);
	END COMPONENT;

BEGIN
	N1 : q3_not PORT MAP(a => X1, o => A1);
	N2 : q3_not PORT MAP(a => X2, o => A2);
	N3 : q3_not PORT MAP(a => X3, o => A3);
	N4 : q3_and PORT MAP(a => A1, b => X2, c => X3, o =>  A4);
	N5 : q3_and PORT MAP(a => A2, b => X1, c => X3, o =>  A5);
	N6 : q3_and PORT MAP(a => A3, b => X1, c => X2, o =>  A6);
	N7 : q3_or PORT MAP(a => A4, b => A5, c => A6, o => F);
END structural;