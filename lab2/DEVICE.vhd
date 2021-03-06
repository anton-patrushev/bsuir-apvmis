library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEVICE is
    Port(
        NOT_G: in STD_LOGIC;
        R: in STD_LOGIC;
        RCK: in STD_LOGIC;
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

    signal NOT_RCK: STD_LOGIC;
    signal NOT_CCK: STD_LOGIC;
    
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

    signal NOT_D2_A_OUT: STD_LOGIC;
    signal NOT_D2_B_OUT: STD_LOGIC;
    signal NOT_D2_C_OUT: STD_LOGIC;
    signal NOT_D2_D_OUT: STD_LOGIC;

    signal QA_VALUE: STD_LOGIC;
    signal QB_VALUE: STD_LOGIC;
    signal QC_VALUE: STD_LOGIC;
    signal QD_VALUE: STD_LOGIC;
begin
    NOT_RCK <= not(RCK);
    NOT_CCK <= not(CCK);

    NOT_A_OR <= not(A or NOT_LOAD);
    NOT_B_OR <= not(B or NOT_LOAD);
    NOT_C_OR <= not(C or NOT_LOAD);
    NOT_D_OR <= not(D or NOT_LOAD);

    ENP_AND <= NOT_LOAD and not(NOT_ENP) and not(NOT_ENT);

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
        CLK => CCK,
        J => D1_A_IN,
        K => NOT_D1_A_IN,
        NOT_R => NOT_CCLR,
        Q => D1_A_OUT,
        NOT_Q => NOT_D1_A_OUT
    );

    D1_B: JK_TRIGGER port map (
        CLK => CCK,
        J => D1_B_IN,
        K => NOT_D1_B_IN,
        NOT_R => NOT_CCLR,
        Q => D1_B_OUT,
        NOT_Q => NOT_D1_B_OUT
    );

    D1_C: JK_TRIGGER port map (
        CLK => CCK,
        J => D1_C_IN,
        K => NOT_D1_C_IN,
        NOT_R => NOT_CCLR,
        Q => D1_C_OUT,
        NOT_Q => NOT_D1_C_OUT
    );

    D1_D: JK_TRIGGER port map (
        CLK => CCK,
        J => D1_D_IN,
        K => NOT_D1_D_IN,
        NOT_R => NOT_CCLR,
        Q => D1_D_OUT,
        NOT_Q => NOT_D1_D_OUT
    );

    QA_VALUE <= not((R and NOT_D2_A_OUT) or (not(R) and NOT_D1_A_OUT));
    QB_VALUE <= not((R and NOT_D2_B_OUT) or (not(R) and NOT_D1_B_OUT));
    QC_VALUE <= not((R and NOT_D2_C_OUT) or (not(R) and NOT_D1_C_OUT));
    QD_VALUE <= not((R and NOT_D2_D_OUT) or (not(R) and NOT_D1_D_OUT));

    D2_A: JK_TRIGGER port map (
        CLK => RCK,
        J => D1_A_OUT,
        K => NOT_D1_A_OUT,
        NOT_Q => NOT_D2_A_OUT
    );

    D2_B: JK_TRIGGER port map (
        CLK => RCK,
        J => D1_B_OUT,
        K => NOT_D1_B_OUT,
        NOT_Q => NOT_D2_B_OUT
    );

    D2_C: JK_TRIGGER port map (
        CLK => RCK,
        J => D1_C_OUT,
        K => NOT_D1_C_OUT,
        NOT_Q => NOT_D2_C_OUT
    );

    D2_D: JK_TRIGGER port map (
        CLK => RCK,
        J => D1_D_OUT,
        K => NOT_D1_D_OUT,
        NOT_Q => NOT_D2_D_OUT
    );

    QA <= 'Z' when (NOT_G = '1') else QA_VALUE;
    QB <= 'Z' when (NOT_G = '1') else QB_VALUE;
    QC <= 'Z' when (NOT_G = '1') else QC_VALUE;
    QD <= 'Z' when (NOT_G = '1') else QD_VALUE;

    NOT_RCO <= not(not(NOT_ENT) and NOT_OR_1 and NOT_OR_2 and NOT_OR_3 and NOT_OR_4);

end Behavioral;