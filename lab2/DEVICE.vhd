library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEVICE is
    Port(
        NOT_G: in STD_LOGIC;
        R: in STD_LOGIC;
        RCLK: in STD_LOGIC;
        NOT_CCLR: in STD_LOGIC;
        U: in STD_LOGIC;
        NOT_LOAD: in STD_LOGIC;
        NOT_ENP: in STD_LOGIC;
        NOT_ENT: in STD_LOGIC;
        CCK: in STD_LOGIC;

        A: in STD_LOGIC;
        B: in STD_LOGIC;
        C: in STD_LOGIC;
        D: in STD_LOGIC;

        QA: out STD_LOGIC;
        QB: out STD_LOGIC;
        QC: out STD_LOGIC;
        QD: out STD_LOGIC;

        NOT_RCO: out STD_LOGIC
        );
end DEVICE;

architecture Behavioral of JK_TRIGGER is
    signal NOT_C: STD_LOGIC;
    signal NOT_D: STD_LOGIC;
begin
    NOT_C <= not(R);
    NOT_D <= not(U);

    

end Behavioral;