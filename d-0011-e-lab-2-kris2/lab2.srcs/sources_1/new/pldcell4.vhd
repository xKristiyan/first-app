library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PLDcell4 is
    Port (
        x3, x2, x1, x0, inv: in STD_LOGIC;
        y : out STD_LOGIC
    );
end entity PLDcell4;

architecture beteende of PLDcell4 is
begin
    y <= (x0 and x1 and x2 and x3 and not inv);
end architecture beteende;
