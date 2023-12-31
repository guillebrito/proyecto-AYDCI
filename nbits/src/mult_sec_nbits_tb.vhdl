library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult_sec_nbits_tb is
  end mult_sec_nbits_tb;

architecture test1 of mult_sec_nbits_tb is
  component mult_sec_nbits
    generic (
      N : integer := 4
    );
    port (clk, st: in std_logic;
          mplier, mcand: in std_logic_vector(N-1 downto 0);
          product: out std_logic_vector((2 * N) - 1 downto 0);
          done: out std_logic);
  end component;

  constant N_VAL: integer:= 6;
  constant M: integer:= 6;
  type arr is array(1 to M) of std_logic_vector(N_VAL-1 downto 0);
  constant MCANDARR: arr:= ("111010", "101010", "000010", "100001", "110110", "110110");
  constant MPLIERARR: arr:= ("101010", "110110", "100010", "101000", "111110","000000");
  signal clk: std_logic := '0';
  signal st, done: std_logic;
  signal mplier, mcand: std_logic_vector(N_VAL-1 downto 0);
  signal product: std_logic_vector((2 * N_VAL) - 1 downto 0);

begin
  mult1: mult_sec_nbits
    generic map (
      N => N_VAL  -- Asignación del valor de N al DUT (Design Under Test)
    )
    port map (
      clk => clk,
      st => st,
      mplier => mplier,
      mcand => mcand,
      done => done,
      product => product
    );
  --port map(clk, st, mplier, mcand, product1, done1);

  clk <= not clk after 10 ns; -- clock has 20 ns period
  
  process
    begin
      for i in 1 to M loop
        mcand <= MCANDARR(i);
        mplier <= MPLIERARR(i);
        st <= '1';
        wait until clk = '1' and clk'event;
        st <= '0';
        wait until (done = '1') ;
        wait until clk = '1' and clk'event;
      end loop;
      std.env.stop;
  end process;
end test1;
