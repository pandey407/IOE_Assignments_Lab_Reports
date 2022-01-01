LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY bit2dec IS
    PORT (
        clock, reset : IN STD_LOGIC;
        output1 : OUT STD_LOGIC_VECTOR
        (3 DOWNTO 0);
        output2 : OUT STD_LOGIC_VECTOR
        (3 DOWNTO 0));
END bit2dec;

ARCHITECTURE structural OF bit2dec IS
    COMPONENT dff
        PORT (
            clock, enable, reset, d :
            IN STD_LOGIC;
            q, qb : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL temp1 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL temp2 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0101";
    SIGNAL ntemp1 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1111";
    SIGNAL ntemp2 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1010";
    SIGNAL and_1 : STD_LOGIC := '1';
    SIGNAL and_2 : STD_LOGIC := '1';

BEGIN
    d0 : dff PORT MAP(clock => clock, enable => '1', reset => and_1, d => ntemp1(0), q => temp1(0), qb => ntemp1(0));
    d1 : dff PORT MAP(clock => ntemp1(0), enable => '1', reset => and_1, d => ntemp1(1), q => temp1(1), qb => ntemp1(1));
    d2 : dff PORT MAP(clock => ntemp1(1), enable => '1', reset => and_1, d => ntemp1(2), q => temp1(2), qb => ntemp1(2));
    d3 : dff PORT MAP(clock => ntemp1(2), enable => '1', reset => and_1, d => ntemp1(3), q => temp1(3), qb => ntemp1(3));
    and_1 <= temp1(1) AND temp1(3);
    output1 <= temp1;
    d4 : dff PORT MAP(clock => and_1, enable => '1', reset => and_2, d => ntemp2(0), q => temp2(0), qb => ntemp2(0));
    d5 : dff PORT MAP(clock => ntemp2(0), enable => '1', reset => and_2, d => ntemp2(1), q => temp2(1), qb => ntemp2(1));
    d6 : dff PORT MAP(clock => ntemp2(1), enable => '1', reset => and_2, d => ntemp2(2), q => temp2(2), qb => ntemp2(2));
    d7 : dff PORT MAP(clock => ntemp2(2), enable => '1', reset => and_2, d => ntemp2(3), q => temp2(3), qb => ntemp2(3));
    and_2 <= temp2(1) AND temp2(3);
    output2 <= temp2;

END structural;