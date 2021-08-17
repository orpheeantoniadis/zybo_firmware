----------------------------------------------------------------------------------
--                                 _             _
--                                | |_  ___ _ __(_)__ _
--                                | ' \/ -_) '_ \ / _` |
--                                |_||_\___| .__/_\__,_|
--                                         |_|
--
----------------------------------------------------------------------------------
--
-- Company: hepia
-- Author: Orphee Antoniadis <orphee.antoniadis@hesge.ch>
--
-- Module Name: zybo_safe_firmware_zynqps_wrapper - arch
-- Target Device: digilentinc.com:zybo-z7-20:part0:1.0 xc7z020clg400-1
-- Tool version: 2020.2
-- Description: zybo_safe_firmware_zynqps_wrapper
--
-- Last update: 2021-08-10 12:21:11
--
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zybo_safe_firmware_zynqps_wrapper is

    port (
        -- Processor interface
        FIXED_IO_ps_clk     : inout std_logic;
        FIXED_IO_ps_porb    : inout std_logic;
        FIXED_IO_ps_srstb   : inout std_logic;
        -- DDR interface
        DDR_addr            : inout std_logic_vector (14 downto 0);
        DDR_ba              : inout std_logic_vector (2 downto 0);
        DDR_cas_n           : inout std_logic;
        DDR_ck_n            : inout std_logic;
        DDR_ck_p            : inout std_logic;
        DDR_cke             : inout std_logic;
        DDR_cs_n            : inout std_logic;
        DDR_dm              : inout std_logic_vector (3 downto 0);
        DDR_dq              : inout std_logic_vector (31 downto 0);
        DDR_dqs_n           : inout std_logic_vector (3 downto 0);
        DDR_dqs_p           : inout std_logic_vector (3 downto 0);
        DDR_odt             : inout std_logic;
        DDR_ras_n           : inout std_logic;
        DDR_reset_n         : inout std_logic;
        DDR_we_n            : inout std_logic;
        FIXED_IO_ddr_vrn    : inout std_logic;
        FIXED_IO_ddr_vrp    : inout std_logic;
        -- MIO
        FIXED_IO_mio        : inout std_logic_vector (53 downto 0);
        -- System clock
        sys_clock           : in    std_logic;
        -- AXI GPIO interface
        leds_4bits_tri_o    : out   std_logic_vector (3 downto 0);
        sws_4bits_tri_i     : in    std_logic_vector (3 downto 0);
        btns_4bits_tri_i    : in    std_logic_vector (3 downto 0)
    );

end zybo_safe_firmware_zynqps_wrapper;


architecture arch of zybo_safe_firmware_zynqps_wrapper is

begin

    ZyboZynqPSxI : entity work.zybo_safe_firmware_zynqps
        port map (
            DDR_addr            => DDR_addr,
            DDR_ba              => DDR_ba,
            DDR_cas_n           => DDR_cas_n,
            DDR_ck_n            => DDR_ck_n,
            DDR_ck_p            => DDR_ck_p,
            DDR_cke             => DDR_cke,
            DDR_cs_n            => DDR_cs_n,
            DDR_dm              => DDR_dm,
            DDR_dq              => DDR_dq,
            DDR_dqs_n           => DDR_dqs_n,
            DDR_dqs_p           => DDR_dqs_p,
            DDR_odt             => DDR_odt,
            DDR_ras_n           => DDR_ras_n,
            DDR_reset_n         => DDR_reset_n,
            DDR_we_n            => DDR_we_n,
            FIXED_IO_ddr_vrn    => FIXED_IO_ddr_vrn,
            FIXED_IO_ddr_vrp    => FIXED_IO_ddr_vrp,
            FIXED_IO_mio        => FIXED_IO_mio,
            FIXED_IO_ps_clk     => FIXED_IO_ps_clk,
            FIXED_IO_ps_porb    => FIXED_IO_ps_porb,
            FIXED_IO_ps_srstb   => FIXED_IO_ps_srstb,
            sys_clock           => sys_clock,
            leds_4bits_tri_o    => leds_4bits_tri_o,
            sws_4bits_tri_i     => sws_4bits_tri_i,
            btns_4bits_tri_i    => btns_4bits_tri_i
        );

end arch;
