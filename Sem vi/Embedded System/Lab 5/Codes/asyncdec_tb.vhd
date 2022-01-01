LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY asyncdec_tb IS 
END asyncdec_tb;
ARCHITECTURE behavior OF asyncdec_tb IS
	COMPONENT asyncdec
		PORT(	clock : IN std_logic;
input : IN std_logic;
			data : out std_logic_vector(3 downto 0) );
	END COMPONENT;

	SIGNAL clock : std_logic := '1';
   	SIGNAL input : std_logic;
   	SIGNAL data : std_logic_vector(3 downto 0) := "0000";
	
   	BEGIN 
   	uut: asyncdec PORT MAP(
		clock => clock,
		input => input,
		data  => data
	);
	
	clk: PROCESS
	BEGIN
		wait for 5ns;
      	clock <= not clock;
	END PROCESS clk;

   	main: PROCESS
   	BEGIN
      	input <= '1';
		wait;
	END PROCESS main;

END behavior;
