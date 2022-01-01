LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY johnson_tb IS
END johnson_tb;

ARCHITECTURE behavior OF johnson_tb IS
    COMPONENT johnson
        PORT (
            clock : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            data : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;

    SIGNAL clock : STD_LOGIC := '0';
    SIGNAL reset : STD_LOGIC := '1';
    SIGNAL data : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    uut : johnson PORT MAP(
        clock => clock,
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
        reset <= '1';
        WAIT FOR 20ns;

        reset <= NOT reset;
        WAIT;
    END PROCESS main;

END behavior;