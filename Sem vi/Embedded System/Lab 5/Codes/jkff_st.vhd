LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY jkff IS
	PORT (
		CLOCK, J, K : IN STD_LOGIC;
		QT, QTBAR : INOUT STD_LOGIC);
END jkff;

ARCHITECTURE structural OF jkff IS
	SIGNAL A1 : STD_LOGIC;
	SIGNAL A5 : STD_LOGIC := '0';
	SIGNAL A6 : STD_LOGIC := '1';

	COMPONENT dff
		PORT (
			CLK, DATA : IN STD_LOGIC;
			Q, QBAR : INOUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT combinational_1
		PORT (
			i1, i2, a3, a4 : IN STD_LOGIC;
			o1 : OUT STD_LOGIC
		);
	END COMPONENT;

BEGIN
	QT <= A5;
	QTBAR <= A6;
	O1 : combinational_1 PORT MAP(i1 => J, i2 => K, a3 => A5, a4 => A6, o1 => A1);
	D1 : dff PORT MAP(CLK => CLOCK, DATA => A1, Q => A5, QBAR => A6);

END structural;