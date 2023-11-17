library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult_sec_nbits is
    generic (
        N : integer := 4 
    );
    port (
        clk, st: in std_logic;
        mplier, mcand: in std_logic_vector(N - 1 downto 0);
        done: out std_logic;
        product: out std_logic_vector((2 * N) - 1 downto 0)
    );
end entity mult_sec_nbits;

architecture comportamiento of mult_sec_nbits is
    signal estado_act, estado_sig: integer range 0 to 3;
    signal cnt_act, cnt_sig: integer range 0 to N;
    signal K, M: std_logic;
    signal acu_act, acu_sig: std_logic_vector((2 * N) downto 0);
    signal Load, Ad, Sh: std_logic;
    signal suma: std_logic_vector(N downto 0);
    signal acu_suma: std_logic_vector(N - 1 downto 0);
begin                                                                                                                                   
    M <= acu_act(0);
    acu_suma <= acu_act((2 * N) - 1 downto N);
    product <= acu_act((2 * N) - 1 downto 0);
    suma <= std_logic_vector(('0' & unsigned(mcand)) + ('0' & unsigned(acu_suma)));
    K <= '1' when (cnt_act = (N-1)) else '0';

    --Memoria de estado y acumulador
    process (clk)
    begin
        if clk'event and clk = '1' then
            cnt_act <= cnt_sig;
            estado_act <= estado_sig;
            acu_act <= acu_sig;     
        end if;
    end process;

    --les contador
    process (cnt_act, Sh, st, K)
    begin
        if st = '1'  then
            cnt_sig <= 0;
        elsif Sh = '1' and K = '0' then
            cnt_sig <= cnt_act+1;
        else
            cnt_sig <= cnt_act;
        end if;
    end process;

    --les controlador
    process (estado_act, st, M, K) -- k? M?
    begin
        -- Valores default
        Load <= '0';
        Sh <= '0';
        Ad <= '0';
        Done <= '0';
        estado_sig <= estado_act;

        case estado_act is
            when 0 =>
                if st = '1' then
                    Load <= '1';
                    estado_sig <= 1;
                end if;
            when 1 =>
                if K = '0' and M = '0' then
                    Sh <= '1';
                    estado_sig <= 1;
                elsif M = '1' then
                    Ad <= '1';
                    estado_sig <= 2;
                elsif K = '1' and M = '0' then
                    Sh <= '1';
                    estado_sig <= 3;
                end if;
            when 2 =>
                Sh <= '1';
                if K = '0' then
                    estado_sig <= 1;
                else
                    estado_sig <= 3;
                end if;
            when 3 =>
                done <= '1';
                estado_sig <= 0;
        end case;
    end process;

    --les acumulador
    process (Load, Sh, Ad, mplier, acu_act, suma)
    begin
        if Load = '1' then 
            acu_sig <= ((2*N) downto 0 => '0'); -- Posible error
            acu_sig(N-1 downto 0) <= mplier;
        elsif Ad = '1' then
            acu_sig <= suma & acu_act(N-1 downto 0);
        elsif Sh = '1' then
            acu_sig <= '0' & acu_act((2 * N) downto 1);
        else 
            acu_sig <= acu_act;
        end if;
    end process;
end architecture comportamiento;
