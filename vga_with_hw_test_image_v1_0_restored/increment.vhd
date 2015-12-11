library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;


entity increment is
    port(
		  button : in std_logic;
		  button2 : in std_logic;
		  button3 : in std_logic;
        from_ASMD_State_reg : in std_logic_vector(7 downto 0);
        reset, clk : in std_logic;
        to_mux : out std_logic_vector(7 downto 0)
    );
end increment;

architecture Behavioral of increment is
  signal r_reg : unsigned(7 downto 0);
  signal r_inc : unsigned(7 downto 0);
begin

  process (clk, reset,r_inc,button,button2,button3)
  begin
  
  if button = '0' and r_inc < 63 then 
  r_inc <= r_inc + 1;
  
  elsif button2 = '0' and r_inc < 63 then 
  r_inc <= r_inc + 8;
  
  elsif button3 = '0' and r_inc < 63 then
  
  r_inc <= r_inc - 8;
  
  else
  r_inc <= r_inc - r_inc;
  end if;
  
    if(reset = '1') then
        r_reg <= (others => '0');
    elsif(clk'event and clk = '1') then
        r_reg <= r_inc;
    end if;

r_reg <= r_inc;
  end process;

  to_mux <= std_logic_vector(r_reg);

end Behavioral;