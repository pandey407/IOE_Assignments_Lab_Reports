LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY q5_mux2_1_tb IS
END q5_mux2_1_tb;

ARCHITECTURE behavioral OF q5_mux2_1_tb IS
	COMPONENT q5_mux2_1
		PORT (
			S : IN STD_LOGIC;
			X1 : IN STD_LOGIC;
			X2 : IN STD_LOGIC;
			Y : OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL input : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
	SIGNAL output : STD_LOGIC;

BEGIN
	uut : q5_mux2_1 PORT MAP(
		S => input(2),
		X2 => input(1),
		X1 => input(0),
		Y => output
	);

	stim_proc : PROCESS

	BEGIN
		FOR index IN 0 TO 7 LOOP
			input <= STD_LOGIC_VECTOR(TO_UNSIGNED(index, 3));
			WAIT FOR 50 ns;
		END LOOP;
	END PROCESS;

END behavioral;