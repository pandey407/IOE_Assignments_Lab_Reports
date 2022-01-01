LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY asyncdec IS
    PORT (
        clock, input : IN STD_LOGIC;
        data : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END asyncdec;

ARCHITECTURE structural OF asyncdec IS
    COMPONENT tff
        PORT (
            CLOCK, RESET, T : IN STD_LOGIC;
            QT, QTBAR : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL temp : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    SIGNAL ntemp : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111";
    SIGNAL and_1 : STD_LOGIC := '1';
BEGIN
    and_1 <= temp(1) AND temp(3);
    d0 : tff PORT MAP(CLOCK => clock, RESET => and_1, T => input, QT => temp(0), QTBAR => ntemp(0));

    d1 : tff PORT MAP(CLOCK => ntemp(0), RESET => and_1, T => input, QT => temp(1), QTBAR => ntemp(1));

    d2 : tff PORT MAP(CLOCK => ntemp(1), RESET => and_1, T => input, QT => temp(2), QTBAR => ntemp(2));

    d3 : tff PORT MAP(CLOCK => ntemp(2), RESET => and_1, T => input, QT => temp(3), QTBAR => ntemp(3));

    data <= temp;

END structural;