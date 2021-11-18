----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2021 10:30:29 AM
-- Design Name: 
-- Module Name: LOGICAL_SELECTOR_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LOGICAL_SELECTOR_TB is
--  Port ( );
end LOGICAL_SELECTOR_TB;


architecture Behavioral of LOGICAL_SELECTOR_TB is
    
    SIGNAL D: STD_LOGIC_VECTOR (0 to 7):="10101010";
    SIGNAL OE, C, B, A, Y, W: STD_LOGIC;

begin

    uut: entity work.LOGICAL_SELECTOR port map(OE, D, C, B, A, Y, W);
    
    
    simulating: process
    begin
        
        -- direction signal = 0 and OE=1
        C <= '0';
        B <= '0';
        A <= '0';

        OE <= '1';
        wait for 10 ns;
        
        -- direction signal = 0
        C <= '0';
        B <= '0';
        A <= '0';

        OE <= '0';
        wait for 10 ns;
        
        -- direction signal = 1
        C <= '0';
        B <= '0';
        A <= '1';

        OE <= '0';
        wait for 10 ns;
        
        -- direction signal = 2
        C <= '0';
        B <= '1';
        A <= '0';

        OE <= '0';
        wait for 10 ns;
        
        -- direction signal = 3
        C <= '0';
        B <= '1';
        A <= '1';

        OE <= '0';
        wait for 10 ns;
        
        -- direction signal = 4
        C <= '1';
        B <= '0';
        A <= '0';

        OE <= '0';
        wait for 10 ns;

        -- direction signal = 5
        C <= '1';
        B <= '0';
        A <= '1';

        OE <= '0';
        wait for 10 ns;
        
        -- direction signal = 6
        C <= '1';
        B <= '1';
        A <= '0';

        OE <= '0';
        wait for 10 ns;
        
        -- direction signal = 7
        C <= '1';
        B <= '1';
        A <= '1';

        OE <= '0';
        wait for 10 ns;
        
        OE <= '1';
        
        wait;
    end process;
end Behavioral;

