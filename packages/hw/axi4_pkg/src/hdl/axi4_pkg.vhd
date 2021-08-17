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
-- Author: Joachim Schmidt <joachim.schmidt@hesge.ch>
--
-- Module Name: axi4_pkg
-- Target Device: SCALP xc7z015clg485-2
-- Tool version: 2020.2
-- Description: AXI4 format bus signals.
--
-- Last update: 2020-11-25
--
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package axi4_pkg is

    constant C_AXI4_DATA_SIZE        : integer range 0 to 32 := 32;
    constant C_AXI4_KEEP_SIZE        : integer range 0 to 32 := 4;
    constant C_AXI4_UFC_RX_DATA_SIZE : integer range 0 to 32 := 32;
    constant C_AXI4_UFC_TX_DATA_SIZE : integer range 0 to 32 := 3;
    constant C_AXI4_NFC_DATA_SIZE    : integer range 0 to 32 := 4;
    constant C_AXI4_DEST_SIZE        : integer range 0 to 32 := 4;
    constant C_AXI4_STRB_SIZE        : integer range 0 to 32 := C_AXI4_KEEP_SIZE;  -- Same as Keep
    constant C_AXI4_USER_SIZE        : integer range 0 to 32 := 32;

    -- AXI4 Framing
    -- Master to Slave
    type t_axi4m2s is record
        -- Big Endian
        DataxD  : std_ulogic_vector(0 to (C_AXI4_DATA_SIZE - 1));
        KeepxD  : std_ulogic_vector(0 to (C_AXI4_KEEP_SIZE - 1));
        LastxS  : std_ulogic;
        ValidxS : std_ulogic;
        -- Not Necessary
        IdxS    : std_ulogic;
        DestxD  : std_ulogic_vector(0 to (C_AXI4_DEST_SIZE - 1));
        StrbxD  : std_ulogic_vector(0 to (C_AXI4_STRB_SIZE - 1));
        UserxD  : std_ulogic_vector(0 to (C_AXI4_USER_SIZE - 1));
    end record t_axi4m2s;

    -- Slave to Master
    type t_axi4s2m is record
        ReadyxS : std_ulogic;
    end record t_axi4s2m;

    constant C_NO_AXI4_M2S : t_axi4m2s := (DataxD  => (others => '0'),
                                           KeepxD  => (others => '0'),
                                           LastxS  => '0',
                                           ValidxS => '0',
                                           IdxS    => '0',
                                           DestxD  => (others => '0'),
                                           StrbxD  => (others => '0'),
                                           UserxD  => (others => '0'));
    constant C_NO_AXI4_S2M : t_axi4s2m := (ReadyxS => '0');

    -- Non-Generic Vector of AXI4 Framing Bus
    ---------------------------------------------------------------------------
    -- constant C_SIM_VIVADO_VECTOR_SIZE : integer := 6;
    -- type t_axi4m2s_vector is array ((C_SIM_VIVADO_VECTOR_SIZE - 1) downto 0) of t_axi4m2s;
    -- type t_axi4s2m_vector is array ((C_SIM_VIVADO_VECTOR_SIZE - 1) downto 0) of t_axi4s2m;

    -- constant C_NO_SIM_AXISM2S_VECTOR : t_axi4m2s_vector := (others => C_NO_AXI4_M2S);
    -- constant C_NO_SIM_AXISS2M_VECTOR : t_axi4s2m_vector := (others => C_NO_AXI4_S2M);
    -- -- Generic Vector of AXI4 Framing Bus Vector
    -- type t_axi4m2s_vector_vector is array (natural range <>) of t_axi4m2s_vector;
    -- type t_axi4s2m_vector_vector is array (natural range <>) of t_axi4s2m_vector;
    ---------------------------------------------------------------------------   
    -- Generic Vector of AXI4 Framing Bus
    type t_axi4m2s_vector is array (natural range <>) of t_axi4m2s;
    type t_axi4s2m_vector is array (natural range <>) of t_axi4s2m;

    -- Generic Vector of AXI4 Framing Bus Vector
    type t_axi4m2s_vector_vector is array (natural range <>) of t_axi4m2s_vector;
    type t_axi4s2m_vector_vector is array (natural range <>) of t_axi4s2m_vector;

    -- AXI4 UFC
    -- Master to Slave RX
    type t_axi4ufcm2s_rx is record
        -- Big Endian
        DataxD  : std_ulogic_vector(0 to (C_AXI4_UFC_RX_DATA_SIZE - 1));
        KeepxD  : std_ulogic_vector(0 to (C_AXI4_KEEP_SIZE - 1));
        LastxS  : std_ulogic;
        ValidxS : std_ulogic;
    end record t_axi4ufcm2s_rx;

    -- Master to Slave TX
    type t_axi4ufcm2s_tx is record
        -- Big Endian
        DataxD  : std_ulogic_vector(0 to (C_AXI4_UFC_TX_DATA_SIZE - 1));
        ValidxS : std_ulogic;
    end record t_axi4ufcm2s_tx;

    -- Slave to Master
    type t_axi4ufcs2m_tx is record
        ReadyxS : std_ulogic;
    end record t_axi4ufcs2m_tx;

    constant C_NO_AXI4_UFC_M2S_RX : t_axi4ufcm2s_rx := (DataxD  => (others => '0'),
                                                        KeepxD  => (others => '0'),
                                                        LastxS  => '0',
                                                        ValidxS => '0');
    constant C_NO_AXI4_UFC_M2S_TX : t_axi4ufcm2s_tx := (DataxD  => (others => '0'),
                                                        ValidxS => '0');
    constant C_NO_AXI4_UFC_S2M_TX : t_axi4ufcs2m_tx := (ReadyxS => '0');

    -- AXI4 NFC
    -- Master to Slave
    type t_axi4nfcm2s is record
        -- Big Endian
        DataxD  : std_ulogic_vector(0 to (C_AXI4_NFC_DATA_SIZE - 1));
        ValidxS : std_ulogic;
    end record t_axi4nfcm2s;

    -- Slave to Master
    type t_axi4nfcs2m is record
        ReadyxS : std_ulogic;
    end record t_axi4nfcs2m;

    constant C_NO_AXI4_NFC_M2S : t_axi4nfcm2s := (DataxD  => (others => '0'),
                                                  ValidxS => '0');
    constant C_NO_AXI4_NFC_S2M : t_axi4nfcs2m := (ReadyxS => '0');

    -- NFC Codes
    constant C_NFC_XON  : std_ulogic_vector((C_AXI4_NFC_DATA_SIZE - 1) downto 0) := (others => '0');
    constant C_NFC_XOFF : std_ulogic_vector((C_AXI4_NFC_DATA_SIZE - 1) downto 0) := (others => '1');

    type t_nfc_states is (C_NFC_IDLE, C_NFC_IS_XON, C_NFC_IS_XOFF, C_NFC_SEND_XON, C_NFC_SEND_XOFF);

    -- Axis Fifo Status
    type t_axi4fifo_status is record
        WrDataCntxD : std_ulogic_vector((C_AXI4_DATA_SIZE - 1) downto 0);
        RdDataCntxD : std_ulogic_vector((C_AXI4_DATA_SIZE - 1) downto 0);
        ProgEmptyxS : std_ulogic;
        ProgFullxS  : std_ulogic;
    end record t_axi4fifo_status;

    constant C_NO_AXI4_FIFO_STATUS : t_axi4fifo_status := (WrDataCntxD => (others => '0'),
                                                           RdDataCntxD => (others => '0'),
                                                           ProgEmptyxS => '0',
                                                           ProgFullxS  => '0');

    -- Axis Fifo Error Counter
    type t_axi4fifo_error is record
        NorthCounterxD : unsigned((C_AXI4_DATA_SIZE - 1) downto 0);
        EastCounterxD  : unsigned((C_AXI4_DATA_SIZE - 1) downto 0);
        SouthCounterxD : unsigned((C_AXI4_DATA_SIZE - 1) downto 0);
        WestCounterxD  : unsigned((C_AXI4_DATA_SIZE - 1) downto 0);
    end record t_axi4fifo_error;

    constant C_NO_AXI4_FIFO_ERROR : t_axi4fifo_error := (NorthCounterxD => (others => '0'),
                                                         EastCounterxD  => (others => '0'),
                                                         SouthCounterxD => (others => '0'),
                                                         WestCounterxD  => (others => '0'));

    -- Native Fifo for Scalp packets
    type t_native_fifo_slave is record
        DataxD : std_ulogic_vector((C_AXI4_DATA_SIZE - 1) downto 0);
        WrEnxS : std_ulogic;
        RdEnxS : std_ulogic;
    end record t_native_fifo_slave;

    constant C_NO_NATIVE_FIFO_SLAVE : t_native_fifo_slave := (DataxD => (others => '0'),
                                                              WrEnxS => '0',
                                                              RdEnxS => '0');

    type t_native_fifo_master is record
        DataxD        : std_ulogic_vector((C_AXI4_DATA_SIZE - 1) downto 0);
        FullxS        : std_ulogic;
        EmptyxS       : std_ulogic;
        AlmostFullxS  : std_ulogic;
        AlmostEmptyxS : std_ulogic;
        WrRstBusyxS   : std_ulogic;
        RdRstBusyxS   : std_ulogic;
    end record t_native_fifo_master;

    constant C_NO_NATIVE_FIFO_MASTER : t_native_fifo_master := (DataxD        => (others => '0'),
                                                                FullxS        => '0',
                                                                EmptyxS       => '0',
                                                                AlmostFullxS  => '0',
                                                                AlmostEmptyxS => '0',
                                                                WrRstBusyxS   => '0',
                                                                RdRstBusyxS   => '0');

    -- AXI4 Functions
    -- OR reduce from t_axi4s2m_vector
    function or_reduce_t_axi4s2m_vector (
        signal VectorxD : t_axi4s2m_vector)
        return t_axi4s2m;

end package axi4_pkg;

package body axi4_pkg is

    -- AXI4 Functions
    -- OR reduce from t_axi4s2m_vector
    function or_reduce_t_axi4s2m_vector (
        signal VectorxD : t_axi4s2m_vector)
        return t_axi4s2m is
        variable ResultxS : t_axi4s2m := C_NO_AXI4_S2M;
    begin  -- function or_reduce_t_axi4s2m_vector
        for i in VectorxD'range loop
            ResultxS.ReadyxS := ResultxS.ReadyxS or VectorxD(i).ReadyxS;
        end loop;  -- i

        return ResultxS;
    end function or_reduce_t_axi4s2m_vector;

end package body axi4_pkg;
