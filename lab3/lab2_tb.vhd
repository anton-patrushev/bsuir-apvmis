library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.ALL;
use ieee.std_logic_textio.ALL;

entity lab2_tb is
end lab2_tb;

architecture lab2_tb_arch of lab2_tb is
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

    SIGNAL EXPECTED_QA: STD_LOGIC;
    SIGNAL EXPECTED_QB: STD_LOGIC;
    SIGNAL EXPECTED_QC: STD_LOGIC;
    SIGNAL EXPECTED_QD: STD_LOGIC;

    SIGNAL EXPECTED_NOT_RCO: STD_LOGIC;
begin

test_entity : entity work.DEVICE port map(
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
  
    tb: process
        file txt_file : text is in "Z:/Documents/bsuir/term-7/apvmis/src/lab3/lab3.srcs/sources_1/imports/Desktop/lab2.txt";
        variable current_line: line;
        -- 13 inputs + 5 outputs (expected)
        variable file_value: std_logic_vector(17 downto 0);
        variable I : integer range 0 to 18;
    begin
        for I in 0 to 24 loop
            readline (txt_file, current_line);
            read (current_line, file_value);
            
            NOT_G <= file_value(12);
            R <= file_value(11);
            RCK <= file_value(10);
            NOT_CCLR <= file_value(9);
            U <= file_value(8);
            NOT_LOAD <= file_value(7);
            NOT_ENP <= file_value(6);
            NOT_ENT <= file_value(5);
            CCK <= file_value(4);
            A <= file_value(3);
            B <= file_value(2);
            C <= file_value(1);
            D <= file_value(0);

            EXPECTED_QA <= file_value(17);
            EXPECTED_QB <= file_value(16);
            EXPECTED_QC <= file_value(15);
            EXPECTED_QD <= file_value(14);
            
            EXPECTED_NOT_RCO <= file_value(13);
            
            report "STEP";
            
            wait for 0.01 ns;
            
            if now = 0.01*19 ns then         
                wait;
            end if;
            
        end loop; 
              
    end process tb;
    
    test: process
    begin
       if (not(QA = EXPECTED_QA))
       then    
           report "ERROR - QA" severity failure;
       end if;
       
       if (not(QB = EXPECTED_QB))
       then    
           report "ERROR - QB" severity failure;
       end if;

       if (not(QD = EXPECTED_QD))
       then    
           report "ERROR - QC" severity failure;
       end if;

       if (not(QD = EXPECTED_QD))
       then    
           report "ERROR - QD" severity failure;
       end if;
       if now = 0.01*18 ns then
            report "finish test successfully"; 
            wait;
       end if;
       wait for 0.01 ns;
    end process;

end lab2_tb_arch;
