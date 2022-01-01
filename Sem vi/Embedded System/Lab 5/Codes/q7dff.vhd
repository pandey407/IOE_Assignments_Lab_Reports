LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY dff IS
    PORT (
        enable : IN STD_LOGIC;
        d : IN STD_LOGIC;
        clock : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        q : OUT STD_LOGIC;
        qb : OUT STD_LOGIC
    );
END dff;

ARCHITECTURE behavioral OF dff IS
BEGIN
    PROCESS (reset, clock, enable)
    BEGIN
        IF (enable = '1') THEN
            IF (reset = '1') THEN
                q <= '0';
                qb <= '1';
            ELSIF (clock'EVENT AND clock = '1') THEN
                q <= d;
                qb <= NOT d;
            END IF;
        END IF;
    END PROCESS;
END behavioral;