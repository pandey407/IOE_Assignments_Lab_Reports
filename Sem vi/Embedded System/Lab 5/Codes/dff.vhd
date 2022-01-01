LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY dff IS
	PORT (
		CLK, DATA : IN STD_LOGIC;
		Q, QBAR : OUT STD_LOGIC);
END dff;

ARCHITECTURE structural OF dff IS
	SIGNAL I1, I2, I3, I4 : STD_LOGIC;
	SIGNAL I5 : STD_LOGIC := '0';
	SIGNAL I6 : STD_LOGIC := '1';

	COMPONENT nand_2
		PORT (
			a, b : IN STD_LOGIC;
			o : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT nand_3
		PORT (
			a, b, c : IN STD_LOGIC;
			o : OUT STD_LOGIC
		);
	END COMPONENT;

BEGIN
	Q <= I5;
	QBAR <= I6;
	O1 : nand_2 PORT MAP(a => I2, b => I4, o => I1);
	O2 : nand_2 PORT MAP(a => CLK, b => I1, o => I2);
	O3 : nand_3 PORT MAP(a => I2, b => CLK, c => I4, o => I3);
	O4 : nand_2 PORT MAP(a => I3, b => DATA, o => I4);
	O5 : nand_2 PORT MAP(a => I2, b => I6, o => I5);
	O6 : nand_2 PORT MAP(a => I5, b => I3, o => I6);
END structural;