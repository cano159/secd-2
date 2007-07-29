-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : secd
-- Author      : Hans H�bner
-- Company     : .
--
-------------------------------------------------------------------------------
--
-- File        : h:\fpga\secd\activehdl\secd\compile\clock_gen.vhd
-- Generated   : Thu Jul 19 09:46:13 2007
-- From        : h:\fpga\secd\activehdl\secd\src\clock_gen.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library secd;
        use secd.secd_defs.all;
library ieee;
        use ieee.std_logic_1164.all;
        use ieee.numeric_std.all;
        use secd.secd_defs.all;

entity clock_gen is
  port(
       alu_ins : in std_logic;
       clk : in std_logic;
       ram_busy : in std_logic;
       reset : in std_logic;
       phi_alu : out std_logic;
       phi_next : out std_logic;
       phi_read : out std_logic;
       phi_write : out std_logic
  );
end clock_gen;

architecture my_clock_gen of clock_gen is

---- Architecture declarations -----
type state is (s_idle, s_read, s_alu, s_write, s_wait, s_next);


---- Signal declarations used on the diagram ----

signal current_state : state := s_idle;
signal next_state : state := s_idle;

begin

---- Processes ----

clock_gen : process (current_state,ram_busy,alu_ins)
                       begin
                         phi_read <= '0';
                         phi_alu <= '0';
                         phi_write <= '0';
                         phi_next <= '0';
                         case current_state is 
                           when s_idle => 
                              next_state <= s_read;
                           when s_read => 
                              phi_read <= '1';
                              if alu_ins = '0' then
                                 next_state <= s_write;
                              else 
                                 next_state <= s_alu;
                              end if;
                           when s_alu => 
                              phi_alu <= '1';
                              next_state <= s_write;
                           when s_write => 
                              phi_write <= '1';
                              next_state <= s_next;
                           when s_next => 
                              phi_next <= '1';
                              if ram_busy = '1' then
                                 next_state <= s_wait;
                              else 
                                 next_state <= s_read;
                              end if;
                           when s_wait => 
                              if ram_busy = '0' then
                                 next_state <= s_read;
                              end if;
                         end case;
                       end process;                      

set_next_state : process (clk,next_state)
                       begin
                         if reset = '1' then
                            current_state <= s_idle;
                         elsif rising_edge(clk) then
                            current_state <= next_state;
                         end if;
                       end process;                      

end my_clock_gen;
