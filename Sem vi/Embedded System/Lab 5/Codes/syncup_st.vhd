LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY syncup IS
	PORT (
		clock, reset, input : IN STD_LOGIC;
		data : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END syncup;

ARCHITECTURE structural OF syncup IS
	COMPONENT tff
		PORT (
			CLOCK, RESET, T : IN STD_LOGIC;
			QT, QTBAR: OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL temp : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	SIGNAL and_1, and_2 : STD_LOGIC;
BEGIN
	and_1 <= temp(0) AND temp(1);
	and_2 <= temp(2) AND and_1;

	d0 : tff PORT MAP(CLOCK => clock, RESET => reset, T => '1', QT => temp(0));

	d1 : tff PORT MAP(CLOCK => clock, RESET => reset, T => temp(0), QT => temp(1));

	d2 : tff PORT MAP(CLOCK => clock, RESET => reset, T => and_1, QT => temp(2));

	d3 : tff PORT MAP(CLOCK => clock, RESET => reset, T => and_2, QT => temp(3));

	data <= temp;

END structural;