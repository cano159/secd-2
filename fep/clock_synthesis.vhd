--------------------------------------------------------------------------------
-- Copyright (c) 1995-2005 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.1.03i
--  \   \         Application : xaw2vhdl
--  /   /         Filename : clock_synthesis.vhd
-- /___/   /\     Timestamp : 06/17/2006 23:44:21
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: xaw2vhdl-st C:\Temp\clock_synth\clock_synthesis.xaw C:\Temp\clock_synth\clock_synthesis
--Design Name: clock_synthesis
--Device: xc3s1000-5ft256
--
-- Module clock_synthesis
-- Generated by Xilinx Architecture Wizard
-- Written for synthesis tool: XST

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity clock_synthesis is
  port ( CLKIN_IN        : in    std_logic; 
         CLKFX_OUT       : out   std_logic; 
         CLKIN_IBUFG_OUT : out   std_logic; 
         CLK0_OUT        : out   std_logic; 
         LOCKED_OUT      : out   std_logic);
end clock_synthesis;

architecture BEHAVIORAL of clock_synthesis is
  signal CLKFB_IN        : std_logic;
  signal CLKFX_BUF       : std_logic;
  signal CLKIN_IBUFG     : std_logic;
  signal CLK0_BUF        : std_logic;
  signal GND1            : std_logic;
  component BUFG
    port ( I : in    std_logic; 
           O : out   std_logic);
  end component;
  
  component IBUFG
    port ( I : in    std_logic; 
           O : out   std_logic);
  end component;
  
  -- Period Jitter with noise (unit interval) for block DCM_INST = 0.04 UI
  -- Period Jitter with noise (Peak-to-Peak) for block DCM_INST = 0.86 ns
  component DCM
    generic( CLK_FEEDBACK : string :=  "1X";
             CLKDV_DIVIDE : real :=  2.000000;
             CLKFX_DIVIDE : integer :=  1;
             CLKFX_MULTIPLY : integer := 4;
             CLKIN_DIVIDE_BY_2 : boolean :=  FALSE;
             CLKIN_PERIOD : real :=  10.000000;
             CLKOUT_PHASE_SHIFT : string :=  "NONE";
             DESKEW_ADJUST : string :=  "SYSTEM_SYNCHRONOUS";
             DFS_FREQUENCY_MODE : string :=  "LOW";
             DLL_FREQUENCY_MODE : string :=  "LOW";
             DUTY_CYCLE_CORRECTION : boolean :=  TRUE;
             FACTORY_JF : bit_vector :=  x"C080";
             PHASE_SHIFT : integer :=  0;
             STARTUP_WAIT : boolean :=  TRUE;
             DSS_MODE : string :=  "NONE");
    port ( CLKIN    : in    std_logic; 
           CLKFB    : in    std_logic; 
           RST      : in    std_logic; 
           PSEN     : in    std_logic; 
           PSINCDEC : in    std_logic; 
           PSCLK    : in    std_logic; 
           DSSEN    : in    std_logic; 
           CLK0     : out   std_logic; 
           CLK90    : out   std_logic; 
           CLK180   : out   std_logic; 
           CLK270   : out   std_logic; 
           CLKDV    : out   std_logic; 
           CLK2X    : out   std_logic; 
           CLK2X180 : out   std_logic; 
           CLKFX    : out   std_logic; 
           CLKFX180 : out   std_logic; 
           STATUS   : out   std_logic_vector (7 downto 0); 
           LOCKED   : out   std_logic; 
           PSDONE   : out   std_logic);
  end component;
  
begin
  GND1 <= '0';
  CLKIN_IBUFG_OUT <= CLKIN_IBUFG;
  CLK0_OUT <= CLKFB_IN;
  CLKFX_BUFG_INST : BUFG
    port map (I=>CLKFX_BUF,
              O=>CLKFX_OUT);
  
  CLKIN_IBUFG_INST : IBUFG
    port map (I=>CLKIN_IN,
              O=>CLKIN_IBUFG);
  
  CLK0_BUFG_INST : BUFG
    port map (I=>CLK0_BUF,
              O=>CLKFB_IN);
  
  DCM_INST : DCM
    generic map( CLK_FEEDBACK => "1X",
                 CLKDV_DIVIDE => 2.000000,
                 CLKFX_DIVIDE => 3,
                 CLKFX_MULTIPLY => 5,
                 CLKIN_DIVIDE_BY_2 => FALSE,
                 CLKIN_PERIOD => 33.333300,
                 CLKOUT_PHASE_SHIFT => "NONE",
                 DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
                 DFS_FREQUENCY_MODE => "LOW",
                 DLL_FREQUENCY_MODE => "LOW",
                 DUTY_CYCLE_CORRECTION => TRUE,
                 FACTORY_JF => x"C080",
                 PHASE_SHIFT => 0,
                 STARTUP_WAIT => FALSE)

    port map (CLKFB=>CLKFB_IN,
              CLKIN=>CLKIN_IBUFG,
              DSSEN=>GND1,
              PSCLK=>GND1,
              PSEN=>GND1,
              PSINCDEC=>GND1,
              RST=>GND1,
              CLKDV=>open,
              CLKFX=>CLKFX_BUF,
              CLKFX180=>open,
              CLK0=>CLK0_BUF,
              CLK2X=>open,
              CLK2X180=>open,
              CLK90=>open,
              CLK180=>open,
              CLK270=>open,
              LOCKED=>LOCKED_OUT,
              PSDONE=>open,
              STATUS=>open);
  
end BEHAVIORAL;


