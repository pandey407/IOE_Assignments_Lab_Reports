LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tff IS
	PORT (
		CLOCK, RESET, T : IN STD_LOGIC;
		QT, QTBAR: OUT STD_LOGIC);
END tff;

ARCHITECTURE behavioral OF tff IS
	SIGNAL output : STD_LOGIC;

BEGIN
	PROCESS (RESET, CLOCK)
	BEGIN
		IF RESET = '1' THEN
			output <= '0';
		ELSIF CLOCK'EVENT AND CLOCK = '1' THEN
			IF T = '0' THEN
				output <= output;
			ELSIF T = '1' THEN
				output <= NOT output;
			ELSE
				output <= 'U';
			END IF;
		END IF;
	END PROCESS;
	QT <= output;
	QTBAR <= not output;
END behavioral;