LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
use ieee.numeric_std.all;

ENTITY ram_tb  IS 

END ; 

architecture ram_tb_arch of ram_tb is
	
	--Entradas
	signal clk : std_logic := '0';
	signal reset : std_logic :='1';
	signal WR :  std_logic :='1';
	signal Address : std_logic_vector(3 downto 0);
	signal Data_in : std_logic_vector(7 downto 0);
	--Salidas
	signal  Data_out : std_logic_vector(7 downto 0);	

	component ram is
		port(
			clk : in std_logic;
			WR : in std_logic;
			Address : in std_logic_vector(3 downto 0);
			Data_in : in std_logic_vector(7 downto 0);	
			Data_out : out std_logic_vector(7 downto 0)	
		);
	end component;

	begin
		DUT: ram
		
		port map(
			clk=>clk,
			WR=>WR ,
			Address=>Address,
			Data_in=>Data_in,
			Data_out=>Data_out
		);
		--Reloj
		clk <= not clk after 10 ns;


		--Test bench

		process
		begin
			
			
			wait for 40 ns;
			reset <= '0';
                        wait for 100 ns;
			address <= "0000";
			Data_in <= "00001111";
			WR<='1';


			wait for 100 ns;
			address <= "0001";
			Data_in <= "00001111";
			WR<='1';
			
			wait for 100 ns;
			address <= "0001";
			
			WR<='0';

			wait;
		end process;
end;
