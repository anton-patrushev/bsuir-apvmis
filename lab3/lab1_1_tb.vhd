library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.ALL;
use ieee.std_logic_textio.ALL;

entity lab1_1_tb is
end lab1_1_tb;

architecture lab1_1_tb_arch of lab1_1_tb is
  SIGNAL OE, C, B, A: STD_LOGIC;
  SIGNAL D: STD_LOGIC_VECTOR(0 to 7);
  SIGNAL Y, W: STD_LOGIC;
  SIGNAL EXPECTED_Y, EXPECTED_W: STD_LOGIC;

begin

test_entity : entity work.LOGICAL_SELECTOR port map(OE, D, C, B, A, Y, W);
  
    tb: process
        file txt_file : text is in "lab1.txt";
        variable current_line: line;
        -- 12 inputs + 2 outputs (expected)
        variable file_value: std_logic_vector(13 downto 0);
        variable I : integer range 0 to 4095; -- 2^12 - 1 = 4095
    begin
        for I in 0 to 4095 loop
            readline (txt_file, current_line);
            read (current_line, file_value);
            
            OE <= file_value(11);
            D <= file_value(10 downto 3);
            C <= file_value(2);
            B <= file_value(1);
            A <= file_value(0);
            EXPECTED_Y <= file_value(13);
            EXPECTED_W <= file_value(12);
            
            wait for 0.01 ns;
            
            if now = 0.01*4096 ns then         
                wait;
            end if;
            
        end loop; 
              
    end process tb;
    
    test: process
    begin
       if (not(Y = EXPECTED_Y) or not(W = EXPECTED_W))
       then    
           report "ERROR" severity failure;
       end if;
       if now = 0.01*4095 ns then
            report "finish test successfully"; 
            wait;
       end if;
       wait for 0.01 ns;
    end process;

end lab1_1_tb_arch;
