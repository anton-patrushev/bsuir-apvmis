library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider is
    port( 
        CLK_IN : in STD_LOGIC;
        CLK_OUT : out STD_LOGIC
    );
end divider;

architecture divider of divider is
    signal i: integer := 0;
    signal temp: std_logic := '0';    
    constant divide_value: integer := (200000000 / 2) - 1;
    
    begin
        process (CLK_IN)
        begin
            if CLK_IN'event and CLK_IN = '1' then
                if (i = divide_value) then
                    i <= 0;
                    temp <= not temp;
                else i <= i + 1;
                end if;
            end if;
        end process;
        
        CLK_OUT <= temp; 
end divider;
