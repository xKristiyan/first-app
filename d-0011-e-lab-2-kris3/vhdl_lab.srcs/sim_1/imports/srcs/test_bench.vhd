library ieee;              -- Load the ieee 1164 library
use ieee.std_logic_1164.all;  -- Make the package 'visible'
 
 
-- The top level entity of the test bench has no ports...
entity test_bench is
end test_bench;
 
architecture stimulus of test_bench is
  -- First, declare the lower-level entity...
  component bcdcheck3
    port(x : in std_logic_vector(3 downto 0);
         max, min, even, lo3, noBCD, hieq3 : out std_logic);
  end component;
  
  component bcdcheck4
    port(x : in std_logic_vector(3 downto 0);
         max, min, even, lo3, noBCD, hieq3 : out std_logic);
  end component;
  
  component part2a
    port(a, b, c, d : std_logic; 
        f : out std_logic);
  end component;
  

  -- Next, declare some local signals to assign values to and observe...
  -- bcdcheck3/4 input
  signal x : std_logic_vector(3 downto 0);
  
  -- part2a input
  signal a, b, c, d : std_logic;
  
  -- bcdcheck3 outputs
  signal max3, min3, even3, lo33, noBCD3, hieq33 : std_logic;
  
  -- bcdcheck4 outputs
  signal max4, min4, even4, lo34, noBCD4, hieq34 : std_logic;
  
  -- part2a outputs
  signal f : std_logic;

 
