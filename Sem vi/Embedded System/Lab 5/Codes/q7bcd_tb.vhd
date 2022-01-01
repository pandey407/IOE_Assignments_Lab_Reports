LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY bit2dec_tb IS 
END bit2dec_tb;
ARCHITECTURE behavioral OF bit2dec_tb IS
	 COMPONENT bit2dec
		PORT(	clock, reset: IN STD_LOGIC;
			output1 : out std_logic_vector(3 downto 0);
			output2 : out std_logic_vector(3 downto 0)
		);
	END COMPONENT;
  
	SIGNAL clock : std_logic := '1';
	SIGNAL reset : std_logic := '1';
   	SIGNAL out1   : std_logic_vector (3 downto 0) := "0000";
   	SIGNAL out2   : std_logic_vector (3 downto 0) := "0101";
	
   	BEGIN
   	uut: bit2dec PORT MAP(
		clock => clock,
		reset  => reset,
		output1 => out1,
		output2 => out2
	);
	
	clk: PROCESS
	BEGIN
		wait for 5ns;
    		clock <= not clock;
	END PROCESS clk;

   	main: PROCESS
   	BEGIN
		wait for 5 ns;
		reset <= '0';
		wait;
	END PROCESS main;

END behavioral;
