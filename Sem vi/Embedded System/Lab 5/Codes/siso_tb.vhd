LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY siso_tb IS
END siso_tb;

ARCHITECTURE behavioral OF siso_tb IS
    COMPONENT siso
        PORT (
            CLOCK : IN STD_LOGIC;
            Din : IN STD_LOGIC;
            QA, QB, QC : INOUT STD_LOGIC;
            Dout : INOUT STD_LOGIC;
            QTBAR : INOUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL clk : STD_LOGIC;
    SIGNAL input : STD_LOGIC;
    SIGNAL input_seq : STD_LOGIC_VECTOR(7 DOWNTO 0) := "10101010";
    SIGNAL qa, qb, qc : STD_LOGIC;
    SIGNAL out1 : STD_LOGIC := '1';
    CONSTANT clk_p : TIME := 100 ns;

BEGIN
    uut : siso PORT MAP(
        CLOCK => clk,
        QA => qa,
        QB => qb,
        QC => qc,
        Din => input,
        Dout => out1
    );

    clkproc : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR clk_p/2;
        clk <= '1';
        WAIT FOR clk_p/2;
    END PROCESS clkproc;

    stim_proc : PROCESS
    BEGIN
        FOR index IN 1 TO 8 LOOP
            input <= input_seq(7);
            input_seq(7 DOWNTO 1) <=
            input_seq(6 DOWNTO 0);
            input_seq(0) <= '0';
            WAIT FOR 100 ns;
        END LOOP;
        WAIT;
    END PROCESS stim_proc;

END behavioral;