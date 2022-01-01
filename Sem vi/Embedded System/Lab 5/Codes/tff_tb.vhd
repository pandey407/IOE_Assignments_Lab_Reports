LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
	
ENTITY tff_tb IS
END tff_tb;

ARCHITECTURE behavioral OF tff_tb IS
	COMPONENT tff
	PORT(
		CLOCK: IN STD_LOGIC;
		T: IN STD_LOGIC;
		TNOT: IN STD_LOGIC;
		QT: INOUT STD_LOGIC;
		QTBAR: INOUT STD_LOGIC
	);
	END COMPONENT;
	
	SIGNAL clk: STD_LOGIC;
	SIGNAL input: STD_LOGIC;
	SIGNAL out1: STD_LOGIC:= '0';
	SIGNAL out2: STD_LOGIC:= '1';
	CONSTANT clk_p: time:= 100 ns;	
		
BEGIN
	uut: tff PORT MAP(
		CLOCK => clk,
      T => input,
      TNOT => not input,
		QT => out1,
		QTBAR => out2
	);
	
	clkproc: PROCESS
	BEGIN
		clk <= '0';
		WAIT FOR clk_p/2;
		clk <= '1';
		WAIT FOR clk_p/2;
	END PROCESS clkproc;

	stim_proc: PROCESS
	BEGIN
		if out1 = 'U' then
			input <= '0';
			WAIT FOR 100 ns;
		end if;
		
		input <= '0';
		WAIT FOR 100 ns;
		
		input <= '1';
		WAIT FOR 100 ns;
	END PROCESS stim_proc;
END behavioral;
