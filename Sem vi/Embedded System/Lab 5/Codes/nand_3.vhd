LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nand_3 IS
	PORT (
		a, b, c : IN STD_LOGIC;
		o : OUT STD_LOGIC);
END nand_3;

ARCHITECTURE dataflow OF nand_3 IS
BEGIN
	o <= NOT(a AND b AND c);
END dataflow;