library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEVICE_TB is

end DEVICE_TB;

architecture Behavioral of DEVICE_TB is
    SIGNAL NOT_G: STD_LOGIC;
    SIGNAL R: STD_LOGIC;
    SIGNAL RCLK: STD_LOGIC;
    SIGNAL NOT_CCLR: STD_LOGIC;
    SIGNAL U: STD_LOGIC;
    SIGNAL NOT_LOAD: STD_LOGIC;
    SIGNAL NOT_ENP: STD_LOGIC;
    SIGNAL NOT_ENT: STD_LOGIC;
    SIGNAL CCK: STD_LOGIC;

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
        RCLK,
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
        NOT_G <= '1';
        wait for 40 ns;

        NOT_G <= '0';
        A <= '0';
        B <= '0';
        C <= '0';
        D <= '0';
        wait for 20 ns;

        NOT_G <= '0';
        A <= '1';
        B <= '0';
        C <= '0';
        D <= '0';
        wait for 20 ns;

        NOT_G <= '0';
        A <= '0';
        B <= '1';
        C <= '0';
        D <= '0';
        wait for 20 ns;

        NOT_G <= '0';
        A <= '1';
        B <= '0';
        C <= '1';
        D <= '0';
        wait for 20 ns;

        NOT_G <= '0';
        A <= '0';
        B <= '0';
        C <= '0';
        D <= '1';
        wait for 20 ns;

        NOT_G <= '0';
        A <= '0';
        B <= '0';
        C <= '0';
        D <= '0';
        wait for 20 ns;

        NOT_G <= '1';
        wait;

    end process;

    clocking: process
    begin
        RCLK <= '0';
        wait for 10 ns;
        RCLK <= '1';
        wait for 10 ns;    
    end process;

end Behavioral;