library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_TRIGGER is
    Port(
        CLK, NOT_R, NOT_S, J, K : in STD_LOGIC;
        Q, NOT_Q : out STD_LOGIC
        );
end JK_TRIGGER;

architecture Behavioral of JK_TRIGGER is

begin
    process (CLK, NOT_R, NOT_S)
    variable q_value: std_logic :='0';
    begin
        -- if  NOT_R='0' then
        --     q_value :='0';
        -- elsif NOT_S='0' then
        --     q_value :='1';
        -- elsif CLK'event and CLK= '1' then
        --     if J='1' and K='1' then
        --         q_value := not q_value;
        --     elsif J='1' then
        --         q_value := '1';
        --     elsif K='1' then
        --         q_value := '0';       
        --     end if;
        -- end if;

        if (NOT_S = '0') then
            q_value := '1';
        elsif (NOT_R = '0') then
            q_value := '0';
        
        -- if CLK value was changed and current value is H
        elsif (CLK'event and CLK = '1') then
            -- J == 0 & K == 1 -> Q = 0
            if(J = '0' and K = '1') then
                q_value := '0';

            -- J == 1 & K == 0 -> Q = 1
            elsif(J = '1' and K = '0') then
                q_value := '1';

            -- J == 1 & K == 1 -> toggle Q
            elsif(J = '1' and K = '1') then
                q_value := not(q_value);
            end if;

        end if;

     Q <= q_value;
     NOT_Q <= not(q_value);  
    end process;  
end Behavioral;