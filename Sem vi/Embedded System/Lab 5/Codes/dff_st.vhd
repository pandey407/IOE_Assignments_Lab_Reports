LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY dff IS
    PORT (
        clock, reset, d : IN STD_LOGIC;
        q, qnot: OUT STD_LOGIC);
END dff;

ARCHITECTURE structural OF dff IS
BEGIN
    PROCESS (clock, d)
    BEGIN
	 IF reset = '1' THEN
			q <= '0';
		ELSIF(clock'EVENT AND clock = '1')
            THEN
            q <= d;
				qnot <= not d;
        END IF;
    END PROCESS;

END structural;