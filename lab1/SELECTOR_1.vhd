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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADD_GATE is
    Port (
        OE: in STD_LOGIC;
        D : in STD_LOGIC_VECTOR(0 to 7);
        C, B, A : in STD_LOGIC;
        Y, W : out STD_LOGIC);
end ADD_GATE;

architecture Behavioral of ADD_GATE is
    SIGNAL tempY: STD_LOGIC;

begin

    tempY <= ((D(0) AND not(A) AND not(B) AND not(C))
        OR
    (D(1) AND A AND not(B) AND not(C))
        OR
    (D(2) AND not(A) AND B AND not(C))
        OR
    (D(3) AND A AND B AND not(C))
        OR
    (D(4) AND not(A) AND not(B) AND C)
        OR
    (D(5) AND A AND not(B) AND C)
        OR
    (D(6) AND not(A) AND B AND C)
        OR
    (D(7) AND A AND B AND C));
    
    Y <= 'Z' when (OE) else tempY;

    W <= 'Z' when (OE) else not(tempY);

end Behavioral;