begin
  -- Create an instance of the component under test
  -- Make sure the signal name for hieq3 is hieq3 otherwise the unit tests will not function.
  bcdcheck3_instance: bcdcheck3 port map( x => x, max => max3, min=>min3, even=>even3, lo3=>lo33, noBCD => noBCD3, hieq3 => hieq33);
  bcdcheck4_instance: bcdcheck4 port map( x => x, max => max4, min=>min4, even=>even4, lo3=>lo34, noBCD => noBCD4, hieq3 => hieq34);
  part2a_instance: part2a port map(a => a, b => b, c => c, d => d, f => f);
 
  -- Now define a process to apply some stimulus over time...
  process
    constant PERIOD: time := 40 ns;
  begin
    -- 0
    x <= "0000";
    a <= '0'; b <= '0'; c <= '0'; d <= '0';
    wait for PERIOD;
    assert max3 = '0' and min3 = '1' and even3 = '1' and lo33 = '1' and noBCD3 = '0' and hieq33 = '0' report "Assertion violation in Input value 0 failed";
    assert max4 = '0' and min4 = '1' and even4 = '1' and lo34 = '1' and noBCD4 = '0' and hieq34 = '0' report "Assertion violation in Input value 0 failed";
    assert f = '1' report "Assertion violation in Input value 0 failed";

    -- 1
    x <= "0001";
    a <= '0'; b <= '0'; c <= '0'; d <= '1';
    wait for PERIOD;
    assert max3 = '0' and min3 = '0' and even3 = '0' and lo33 = '1' and noBCD3 = '0' and hieq33 = '0' report "Assertion violation in Input value 1 failed";
    assert max4 = '0' and min4 = '0' and even4 = '0' and lo34 = '1' and noBCD4 = '0' and hieq34 = '0' report "Assertion violation in Input value 1 failed";
    assert f = '0' report "Assertion violation in Input value 1 failed";

    -- 2
    x <= "0010";
    a <= '0'; b <= '0'; c <= '1'; d <= '0';
    wait for PERIOD;
    assert max3 = '0' and min3 = '0' and even3 = '1' and lo33 = '1' and noBCD3 = '0' and hieq33 = '0' report "Assertion violation in Input value 2 failed";
    assert max4 = '0' and min4 = '0' and even4 = '1' and lo34 = '1' and noBCD4 = '0' and hieq34 = '0' report "Assertion violation in Input value 2 failed";
    assert f = '1' report "Assertion violation in Input value 2 failed";

    -- 3
    x <= "0011";
    a <= '0'; b <= '0'; c <= '1'; d <= '1';
    wait for PERIOD;        
    assert max3 = '0' and min3 = '0' and even3 = '0' and lo33 = '0' and noBCD3 = '0' and hieq33 = '1' report "Assertion violation in Input value 3 failed";
    assert max4 = '0' and min4 = '0' and even4 = '0' and lo34 = '0' and noBCD4 = '0' and hieq34 = '1' report "Assertion violation in Input value 3 failed";
    assert f = '1' report "Assertion violation in Input value 3 failed";


    -- 4
    x <= "0100";
    a <= '0'; b <= '1'; c <= '0'; d <= '0';
    wait for PERIOD;
    assert max3 = '0' and min3 = '0' and even3 = '1' and lo33 = '0' and noBCD3 = '0' and hieq33 = '1' report "Assertion violation in Input value 4 failed";
    assert max4 = '0' and min4 = '0' and even4 = '1' and lo34 = '0' and noBCD4 = '0' and hieq34 = '1' report "Assertion violation in Input value 4 failed";
    assert f = '1' report "Assertion violation in Input value 4 failed";


    -- 5
    x <= "0101";
    a <= '0'; b <= '1'; c <= '0'; d <= '1';
    wait for PERIOD;
    assert max3 = '0' and min3 = '0' and even3 = '0' and lo33 = '0' and noBCD3 = '0' and hieq33 = '1' report "Assertion violation in Input value 5 failed";
    assert max4 = '0' and min4 = '0' and even4 = '0' and lo34 = '0' and noBCD4 = '0' and hieq34 = '1' report "Assertion violation in Input value 5 failed";
    assert f = '0' report "Assertion violation in Input value 5 failed";


    -- 6
    x <= "0110";
    a <= '0'; b <= '1'; c <= '1'; d <= '0';
    wait for PERIOD;
    assert max3 = '0' and min3 = '0' and even3 = '1' and lo33 = '0' and noBCD3 = '0' and hieq33 = '1' report "Assertion violation in Input value 6 failed";
    assert max4 = '0' and min4 = '0' and even4 = '1' and lo34 = '0' and noBCD4 = '0' and hieq34 = '1' report "Assertion violation in Input value 6 failed";
    assert f = '1' report "Assertion violation in Input value 6 failed";


    -- 7
    x <= "0111";
    a <= '0'; b <= '1'; c <= '1'; d <= '1';
    wait for PERIOD;        
    assert max3 = '0' and min3 = '0' and even3 = '0' and lo33 = '0' and noBCD3 = '0' and hieq33 = '1' report "Assertion violation in Input value 7 failed";
    assert max4 = '0' and min4 = '0' and even4 = '0' and lo34 = '0' and noBCD4 = '0' and hieq34 = '1' report "Assertion violation in Input value 7 failed";
    assert f = '1' report "Assertion violation in Input value 7 failed";


    -- 8
    x <= "1000";
    a <= '1'; b <= '0'; c <= '0'; d <= '0';
    wait for PERIOD;
    assert max3 = '0' and min3 = '0' and even3 = '1' and lo33 = '0' and noBCD3 = '0' and hieq33 = '1' report "Assertion violation in Input value 8 failed";
    assert max4 = '0' and min4 = '0' and even4 = '1' and lo34 = '0' and noBCD4 = '0' and hieq34 = '1' report "Assertion violation in Input value 8 failed";
    assert f = '1' report "Assertion violation in Input value 8 failed";

    -- 9
    x <= "1001";
    a <= '1'; b <= '0'; c <= '0'; d <= '1';
    wait for PERIOD;
    assert max3 = '1' and min3 = '0' and even3 = '0' and lo33 = '0' and noBCD3 = '0' and hieq33 = '1' report "Assertion violation in Input value 9 failed";
    assert max4 = '1' and min4 = '0' and even4 = '0' and lo34 = '0' and noBCD4 = '0' and hieq34 = '1' report "Assertion violation in Input value 9 failed";
    assert f = '1' report "Assertion violation in Input value 9 failed";

    
    -- 10
    x <= "1010";
    a <= '1'; b <= '0'; c <= '1'; d <= '0';
    wait for PERIOD;
    assert max3 = '0' and min3 = '0' and even3 = '1' and lo33 = '0' and noBCD3 = '1' and hieq33 = '0' report "Assertion violation in Input value 10 failed";
    assert max4 = '0' and min4 = '0' and even4 = '1' and lo34 = '0' and noBCD4 = '1' and hieq34 = '0' report "Assertion violation in Input value 10 failed";
    assert f = '0' report "Assertion violation in Input value 10 failed";


    -- 11
    x <= "1011";
    a <= '1'; b <= '0'; c <= '1'; d <= '1';
    wait for PERIOD;
    assert max3 = '0' and min3 = '0' and even3 = '0' and lo33 = '0' and noBCD3 = '1' and hieq33 = '0' report "Assertion violation in Input value 11 failed";
    assert max4 = '0' and min4 = '0' and even4 = '0' and lo34 = '0' and noBCD4 = '1' and hieq34 = '0' report "Assertion violation in Input value 11 failed";
    assert f = '0' report "Assertion violation in Input value 11 failed";

    
    -- 12
    x <= "1100";
    a <= '1'; b <= '1'; c <= '0'; d <= '0';
    wait for PERIOD;
    assert max3 = '0' and min3 = '0' and even3 = '1' and lo33 = '0' and noBCD3 = '1' and hieq33 = '0' report "Assertion violation in Input value 12 failed";
    assert max4 = '0' and min4 = '0' and even4 = '1' and lo34 = '0' and noBCD4 = '1' and hieq34 = '0' report "Assertion violation in Input value 12 failed";
    assert f = '1' report "Assertion violation in Input value 12 failed";
    
    -- 13
    x <= "1101";
    a <= '1'; b <= '1'; c <= '0'; d <= '1';
    wait for PERIOD;
    assert max3 = '0' and min3 = '0' and even3 = '0' and lo33 = '0' and noBCD3 = '1' and hieq33 = '0' report "Assertion violation in Input value 13 failed";
    assert max4 = '0' and min4 = '0' and even4 = '0' and lo34 = '0' and noBCD4 = '1' and hieq34 = '0' report "Assertion violation in Input value 13 failed";
    assert f = '1' report "Assertion violation in Input value 13 failed";

    -- 14
    x <= "1110";
    a <= '1'; b <= '1'; c <= '1'; d <= '0';
    wait for PERIOD;
    assert max3 = '0' and min3 = '0' and even3 = '1' and lo33 = '0' and noBCD3 = '1' and hieq33 = '0' report "Assertion violation in Input value 14 failed";
    assert max4 = '0' and min4 = '0' and even4 = '1' and lo34 = '0' and noBCD4 = '1' and hieq34 = '0' report "Assertion violation in Input value 14 failed";
    assert f = '0' report "Assertion violation in Input value 14 failed";

    -- 15
    x <= "1111";
    a <= '1'; b <= '1'; c <= '1'; d <= '1';
    wait for PERIOD;
    assert max3 = '0' and min3 = '0' and even3 = '0' and lo33 = '0' and noBCD3 = '1' and hieq33 = '0' report "Assertion violation in Input value 15 failed";
    assert max4 = '0' and min4 = '0' and even4 = '0' and lo34 = '0' and noBCD4 = '1' and hieq34 = '0' report "Assertion violation in Input value 15 failed";
    assert f = '0' report "Assertion violation in Input value 15 failed";

    -- put breakpoint to line below
    wait for PERIOD;        
    
    -- do not run again
    wait;
  end process;
end stimulus;





