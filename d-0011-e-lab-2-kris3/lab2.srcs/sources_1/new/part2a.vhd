library IEEE;
use IEEE.std_logic_1164.all;

entity part2a is 
    port (
        a, b, c, d : in std_logic;
        f : out std_logic
    );
end entity part2a;

architecture behavioral of part2a is 
begin
    f <= (not b and not c and not d) or
         (not a and not d) or
         (a and not c) or
         (not a and c);
end architecture behavioral;

