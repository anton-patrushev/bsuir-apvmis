library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEVICE_TB is

end DEVICE_TB;

architecture Behavioral of DEVICE_TB is
    SIGNAL NOT_G: STD_LOGIC;
    SIGNAL NOT_CCLR: STD_LOGIC;
    SIGNAL NOT_LOAD: STD_LOGIC;
    SIGNAL NOT_ENP: STD_LOGIC;
    SIGNAL NOT_ENT: STD_LOGIC;
    SIGNAL U: STD_LOGIC;
    SIGNAL RCK: STD_LOGIC;
    SIGNAL CCK: STD_LOGIC;
    SIGNAL R: STD_LOGIC;

    SIGNAL A: STD_LOGIC;
    SIGNAL B: STD_LOGIC;
    SIGNAL C: STD_LOGIC;
    SIGNAL D: STD_LOGIC;

    SIGNAL QA: STD_LOGIC;
    SIGNAL QB: STD_LOGIC;
    SIGNAL QC: STD_LOGIC;
    SIGNAL QD: STD_LOGIC;

    SIGNAL NOT_RCO: STD_LOGIC;
begin
    uut: entity work.DEVICE port map(
        NOT_G,
        R,
        RCK,
        NOT_CCLR,
        U,
        NOT_LOAD,
        NOT_ENP,
        NOT_ENT,
        CCK,
        
        A,
        B,
        C,
        D,
        
        QA,
        QB,
        QC,
        QD,

        NOT_RCO
    );


    simulating: process
    begin
        NOT_G <= '0';
        NOT_CCLR <= '1';
        NOT_LOAD <= '1';
        NOT_ENP <= '0';
        NOT_ENT <= '0';
        U <= '1';

        RCK <= '0';
        -- CCK <= '0';

        R <= '0';

        A <= '1';
        B <= '0';
        C <= '0';
        D <= '1';
        -- CCK <= '0';
        NOT_LOAD <= '0';

        wait for 5 ps;

        -- wait for 5 ps;
        wait for 10 ps;
        
        -- CCK <= '1';
        wait for 10 ps;
        
        -- CCK <= '0';
        wait for 10 ps;
        
        -- CCK <= '1';
        -- wait for 5 ps;
        
        NOT_CCLR <= '0';
        wait for 10 ps;

        -- CCK <= '0';
        wait for 10 ps;

        -- CCK <= '1';
        NOT_CCLR <= '1';
        wait for 10 ps;

        -- wait for 3 ps;

        -- CCK <= '0';
        NOT_LOAD <= '0';

        A <= '1';
        B <= '0';
        C <= '1';
        D <= '1';

        wait for 10 ps;
        
        -- CCK <= '1';
        -- wait for 8 ps;

        NOT_LOAD <= '1';
        wait for 10 ps;

        -- CCK <= '0';
        RCK <= '1';

        A <= '0';
        B <= '0';
        C <= '0';
        D <= '0';

        wait for 10 ps;
        
        RCK <= '0';
        -- CCK <= '1';
        wait for 10 ps;

        -- CCK <= '0';
        wait for 10 ps;

        -- CCK <= '1';
        wait for 10 ps;

        -- CCK <= '0';
        wait for 10 ps;

        -- CCK <= '1';
        wait for 10 ps;

        -- CCK <= '0';
        wait for 10 ps;

        -- CCK <= '1';
        wait for 10 ps;

        -- CCK <= '0';
        wait for 10 ps;

        -- CCK <= '1';
        wait for 10 ps;

        -- CCK <= '0';
        wait for 10 ps;

        --  10 clks


        -- CCK <= '1';
        wait for 10 ps;

        -- CCK <= '0';
        R <= '1';
        wait for 10 ps;

        -- CCK <= '1';
        wait for 10 ps;

        -- CCK <= '0';
        wait for 10 ps;
        
        -- CCK <= '1';
        -- wait for 5 ps;

        U <= '0';
        wait for 10 ps;

        -- CCK <= '0';
        RCK <= '1';
        wait for 10 ps;

        -- CCK <= '1';
        RCK <= '0';
        wait for 10 ps;

        NOT_G <= '1';
        wait for 10 ps;

        --

        -- CCK <= '0';
        RCK <= '1';
        wait for 10 ps;

        -- CCK <= '1';
        RCK <= '0';
        wait for 10 ps;

        -- CCK <= '0';
        RCK <= '1';
        wait for 10 ps;

        -- CCK <= '1';
        RCK <= '0';
        wait for 10 ps;

        NOT_G <= '0';
        -- CCK <= '0';
        RCK <= '1';
        wait for 10 ps;

        --

        -- CCK <= '1';
        RCK <= '0';
        wait for 10 ps;

        -- CCK <= '0';
        RCK <= '1';
        wait for 10 ps;

        -- CCK <= '1';
        RCK <= '0';
        wait for 10 ps;

        -- CCK <= '0';
        RCK <= '1';
        wait for 10 ps;

        -- CCK <= '1';
        RCK <= '0';
        wait for 10 ps;

        -- CCK <= '0';
        RCK <= '1';
        wait for 10 ps;

        -- CCK <= '1';
        RCK <= '0';
        wait for 10 ps;

        -- CCK <= '0';
        RCK <= '1';
        wait for 10 ps;

        -- disable RCK

        RCK <= '0';
        -- CCK <= '1';
        wait for 10 ps;

        R <= '0';
        -- CCK <= '0';
        wait for 10 ps;

        -- CCK <= '1';
        wait for 8 ps;

        NOT_ENP <= '1';
        U <= '1';
        wait for 2 ps;

        -- CCK <= '0';
        wait for 10 ps;

        -- CCK <= '1';
        wait for 10 ps;

        -- CCK <= '0';
        NOT_ENT <= '1';
        wait for 10 ps;

        -- CCK <= '1';
        wait for 10 ps;

        -- CCK <= '0';
        NOT_ENP <= '0';
        wait for 10 ps;

        -- CCK <= '1';
        wait for 10 ps;

        -- CCK <= '0';

        wait;

    end process;

    clocking: process
    begin
        CCK <= '0';
        wait for 10 ps;

        CCK <= '1';
        wait for 10 ps;
    end process;

end Behavioral;