--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.58f
--  \   \         Application: netgen
--  /   /         Filename: jkff_synthesis.vhd
-- /___/   /\     Timestamp: Thu Dec 03 20:10:20 2020
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm jkff -w -dir netgen/synthesis -ofmt vhdl -sim jkff.ngc jkff_synthesis.vhd 
-- Device	: xa7a100t-2I-csg324
-- Input file	: jkff.ngc
-- Output file	: P:\Assignments_Lab_Reports_LaTeX\Embedded System\Lab 5\jkff\netgen\synthesis\jkff_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: jkff
-- Xilinx	: D:\Xilinx\14.5\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity jkff is
  port (
    CLOCK : in STD_LOGIC := 'X'; 
    J : in STD_LOGIC := 'X'; 
    K : in STD_LOGIC := 'X'; 
    QT : inout STD_LOGIC; 
    QTBAR : inout STD_LOGIC 
  );
end jkff;

architecture Structure of jkff is
  signal CLOCK_IBUF_0 : STD_LOGIC; 
  signal J_IBUF_1 : STD_LOGIC; 
  signal K_IBUF_2 : STD_LOGIC; 
  signal QT_OBUF_3 : STD_LOGIC; 
  signal QTBAR_OBUF_4 : STD_LOGIC; 
  signal D1_O6_n0000 : STD_LOGIC; 
  signal D1_O2_n0000 : STD_LOGIC; 
  signal D1_O3_a_c_AND_4_o : STD_LOGIC; 
begin
  D1_O5_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => D1_O6_n0000,
      I1 => D1_O2_n0000,
      O => QT_OBUF_3
    );
  D1_O3_a_c_AND_4_o1 : LUT6
    generic map(
      INIT => X"2222222220002202"
    )
    port map (
      I0 => CLOCK_IBUF_0,
      I1 => D1_O2_n0000,
      I2 => D1_O6_n0000,
      I3 => K_IBUF_2,
      I4 => J_IBUF_1,
      I5 => D1_O3_a_c_AND_4_o,
      O => D1_O3_a_c_AND_4_o
    );
  D1_O6_n00001 : LUT3
    generic map(
      INIT => X"54"
    )
    port map (
      I0 => D1_O3_a_c_AND_4_o,
      I1 => D1_O2_n0000,
      I2 => D1_O6_n0000,
      O => D1_O6_n0000
    );
  D1_O2_n00001 : LUT6
    generic map(
      INIT => X"AAAAAAAA02220020"
    )
    port map (
      I0 => CLOCK_IBUF_0,
      I1 => D1_O3_a_c_AND_4_o,
      I2 => D1_O6_n0000,
      I3 => K_IBUF_2,
      I4 => J_IBUF_1,
      I5 => D1_O2_n0000,
      O => D1_O2_n0000
    );
  CLOCK_IBUF : IBUF
    port map (
      I => CLOCK,
      O => CLOCK_IBUF_0
    );
  J_IBUF : IBUF
    port map (
      I => J,
      O => J_IBUF_1
    );
  K_IBUF : IBUF
    port map (
      I => K,
      O => K_IBUF_2
    );
  QT_OBUF : OBUF
    port map (
      I => QT_OBUF_3,
      O => QT
    );
  QTBAR_OBUF : OBUF
    port map (
      I => QTBAR_OBUF_4,
      O => QTBAR
    );
  D1_O6_o1_INV_0 : INV
    port map (
      I => D1_O6_n0000,
      O => QTBAR_OBUF_4
    );

end Structure;

