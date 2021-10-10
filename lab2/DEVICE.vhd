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

architecture Behavioral of DEVICE is
    component JK_TRIGGER is
        Port ( 
            CLK, J, K : in STD_LOGIC;
            NOT_R, NOT_S : in STD_LOGIC := '1';
            Q, NOT_Q : out STD_LOGIC
        );
    end component;

    signal NOT_RCLK: STD_LOGIC;
    signal NOT_RCLK: STD_LOGIC;

    signal CCLR: STD_LOGIC;

    signal NOT_A: STD_LOGIC;
    signal NOT_B: STD_LOGIC;
    signal NOT_C: STD_LOGIC;
    signal NOT_D: STD_LOGIC;

    signal NOT_A_OR: STD_LOGIC;
    signal NOT_B_OR: STD_LOGIC;
    signal NOT_C_OR: STD_LOGIC;
    signal NOT_D_OR: STD_LOGIC;

    signal ENP_AND: STD_LOGIC;

    signal NOT_OR_1: STD_LOGIC;
    signal NOT_OR_2: STD_LOGIC;
    signal NOT_OR_3: STD_LOGIC;
    signal NOT_OR_4: STD_LOGIC;

    signal D1_A_IN: STD_LOGIC;
    signal D1_B_IN: STD_LOGIC;
    signal D1_C_IN: STD_LOGIC;
    signal D1_D_IN: STD_LOGIC;
    
    signal NOT_D1_A_IN: STD_LOGIC;
    signal NOT_D1_B_IN: STD_LOGIC;
    signal NOT_D1_C_IN: STD_LOGIC;
    signal NOT_D1_D_IN: STD_LOGIC;

    signal D1_A_OUT: STD_LOGIC;
    signal D1_B_OUT: STD_LOGIC;
    signal D1_C_OUT: STD_LOGIC;
    signal D1_D_OUT: STD_LOGIC;

    signal NOT_D1_A_OUT: STD_LOGIC;
    signal NOT_D1_B_OUT: STD_LOGIC;
    signal NOT_D1_C_OUT: STD_LOGIC;
    signal NOT_D1_D_OUT: STD_LOGIC;

    -- TODO: D2 layer

    signal QA_VALUE: STD_LOGIC;
    signal QB_VALUE: STD_LOGIC;
    signal QC_VALUE: STD_LOGIC;
    signal QD_VALUE: STD_LOGIC;
begin
    -- not sure
    NOT_RCLK <= not(RCLK);
    NOT_CCK <= not(CCK);

    CCLR <= not(NOT_CCLR);

    NOT_A <= not(A);
    NOT_B <= not(B);
    NOT_C <= not(C);
    NOT_D <= not(D);

    NOT_A <= A or NOT_LOAD;
    NOT_B <= B or NOT_LOAD;
    NOT_C <= C or NOT_LOAD;
    NOT_D <= D or NOT_LOAD;

    ENP_AND <= not(NOT_LOAD) and NOT_ENP and NOT_ENT;

    NOT_OR_1 <= not((D1_A_OUT and not(U)) or (U and NOT_D1_A_OUT));
    NOT_OR_2 <= not((D1_B_OUT and not(U)) or (U and NOT_D1_B_OUT));
    NOT_OR_3 <= not((D1_C_OUT and not(U)) or (U and NOT_D1_C_OUT));
    NOT_OR_4 <= not((D1_D_OUT and not(U)) or (U and NOT_D1_D_OUT));

    D1_A_IN <= not(NOT_A_OR or (D1_A_OUT and ENP_AND) or (not(ENP_AND) and NOT_LOAD and NOT_D1_A_OUT));
    D1_B_IN <= not(NOT_B_OR or (D1_B_OUT and ENP_AND and NOT_OR_1) or ((not(ENP_AND) or not(NOT_OR_1)) and NOT_LOAD and NOT_D1_B_OUT));
    D1_C_IN <= not(NOT_C_OR or (D1_C_OUT and ENP_AND and NOT_OR_1 and NOT_OR_2) or ((not(ENP_AND) or not(NOT_OR_1) or not(NOT_OR_2)) and NOT_LOAD and NOT_D1_C_OUT));
    D1_D_IN <= not(NOT_D_OR or (D1_D_OUT and ENP_AND and NOT_OR_1 and NOT_OR_2 and NOT_OR_3) or ((not(ENP_AND) or not(NOT_OR_1) or not(NOT_OR_2) or not(NOT_OR_3)) and NOT_LOAD and NOT_D1_D_OUT));

    NOT_D1_A_IN <= not(D1_A_IN);
    NOT_D1_B_IN <= not(D1_B_IN);
    NOT_D1_C_IN <= not(D1_C_IN);
    NOT_D1_D_IN <= not(D1_D_IN);

    D1_A: JK_TRIGGER port map (
        CLK => NOT_CCK,
        J => D1_A_IN,
        K => NOT_D1_A_IN,
        NOT_R => CCLR,
        Q => D1_A_OUT,
        NOT_Q => NOT_D1_A_OUT
    );

    D1_B: JK_TRIGGER port map (
        CLK => NOT_CCK,
        J => D1_B_IN,
        K => NOT_D1_B_IN,
        NOT_R => CCLR,
        Q => D1_B_OUT,
        NOT_Q => NOT_D1_B_OUT
    );

    D1_C: JK_TRIGGER port map (
        CLK => NOT_CCK,
        J => D1_C_IN,
        K => NOT_D1_C_IN,
        NOT_R => CCLR,
        Q => D1_C_OUT,
        NOT_Q => NOT_D1_C_OUT
    );

    D1_D: JK_TRIGGER port map (
        CLK => NOT_CCK,
        J => D1_D_IN,
        K => NOT_D1_D_IN,
        NOT_R => CCLR,
        Q => D1_D_OUT,
        NOT_Q => NOT_D1_D_OUT
    );


    QA <= 'Z' when (NOT_G = '1') else QA_VALUE;
    QB <= 'Z' when (NOT_G = '1') else QB_VALUE;
    QC <= 'Z' when (NOT_G = '1') else QC_VALUE;
    QD <= 'Z' when (NOT_G = '1') else QD_VALUE;

end Behavioral;