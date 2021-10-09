library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_TRIGGER_TB is
--  Port ( );
end JK_TRIGGER_TB;


architecture Behavioral of JK_TRIGGER_TB is
    
    SIGNAL CLK, NOT_R, NOT_S, J, K: STD_LOGIC;
    SIGNAL Q, NOT_Q: STD_LOGIC;

begin

    uut: entity work.JK_TRIGGER port map(CLK, NOT_R, NOT_S, J, K, Q, NOT_Q);
    
    simulation: process
    begin

        J <= '0';
        K <= '0';
        NOT_R <= '1';
        NOT_S <= '1'; 
        wait for 40 ns;
        
        J <= '1';
        K <= '0';
        wait for 20 ns;
        
        J <= '0';
        K <= '1';
        wait for 20 ns;

        J <= '1';
        K <= '1';
        wait for 20 ns;
        
        J <= '1';
        K <= '0';
        NOT_R <= '0';
        wait for 20 ns;
        
        NOT_R <= '1';
        J <= '1';
        wait for 20 ns;
        
        NOT_S <= '0';
        J <= '0';
        K <= '1';
        wait for 20 ns;
        end process;

        clocking: process
        begin
           CLK <= '0';
           wait for 10 ns;
           CLK <= '1';
           wait for 10 ns;    
       end process;
end Behavioral;
