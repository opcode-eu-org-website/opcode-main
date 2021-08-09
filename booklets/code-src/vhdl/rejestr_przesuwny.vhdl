library ieee;
use ieee.std_logic_1164.all;

entity rejestr_przesuwny is
	generic (
		N: natural := 1
	);
	port (
		CLK,RST,ENABLE: in std_logic;
		D: in std_logic;
		P_OUT: buffer std_logic_vector (N-1 downto 0)
	);
end;

architecture logic of rejestr_przesuwny is
	begin
		process (CLK, RST)
		begin
			if (RST='0') then
				for i in 0 to N-1 loop
					P_OUT(i) <= '0';
				end loop;
				-- sprytniejszym zapisem tego jest:
				--  P_OUT <= (others => '0');
				-- korzystamy tu z tzw agregacji umożliwiającej wygodne nadawanie wartości wektorom np.:
				--  wektor <= (1|3 => '1', 2|4 =>'0');
				--  wektor <= (1 => '1', 3 => '1', 2|4 =>'0');
				--  wektor <= ('1', '0', '1', '0');
				--  wektor <= "1010"
				-- są całkowicie równoważnymi zapisami, jednak pierwszy z nich jest zdecydowanie
				-- wygodniejszy dla długich wektorów
				-- ponadto dzięki agregacji możemy łatwo wpisać wektor do zestawu sygnałów poprzez:
				--  (skalar, vektor_2, skalar) <= wektor_4
			elsif (CLK='0' and CLK'event) then
				if (ENABLE='1') then
					P_OUT <= D & P_OUT(N-1 downto 1);
					-- tak jak do pojedynczych bitów możemy odwołać się do zakresów
					-- o kolejności bitów z zakresu decyduje użycie to / downto
				end if;
			end if;
		end process;
end;

architecture modularna of rejestr_przesuwny is
	begin
		-- używamy generate for aby wykorzystać odpowiednia liczbę 1 bitowych multiplekserów
		G0: for i in 0 to N-1 generate
			-- możemy także warunkować fragmenty tego co umieszczamy w generate
			G01: if i=N-1 generate
				mux: entity work.przerzutnik(logic)
				-- powyższy zapis oszczędza podawania deklaracji komponentu
				-- oraz ewentualnego podawania konfiguracji ...
					port map (D=>D,CLK=>CLK,RST=>RST,ENABLE=>ENABLE,Q=>P_OUT(i));
			end generate;
			G02: if i<N-1 generate
				mux: entity work.przerzutnik(logic)
					port map (D=>P_OUT(i+1),CLK=>CLK,RST=>RST,ENABLE=>ENABLE,Q=>P_OUT(i));
			end generate;
		end generate;
end;
