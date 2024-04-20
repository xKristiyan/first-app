library IEEE;
use IEEE.std_logic_1164.all;

entity pldcell3b is
    port(
        a, b, c, d : in STD_LOGIC;
        y : out STD_LOGIC
    );
end entity pldcell3b;

architecture beteende of pldcell3b is
    component pldcell3b
        port(
            x5, x4, x3, x2, x1, x0, inv : in STD_LOGIC;
            y : out std_logic
        );
    end component;

    signal not_a, not_c, a_c_and_d, a_and_c : std_logic;

begin
    not_a <= not a;
    not_c <= not c;
    a_c_and_d <= a and not_c and d;
    a_and_c <= a and c;

    PLD_instance : pldcell3b
    port map(
        x5 => not_a,
        x4 => not_c,
        x3 => d,
        x2 => a,
        x1 => c,
        x0 => '1',
        inv => '1',
        y => y
    );
end architecture beteende;
