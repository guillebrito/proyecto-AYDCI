library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult_comb_nbits is
   generic (n: integer := 4);
   port(
    mplier, mcand: in std_logic_vector(n-1 downto 0);
    product: out std_logic_vector(2*n - 1 downto 0)
   );
end entity mult_comb_nbits;

architecture rtl of mult_comb_nbits is
begin
    product <= std_logic_vector(unsigned(mplier) * unsigned(mcand));
end architecture;

