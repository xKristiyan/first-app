library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pldcell3c is
    port(
        a, b, c, d, e : in STD_LOGIC;
        g : out STD_LOGIC
    );
end entity pldcell3c;

architecture beteende of pldcell3c is
    component pldcell3c
        port(
            x5, x4, x3, x2, x1, x0, inv : in STD_LOGIC;
            y : out std_logic
        );
    end component;

    signal not_a, not_b, not_c, out1, out2 : std_logic;

begin
    not_a <= not a;
    not_b <= not b;
    not_c <= not c;

    PLD_instance1 : pldcell3c
    port map(
        x5 => a,
        x4 => b,
        x3 => c,
        x2 => '0',
        x1 => '0',
        x0 => '0',
        inv => '0',
        y => out1
    );

    PLD_instance2: pldcell3c
    port map(
        x5 => out1,
        x4 => d,
        x3 => e,
        x2 => not_a,
        x1 => not_b,
        x0 => not_c,
        inv => '0',
        y => out2
    );

    g <= out2;
end architecture beteende;
