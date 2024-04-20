library IEEE;
use IEEE.std_logic_1164.all;

entity pldcell3a is
    port(
        x5, x4, x3, x2, x1, x0, inv : in std_logic;
        y : out std_logic);
end entity pldcell3a;

architecture beteende of pldcell3a is
    signal term1, term2, term3, term4 : std_logic;
begin
    term1 <= (not x5) and (not x4) and (not x3) and (not x2) and x1 and x0;
    term2 <= (not x4) and (not x3) and (not x2) and (not x0);
    term3 <= x4 and (not x3) and (not x1);
    term4 <= (not x4) and x3;

    y <= (term1 or term2 or term3 or term4) xor inv;
end architecture beteende;
