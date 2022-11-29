library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity seq_det_tb is
end seq_det_tb;

architecture TB_ARCHITECTURE of seq_det_tb is
	-- Component declaration of the tested unit
	component seq_det
	port(
		reset : in STD_LOGIC;
		clk : in STD_LOGIC;
		seq_in : in STD_LOGIC;
		seq_out : out STD_LOGIC;
		seq_num : buffer INTEGER range 0 to 9 );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal reset : STD_LOGIC:='0';
	signal clk : STD_LOGIC:='0';
	signal seq_in : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal seq_out : STD_LOGIC;
	signal seq_num : INTEGER range 0 to 9;

	-- Add your code here ...
	signal cnt1: integer;
	signal cnt2: integer;
	signal cnt3: integer;
begin

	-- Unit Under Test port map
	UUT : seq_det
		port map (
			reset => reset,
			clk => clk,
			seq_in => seq_in,
			seq_out => seq_out,
			seq_num => seq_num
		);

	-- Add your stimulus here ... 
reset <= '1' after 110ns;
clk <= not clk after 50ns;

process(reset, clk)
begin
	if reset='0' then
		cnt1 <= 0;
		cnt2 <= 0;
		cnt3 <= 0;
	elsif clk='1' and clk'event then 
		if cnt1=0 then 
			if cnt2=4 then
				if cnt3=9 then 
					cnt3 <= 0;
					cnt1 <= cnt1+1;
				else
					cnt3 <= cnt3+1;
				end if;
				cnt2 <= 0;
			else
				cnt2 <= cnt2+1;
			end if;	
		elsif cnt1=1 then 
			if cnt2=5 then 
				if cnt3=9 then 
					cnt3 <= 0;
					cnt1 <= cnt1+1;
				else
					cnt3 <= cnt3+1;
				end if;
				cnt2 <= 0;
			else
				cnt2 <= cnt2+1;
			end if;
		elsif cnt1=2 then 
			if cnt2=6 then 
				if cnt3=9 then 
					cnt3 <= 0;
					cnt1 <= cnt1+1;
				else
					cnt3 <= cnt3+1;
				end if;
				cnt2 <= 0;
			else
				cnt2 <= cnt2+1;
			end if;
		elsif cnt1=3 then 
			if cnt2=7 then 
				if cnt3=9 then 
					cnt3 <= 0;
					cnt1 <= cnt1+1;
				else
					cnt3 <= cnt3+1;
				end if;
				cnt2 <= 0;
			else
				cnt2 <= cnt2+1;
			end if;	
		elsif cnt1=4 then 
			if cnt2=8 then 
				if cnt3=9 then 
					cnt3 <= 0;
					cnt1 <= cnt1+1;
				else
					cnt3 <= cnt3+1;
				end if;
				cnt2 <= 0;
			else
				cnt2 <= cnt2+1;
			end if;	
		elsif cnt1=5 then 
			if cnt2=9 then 
				if cnt3=9 then 
					cnt3 <= 0;
					cnt1 <= cnt1+1;
				else
					cnt3 <= cnt3+1;
				end if;
				cnt2 <= 0;
			else
				cnt2 <= cnt2+1;
			end if;	
		elsif cnt1=6 then 
			if cnt2=15 then 
				if cnt3=9 then 
					cnt3 <= 0;
					cnt1 <= cnt1+1;
				else
					cnt3 <= cnt3+1;
				end if;
				cnt2 <= 0;
			else
				cnt2 <= cnt2+1;
			end if;	
		end if ;
	end if ;
end process;

process(reset, clk)
begin 
	if reset='0' then 
		seq_in <= '0';
	elsif clk='1' and clk'event then 
		if cnt2=0 then 
			seq_in <= '1';
		elsif cnt2=1 then 
			seq_in <= '1';
		elsif cnt2=2 then 
			seq_in <= '0';
		elsif cnt2=3 then 
			seq_in <= '1';
		elsif cnt2=4 then
			seq_in <= '1';
		elsif cnt2=5 then 
			seq_in <= '0';
		elsif cnt2=6 then 
			seq_in <= '1';
		elsif cnt2=7 then 
			seq_in <= '1';
		elsif cnt2=8 then 
			seq_in <= '0';
		elsif cnt2=9 then 
			seq_in <= '1';
		else
			seq_in <= '1';
		end if;
	end if;
end process;
					
			
				
				
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_seq_det of seq_det_tb is
	for TB_ARCHITECTURE
		for UUT : seq_det
			use entity work.seq_det(behave);
		end for;
	end for;
end TESTBENCH_FOR_seq_det;

