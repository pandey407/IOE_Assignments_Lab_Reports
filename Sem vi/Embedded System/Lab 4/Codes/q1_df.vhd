LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY q1 IS PORT (
	A, B, C, D : IN STD_LOGIC;
	F : OUT STD_LOGIC
);
END q1;

ARCHITECTURE dataflow OF q1 IS
BEGIN
	F <= (A AND B) OR (NOT B AND C);
END dataflow;