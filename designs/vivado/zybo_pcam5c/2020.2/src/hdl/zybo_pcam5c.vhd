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
-- Module Name: zybo_pcam5c - arch
-- Target Device: digilentinc.com:zybo-z7-20:part0:1.0 xc7z020clg400-1
-- Tool version: 2020.2
-- Description: zybo_pcam5c
--
-- Last update: 2021-08-10 12:05:13
--
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zybo_pcam5c is

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
        -- AXI I2C interface
        cam_iic_scl_io      : inout std_logic;
        cam_iic_sda_io      : inout std_logic;
        -- AXI GPIO interface
        led                 : out   std_logic_vector (3 downto 0);
        sw                  : in    std_logic_vector (3 downto 0);
        btn                 : in    std_logic_vector (3 downto 0);
        -- MIPI interface
        cam_gpio_tri_io     : out   std_logic_vector (0 downto 0);
        dphy_hs_clock_clk_n : in    std_logic;
        dphy_hs_clock_clk_p : in    std_logic;
        dphy_clk_lp_n       : in    std_logic;
        dphy_clk_lp_p       : in    std_logic;
        dphy_data_hs_n      : in    std_logic_vector (1 downto 0);
        dphy_data_hs_p      : in    std_logic_vector (1 downto 0);
        dphy_data_lp_n      : in    std_logic_vector (1 downto 0);
        dphy_data_lp_p      : in    std_logic_vector (1 downto 0)
    );

end zybo_pcam5c;


architecture arch of zybo_pcam5c is

    -- I2C1 signals
    signal cam_iic_sda_i  : std_logic                    := '0';
    signal cam_iic_sda_o  : std_logic                    := '0';
    signal cam_iic_sda_t  : std_logic                    := '0';
    signal cam_iic_scl_i  : std_logic                    := '0';
    signal cam_iic_scl_o  : std_logic                    := '0';
    signal cam_iic_scl_t  : std_logic                    := '0';

begin

ProcessingSystemxB : block is
    begin  -- block ProcessingSystemxB

        ZynqxI : entity work.zybo_pcam5c_zynqps_wrapper
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
                cam_iic_scl_i       => cam_iic_scl_i,
                cam_iic_scl_o       => cam_iic_scl_o,
                cam_iic_scl_t       => cam_iic_scl_t,
                cam_iic_sda_i       => cam_iic_sda_i,
                cam_iic_sda_o       => cam_iic_sda_o,
                cam_iic_sda_t       => cam_iic_sda_t,
                leds_4bits_tri_o    => led,
                sws_4bits_tri_i     => sw,
                btns_4bits_tri_i    => btn,
                cam_gpio            => cam_gpio_tri_io,
                dphy_clk_hs_n       => dphy_hs_clock_clk_n,
                dphy_clk_hs_p       => dphy_hs_clock_clk_p,
                dphy_clk_lp_n       => dphy_clk_lp_n,
                dphy_clk_lp_p       => dphy_clk_lp_p,
                dphy_data_hs_n      => dphy_data_hs_n,
                dphy_data_hs_p      => dphy_data_hs_p,
                dphy_data_lp_n      => dphy_data_lp_n,
                dphy_data_lp_p      => dphy_data_lp_p
            );

    end block ProcessingSystemxB;

    ProgrammableLogicxB : block is
    begin  -- block ProgrammableLogicxB        

        EntityIOxB : block is
        begin

            -- Camera I2C SDA tri-state buffer
            cam_iic_sda_io <= cam_iic_sda_o when cam_iic_sda_t='0' else 'Z';
            cam_iic_sda_i  <= cam_iic_sda_io;

            -- Camera I2C SCL tri-state buffer
            cam_iic_scl_io <= cam_iic_scl_o when cam_iic_scl_t='0' else 'Z';
            cam_iic_scl_i  <= cam_iic_scl_io;
            
        end block EntityIOxB;

    end block ProgrammableLogicxB;

end arch;
