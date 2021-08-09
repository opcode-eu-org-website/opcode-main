library ieee;
use ieee.std_logic_1164.all;

entity automat is
	port (
		wejscia: in std_logic_vector (1 downto 0);
		clk, reset: in std_logic;
		wyjscia: out std_logic_vector (1 downto 0)
	);
end;

architecture logic of automat is
	type STANY is (
		S0,
		S1,
		S2
	);
	
	signal STAN_OBECNY, STAN_NASTEPNY: STANY := S0;
	
begin
	process (clk, reset)
	begin
		if (reset='1') then
			STAN_OBECNY <= S0;
		elsif (clk='1' and clk'event) then
			STAN_OBECNY <= STAN_NASTEPNY;
		end if;
	end process;
		
	process (STAN_OBECNY, wejscia)
	begin
		case STAN_OBECNY is
			when S0 =>
				wyjscia <= "01";
				-- wyjścia zależą tylko od stanu, więc automat Moora
				
				if (wejscia = "01") then
					STAN_NASTEPNY <= S1;
				else
					STAN_NASTEPNY <= S2;
				end if;
			when S1 =>
				wyjscia <= "11";
				
				if (wejscia = "01" or wejscia = "10") then
					STAN_NASTEPNY <= S2;
				elsif (wejscia = "11") then
					STAN_NASTEPNY <= S1;
				else
					STAN_NASTEPNY <= S0;
				end if;
			when S2 =>
				wyjscia <= "00";
				
				if (wejscia(0) = '0') then
					STAN_NASTEPNY <= S1;
				else
					STAN_NASTEPNY <= S2;
				end if;
		end case;
	end process;
end;
