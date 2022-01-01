LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY siso IS
    PORT (
        CLOCK, Din : IN STD_LOGIC;
        QA, QB, QC : INOUT STD_LOGIC;
        Dout, QTBAR : INOUT STD_LOGIC);
END siso;

ARCHITECTURE structural OF siso IS
    SIGNAL Q0, Q0B, Q1, Q1B, Q2, Q2B, Q3, Q3B, A1 : STD_LOGIC;
    SIGNAL A5 : STD_LOGIC := '0';
    SIGNAL A6 : STD_LOGIC := '1';

    COMPONENT dff
        PORT (
            CLK, DATA : IN STD_LOGIC;
            Q, QBAR : INOUT STD_LOGIC
        );
    END COMPONENT;

BEGIN
    Dout <= A5;
    QTBAR <= A6;
    QA <= Q0;
    QB <= Q1;
    QC <= Q2;
    D1 : dff PORT MAP(CLK => CLOCK, DATA => Din, Q => Q0, QBAR => Q0B);
    D2 : dff PORT MAP(CLK => CLOCK, DATA => Q0, Q => Q1, QBAR => Q1B);
    D3 : dff PORT MAP(CLK => CLOCK, DATA => Q1, Q => Q2, QBAR => Q2B);
    D4 : dff PORT MAP(CLK => CLOCK, DATA => Q2, Q => A5, QBAR => A6);

END structural;