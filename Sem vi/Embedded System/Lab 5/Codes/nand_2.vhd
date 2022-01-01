LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nand_2 IS
	PORT (
		a, b : IN STD_LOGIC;
		o : OUT STD_LOGIC);
END nand_2;

ARCHITECTURE DATAFLOW OF nand_2 IS
BEGIN
	o <= a NAND b;
END DATAFLOW;