library ieee;
use ieee.std_logic_1164.all;

entity seq_det is
	port(
		reset: in std_logic;
		clk: in std_logic;
		seq_in: in std_logic;
		
		seq_out: out std_logic;
		seq_num: buffer integer range 0 to 9);
end seq_det;

architecture behave of seq_det is 

signal reg: std_logic_vector(0 to 4);
signal new_seq_cnt:integer range 0 to 4;
signal new_seq_ind: std_logic; 
signal seq_delay_1: std_logic;
signal seq_delay_2: std_logic;
signal seq_delay_3: std_logic;
signal seq_delay_4: std_logic;
signal seq_delay_5: std_logic;

begin
	
	process(reset, clk)
	begin 
		if reset='0' then 
			reg <= "00000";
		elsif clk='1' and clk'event then
			reg(4) <= seq_in;
			reg(0 to 3) <= reg(1 to 4);
		end if;
	end process;
	
	process(reset, clk)
	begin 
		if reset='0' then
			seq_num <= 0;
			new_seq_ind <= '1';
			new_seq_cnt <= 0;
		elsif clk='1' and clk'event then 
			if new_seq_ind='1' then  
				if reg="11011"then
					new_seq_ind <= '0';
					new_seq_cnt <= 0;
					if seq_num=9 then 
						seq_num <= 0;
					else
						seq_num <= seq_num+1;
					end if;
				end if;
			else
				if new_seq_cnt=3 then 
					new_seq_ind <= '1';
				else
					new_seq_cnt <= new_seq_cnt+1;
				end if;
			end if;
		end if;
	end process;
	
	process(reset, clk)
	begin
		if reset='0' then 
			seq_out <= '0';
			seq_delay_1 <= '0';
			seq_delay_2 <= '0';
			seq_delay_3 <= '0';
			seq_delay_4 <= '0';
			seq_delay_5 <= '0';
		elsif clk='1' and clk'event then
			seq_delay_1 <= seq_in;
			seq_delay_2 <= seq_delay_1;
			seq_delay_3 <= seq_delay_2;
			seq_delay_4 <= seq_delay_3;
			seq_delay_5 <= seq_delay_4;
			seq_out <= seq_delay_5;
		end if;
	end process;
			
end behave;	