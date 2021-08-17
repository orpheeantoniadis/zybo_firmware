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
-- Module Name: zybo_safe_firmware - arch
-- Target Device: digilentinc.com:zybo-z7-20:part0:1.0 xc7z020clg400-1
-- Tool version: 2020.2
-- Description: zybo_safe_firmware
--
-- Last update: 2021-08-16 17:12:45
--
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zybo_safe_firmware is

    generic (
        C_USE_IBERT  : boolean := false;
        C_DEBUG_MODE : boolean := false);

    port (
        ------------------------------------------------------------------------
        -- Names defined and not described in the constraint file.
        -----------------------------------------------------------------------
        -- Zynq FIXED_IO
        PSClkxCIO           : inout std_logic;
        PSSRstxRNIO         : inout std_logic;
        PSPorxSNIO          : inout std_logic;
        -- DDR interface
        DDRClkNxCIO         : inout std_logic;
        DDRClkPxCIO         : inout std_logic;
        DDRDRstxRNIO        : inout std_logic;
        DDRCasNxSIO         : inout std_logic;
        DDRCkexSIO          : inout std_logic;
        DDRCsNxSIO          : inout std_logic;
        DDROdtxSIO          : inout std_logic;
        DDRRasNxSIO         : inout std_logic;
        DDRWexSNIO          : inout std_logic;
        DDRBankAddrxDIO     : inout std_logic_vector(2 downto 0);
        DDRAddrxDIO         : inout std_logic_vector(14 downto 0);
        DDRVrNxSIO          : inout std_logic;
        DDRVrPxSIO          : inout std_logic;
        DDRDmxDIO           : inout std_logic_vector(3 downto 0);
        DDRDqxDIO           : inout std_logic_vector(31 downto 0);
        DDRDqsNxDIO         : inout std_logic_vector(3 downto 0);
        DDRDqsPxDIO         : inout std_logic_vector(3 downto 0);
        -- MIO Interface
        MIOxDIO             : inout std_logic_vector(53 downto 0);
        -----------------------------------------------------------------------
        sysclk              : in    std_logic;
        -- AXI GPIO interface
        led                 : out   std_logic_vector (3 downto 0);
        sw                  : in    std_logic_vector (3 downto 0);
        btn                 : in    std_logic_vector (3 downto 0)
    );

end zybo_safe_firmware;


architecture arch of zybo_safe_firmware is

begin

    ProcessingSystemxB : block is
        begin  -- block ProcessingSystemxB
    
            ZynqxI : entity work.zybo_safe_firmware_zynqps_wrapper
                port map (
                    FIXED_IO_ps_clk     => PSClkxCIO,
                    FIXED_IO_ps_porb    => PSPorxSNIO,
                    FIXED_IO_ps_srstb   => PSSRstxRNIO,
                    DDR_addr            => DDRAddrxDIO,
                    DDR_ba              => DDRBankAddrxDIO,
                    DDR_cas_n           => DDRCasNxSIO,
                    DDR_ck_n            => DDRClkNxCIO,
                    DDR_ck_p            => DDRClkPxCIO,
                    DDR_cke             => DDRCkexSIO,
                    DDR_cs_n            => DDRCsNxSIO,
                    DDR_dm              => DDRDmxDIO,
                    DDR_dq              => DDRDqxDIO,
                    DDR_dqs_n           => DDRDqsNxDIO,
                    DDR_dqs_p           => DDRDqsPxDIO,
                    DDR_odt             => DDROdtxSIO,
                    DDR_ras_n           => DDRRasNxSIO,
                    DDR_reset_n         => DDRDRstxRNIO,
                    DDR_we_n            => DDRWexSNIO,
                    FIXED_IO_ddr_vrn    => DDRVrNxSIO,
                    FIXED_IO_ddr_vrp    => DDRVrPxSIO,
                    FIXED_IO_mio        => MIOxDIO,
                    sys_clock           => sysclk,
                    leds_4bits_tri_o    => led,
                    sws_4bits_tri_i     => sw,
                    btns_4bits_tri_i    => btn
                );
    
        end block ProcessingSystemxB;

end arch;
