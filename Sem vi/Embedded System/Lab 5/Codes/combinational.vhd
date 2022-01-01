LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY combinational_1 IS PORT (
	i1, i2, a3, a4 : IN STD_LOGIC;
	o1 : OUT STD_LOGIC
);
END combinational_1;

ARCHITECTURE dataflow OF combinational_1 IS
BEGIN
	o1 <= ((i1 AND a4) OR ((NOT i2) AND a3));
END dataflow;