LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY jkff_tb IS
END jkff_tb;

ARCHITECTURE behavioral OF jkff_tb IS
	COMPONENT jkff
		PORT (
			CLOCK : IN STD_LOGIC;
			J : IN STD_LOGIC;
			K : IN STD_LOGIC;
			QT : INOUT STD_LOGIC;
			QTBAR : INOUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL clock : STD_LOGIC;
	SIGNAL input_vector : STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";
	SIGNAL out1 : STD_LOGIC := '0';
	SIGNAL out2 : STD_LOGIC := '1';
	CONSTANT clk_p : TIME := 100 ns;

BEGIN
	uut : jkff PORT MAP(
		CLOCK => clock,
		J => input_vector(1),
		K => input_vector(0),
		QT => out1,
		QTBAR => out2
	);

	clkproc : PROCESS
	BEGIN
		clock <= '0';
		WAIT FOR clk_p/2;
		clock <= '1';
		WAIT FOR clk_p/2;
	END PROCESS clkproc;

	stim_proc : PROCESS
	BEGIN
		FOR index IN 0 TO 3 LOOP
			input_vector <= STD_LOGIC_VECTOR (to_unsigned(index, 2));
			WAIT FOR 100 ns;
		END LOOP;
	END PROCESS;
END behavioral;