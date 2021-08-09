library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity tester is
end;

architecture logic of tester is
	signal CLK,RST,a,b,c: std_logic := '1';
	-- uwaga takie przypisanie wartości początkowej nie podlega syntezie (!)
	--       podobnie nie da się syntezować opoźnień czasowych,
	--       ale to jest testbanch wiec nam to nie przeszkadza
	signal tryb: std_logic_vector (1 downto 0);
	signal wej1, wej2: std_logic_vector (2 downto 0);
	-- w miejscu tym warto wspomnieć o możliwości definiowania aliasów np:
	--  alias pocz_wej1 : std_logic_vector (1 downto 0) is wej1 (1 downto 0);
	-- spowoduje że nazwa pocz_wej1 będzie się odnosiła do dwuelementowego wektora
	-- tożsamego z pierwszymi dwoma elementami wej1
	
	begin
		-- zegar
		process
			begin
			wait for 2 ns;
			CLK <= not CLK;
		end process;
		
		-- zatrzymanie symulacji
		process
			begin
			wait for 100 ns;
			report "koniec symulacji";
			finish;
			-- starszym rozwiązaniem na takie przerwanie jest:
			--   assert FALSE report "koniec symulacji" severity FAILURE;
			-- działa w starszych wersjach VHDL,
			-- jednak powoduje on wypisywanie informacji o zakończeniu z błędem
		end process;
		
		RST <= '0', '1' after 0.5 ns;
		
		a <= '0' after  5 ns, '1' after  25 ns;
		b <= '0' after  9 ns, '1' after  21 ns;
		c <= '0' after 13 ns, '1' after  17 ns;
		
		tryb <= "00", "10" after 11 ns, "01" after 22 ns;
		
		mux1: entity work.mux_3to1(z_N_bitowego) port map(MODE=>tryb, a=>a, b=>b, c=>c);
		mux2: entity work.mux_3to1(wybierany_case) port map(MODE=>tryb, a=>a, b=>b, c=>c);
		mux3: entity work.mux_3to1(proces_case) port map(MODE=>tryb, a=>a, b=>b, c=>c);
		mux4: entity work.mux_3to1(wybierany_if_else) port map(MODE=>tryb, a=>a, b=>b, c=>c);
		mux5: entity work.mux_3to1(proces_if_else) port map(MODE=>tryb, a=>a, b=>b, c=>c);
		mux6: configuration work.z_N_bitowego_conf port map(MODE=>tryb, a=>a, b=>b, c=>c);
		
		wej1 <= a&b&c;
		wej2 <= O"5";
		-- zapis 3 bitowej wartości w notacji oktalnej ...
		-- 8 bitowy wektor w notacji szesnastkowej możemy wypełnić poprzez X"fa"
		--
		-- z kolei 2#0# oznacza ze pomiędzy # jest zapisana liczba stałopozycyjna (integer)
		-- w notacji o podstawie 2 (w systemie dwójkowym)
		
		nor1: entity work.nor3(logic) port map(wej=>wej1);
		nor2: entity work.nor3(proces_while) port map(wej=>wej1);
		nor3: entity work.nor3(proces_loop) port map(wej=>wej1);
		
		
		przes1: entity work.rejestr_przesuwny(logic)
			generic map(N=>4)
			port map(D=>a,CLK=>CLK,RST=>RST,ENABLE=>'1');
		-- należy wspomnieć że zarówno w generic jak i port map możemy  używać pozycyjnego jak i
		-- nazewniczego sposobu podawania przypisań jednak jeżeli jest ich więcej niż jedno to
		-- sposób poprzez nazwa=>... ("nazewniczy") jest czytelniejszy i wygodniejszy ...
		przes2: entity work.rejestr_przesuwny(modularna)
			generic map(4)
			port map(D=>a,CLK=>CLK,RST=>RST,ENABLE=>'1');
	-- na koniec warto wspomnieć o tym iż do tworzenia rozbudowanych testbench'ow można
	-- wykorzystać mechanizmy vhdl do obsługi pliku, dzięki czemu pobudzenia testbencha mogą
	-- być umieszczane w zewnętrznym pliku (np. generowanym przez jakieś inne oprogramowani)
	-- podobnie ewentualne wyniki zostaną zapisane do plików co umożliwi ich analizę
	-- zewnętrznymi narzędziami
end;
