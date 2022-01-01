LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY syncup_tb IS
END syncup_tb;

ARCHITECTURE behavior OF syncup_tb IS
    COMPONENT syncup
        PORT (
            clock : IN STD_LOGIC;
            input : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            data : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;

    SIGNAL clock : STD_LOGIC := '0';
    SIGNAL reset : STD_LOGIC := '1';
    SIGNAL input : STD_LOGIC := '1';
    SIGNAL data : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    uut : syncup PORT MAP(
        clock => clock,
        input => input,
        reset => reset,
        data => data
    );

    clk : PROCESS
    BEGIN
        WAIT FOR 5ns;
        clock <= NOT clock;
    END PROCESS clk;

    main : PROCESS
    BEGIN
        WAIT FOR 7 ns;
        reset <= '0';

        WAIT FOR 20ns;
        input <= '1';

        WAIT;
    END PROCESS main;

END behavior;