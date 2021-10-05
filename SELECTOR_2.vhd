----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2021 10:29:11 AM
-- Design Name: 
-- Module Name: ADD_GATE - Behavioral
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
-- USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SELECTOR is
    Port (
        OE: in STD_LOGIC;
        D : in STD_LOGIC_VECTOR(0 to 7);
        C, B, A : in STD_LOGIC;
        Y, W : out STD_LOGIC);
end SELECTOR;

architecture Behavioral of SELECTOR is
    signal result: std_logic := '0';
--    signal selection: std_logic_vector(2 downto 0);
begin

    process(OE, D, C, B, A) begin

--        case (to_integer(unsigned(selection))) is
--            when 0 => result <= D(0);
--            when 1 => result <= D(1);
--            when 2 => result <= D(2);
--            when 3 => result <= D(3);
--            when 4 => result <= D(4);
--            when 5 => result <= D(5);
--            when 6 => result <= D(6);
--            when 7 => result <= D(7);
--            when others => result <= 'X';
            
--        end case;

        if((not(A) AND not(B) AND not(C)) = '1') then
            -- result <= D(0);
            Y <= D(0); W <= not(D(0));
        elsif((A AND not(B) AND not(C)) = '1') then
            -- result <= D(1); 
            Y <= D(1); W <= not(D(1));
        elsif((not(A) AND B AND not(C)) = '1') then
            -- result <= D(2);
            Y <= D(2); W <= not(D(2));
        elsif((A AND B AND not(C)) = '1') then
            -- result <= D(3);
            Y <= D(3); W <= not(D(3));
        elsif((not(A) AND not(B) AND C) = '1') then
            -- result <= D(4);
            Y <= D(4); W <= not(D(4));
        elsif((A AND not(B) AND C) = '1') then
            -- result <= D(5);
            Y <= D(5); W <= not(D(5));
        elsif((not(A) AND B AND C) = '1') then
            -- result <= D(6);
            Y <= D(6); W <= not(D(6));
        elsif((A AND B AND C) = '1') then
            -- result <= D(7);
            Y <= D(7); W <= not(D(7));
        else
             -- just in case
             Y <= 'X'; W <= 'X';
        end if;

        if(OE = '1') then
            Y <= 'X'; W <= 'X';
        end if;
                                       
    end process;   

end Behavioral;
