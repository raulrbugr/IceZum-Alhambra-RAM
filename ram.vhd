library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity RAM is
	Port(
		clk : in std_logic;
		WR : in std_logic;
		Address : in std_logic_vector(3 downto 0);
		Data_in : in std_logic_vector(7 downto 0);	
		Data_out : out std_logic_vector(7 downto 0)	
	);
end RAM;

architecture behavioral of RAM is

constant bits_dir : integer := 4;
constant bits_data : integer := 8;

type ram_type is array (15 downto 0) of std_logic_vector (7 downto 0);
signal myRam : ram_type ;


begin
	process(clk)
	begin
		if(clk'event and clk ='1') then
			if(WR='1') then
				myRam(conv_integer(address))<= data_in;
			else
				data_out<=myRam(conv_integer(address));
			end if;
		end if;
	end process;

end behavioral;