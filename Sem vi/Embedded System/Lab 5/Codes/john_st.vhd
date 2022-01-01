LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY johnson IS PORT (
    clock : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    data : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END johnson;

ARCHITECTURE structural OF johnson IS
    COMPONENT dff
        PORT (
            clock : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            d : IN STD_LOGIC;
            q : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL temp : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    SIGNAL wir : STD_LOGIC := '0';
BEGIN
    wir <= NOT temp(0);
    d0 : dff PORT MAP(reset => reset, clock => clock, d => wir, q => temp(3));

    d1 : dff PORT MAP(reset => reset, clock => clock, d => temp(3), q => temp(2));

    d2 : dff PORT MAP(reset => reset, clock => clock, d => temp(2), q => temp(1));

    d3 : dff PORT MAP(reset => reset, clock => clock, d => temp(1), q => temp(0));

    data <= temp;

END structural;