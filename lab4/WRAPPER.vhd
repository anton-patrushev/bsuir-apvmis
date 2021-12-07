library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 -- lal s
entity WRAPPER is
    port( 
        ledsmain: out std_logic_vector(3 downto 0);
        ledsboard: out std_logic_vector(3 downto 0);
        pushbuttons: in std_logic_vector(4 downto 0);
        dipswitch: in std_logic_vector(3 downto 0);
        sysclk_p: in std_logic;
        sysclk_n: in std_logic
        );
end WRAPPER;

architecture Behavioral of WRAPPER is
component DEVICE is
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
end component;

    component ibufds
        port(
            i, ib : in std_logic; 
            o : out std_logic
            );
    end component;
    
    component divider is
            port( 
                CLK_IN : in STD_LOGIC;
                CLK_OUT : out STD_LOGIC
                );
    end component;
    
    
    signal CLK_AFTER_DIV: std_logic;
    signal CCK_NO_DIV : std_logic;

    signal CPD_CPU_board, TCD_board, TCU_board: std_logic := '0';
    
    signal QA: std_logic;
    signal QB: std_logic;
    signal QC: std_logic;
    signal QD: std_logic;
    signal NOT_RCO: std_logic;

    signal A: std_logic;
    signal B: std_logic;
    signal C: std_logic;
    signal D: std_logic;
    
    signal DATA_board: std_logic_vector (3 downto 0);
    
    signal MR_board: std_logic := '0';
    signal PL_board: std_logic := '0';
    signal CCK: std_logic := '0';
    signal RCK: std_logic := '0';

    signal NOT_G: std_logic := '0';

    signal R: std_logic;
    signal U: std_logic;

    signal LOAD: std_logic;
    signal NOT_LOAD: std_logic;

    signal CCLR: std_logic;
    signal NOT_CCLR: std_logic;

    signal ENT: std_logic;
    signal NOT_ENT: std_logic;

    signal ENP: std_logic := '1';
    signal NOT_ENP: std_logic;
    
begin
    MR_board <= pushbuttons(0);
    R <= pushbuttons(1);
    LOAD <= pushbuttons(2);
    CCLR <= pushbuttons(3);
    ENT <= pushbuttons(4);
    
    A <= dipswitch(0);
    B <= dipswitch(1);
    C <= dipswitch(2);
    D <= dipswitch(3);
    
    buffds: ibufds port map (
       i => sysclk_p, 
       ib => sysclk_n, 
       o => CCK_NO_DIV
    );
   
    div: divider port map (
       CLK_IN => CCK_NO_DIV, 
       CLK_OUT => CLK_AFTER_DIV
    );
    
    RCK <= not (CLK_AFTER_DIV and CPD_CPU_board);
    CCK <= not (CLK_AFTER_DIV and not CPD_CPU_board);

    NOT_CCLR <= not (CCLR);
    NOT_LOAD <= not (LOAD);
    NOT_ENP <= not (ENP);
    NOT_ENT <= not (ENT);
    
    counter: DEVICE port map(
    NOT_G => NOT_G, -- contanst 0 for now
    R => R,
    RCK => RCK,
    NOT_CCLR => NOT_CCLR,
    U => U,
    NOT_LOAD => NOT_LOAD,
    NOT_ENP => NOT_ENP,
    NOT_ENT => NOT_ENT,
    CCK => CCK,
    A => A,
    B => B,
    C => C,
    D => D,

    QA => QA,
    QB => QB,
    QC => QC,
    QD => QD,

    NOT_RCO => NOT_RCO
    );
    
    ledsmain(0) <= QA;
    ledsmain(1) <= QB;
    ledsmain(2) <= QC;
    ledsmain(3) <= QD;

    ledsboard(0) <= NOT_RCO;

end Behavioral;
