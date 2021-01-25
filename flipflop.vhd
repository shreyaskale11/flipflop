----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:31:00 01/25/2021 
-- Design Name: 
-- Module Name:    flipflop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity flipflop is
  Port ( clock:		in std_logic;
	J, K:		in std_logic;
	reset:		in std_logic;
	Q, Qbar:	out std_logic;
	J1, K1:		in std_logic;
	reset1:		in std_logic;
	Q1, Qbar1:	out std_logic);
end flipflop;

architecture Behavioral of flipflop is
	--signal clk : STD_LOGIC;
		signal state: std_logic;
		signal input: std_logic_vector(1 downto 0);
		signal state1: std_logic;
		signal input1: std_logic_vector(1 downto 0);
begin
		-- combine inputs into vector
    input <= J & K;		
	 input1 <= J1 & K1;
    p: process(clock, reset) is
    begin
	
	if (reset='1') then
	    state <= '0';
	elsif (rising_edge(clock)) then

            -- compare to the truth table
	    case (input) is
		when "11" =>
		    state <= not state;
		when "10" =>
		    state <= '1';
		when "01" =>
		    state <= '0';
		when others =>
		    null;
		end case;
	end if;

    end process;
	
	input1 <= J1 & K1;
	p1: process(clock, reset1) is
    begin
	
	if (reset1='1') then
	    state1 <= '0';
	elsif (rising_edge(clock)) then

            -- compare to the truth table
	    case (input1) is
		when "11" =>
		    state1 <= not state1;
		when "10" =>
		    state1 <= '1';
		when "01" =>
		    state1 <= '0';
		when others =>
		    null;
		end case;
	end if;

    end process;
    -- concurrent statements
    Q <= state;
    Qbar <= not state;
	 Q1 <= state1;
    Qbar1 <= not state1;
end Behavioral;

