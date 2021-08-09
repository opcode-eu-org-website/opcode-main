library ieee;
use ieee.std_logic_1164.all;

-- używamy naszego pakietu
use work.moj_pakiet.all;


-- deklarujemy multiplexer 3 wejściowy
entity mux_3to1 is
	port (
		-- tryb jest wartością 2 bitowa
		MODE: in std_logic_vector (1 downto 0);
		-- mamy 3 wejścia
		a,b,c: in std_logic;
		-- i jedno wyjście
		DATA_OUT: out std_logic
	);
end;


-- definiujemy architekturę naszego multipleksera
architecture z_N_bitowego_arch of mux_3to1 is
	-- gdy chcemy wykorzystać jakiś element (w tym wypadku multiplexer
	-- opisany w multiplexer.vhdl) musimy przytoczyć
	-- (lekko zmodyfikowana) treść jego entity w postaci opisu komponentu:
	component mux is
		generic (
			M: natural := 4
			-- nadpisujemy domyślna ilość bitów
		);
		port (
			MODE: in integer range 0 to M-1;
			DATA_IN: in std_logic_vector (M-1 downto 0);
			DATA_OUT: out std_logic
		);
	end component;
	
	-- deklarujemy wewnętrzne pomocnicze sygnały
	signal tryb: integer range 0 to 2;
	signal wejscie: std_logic_vector (3 downto 0);
	
	begin
		wejscie <= '-' & c & b & a;
		-- musimy podać tez najwyższy bit (aby jego bitowość była 2^N)
		-- jako ze nie jest on nam potrzebny a korzystamy z std_logic to podajemy "don't cary"
		
		-- przy pomocy funkcji to_int z moj_pakiet konwertujemy wartość binarna na integer
		tryb<=to_int(MODE);
		
		-- mapujemy odpowiednie wejścia i wyjścia dla egzemplarza komponentu multiplexer
		-- określonego etykieta mux_31
		mux_31: mux port map (MODE=>tryb, DATA_IN=>wejscie, DATA_OUT=>DATA_OUT);
		-- etykiety możemy podać w każdej linii vhdl, ale tylko w niektórych wypadkach jest
		-- to wymagane (właśnie taka sytuacja ma tutaj miejsce)
end;


-- można także okreslić konfiguracje komponentów używanych do budowy architektury
configuration z_N_bitowego_conf of mux_3to1 is
	for z_N_bitowego_arch -- dla architektury "z_N_bitowego_arch"
		for mux_31: mux -- w mux_31 jako mux
			use entity work.multiplexer(logic); --- używamy entity multiplexer z architekturą logic
			                                    --- (są zdefiniowane w multiplexer.vhdl)
		end for;
		-- tu mógłby być kolejny for dla kolejnych komponentów
	end for;
	-- tu mógłby być kolejny for dla kolejnej architektury
end;
-- gdyby w architekturze zamiast mux podać nazwę komponentu zgodna z jego entity
-- to blok ten byłby niepotrzebny bo użyta byłaby konfiguracja domyślna:


architecture z_N_bitowego of mux_3to1 is
	-- gdy chcemy wykorzystać jakiś element (w tym wypadku multiplexer
	-- opisany w multiplexer.vhdl) musimy przytoczyć
	-- (lekko zmodyfikowana) treść jego entity w postaci opisu komponentu:
	component multiplexer is
		generic (
			M: natural := 4
			-- nadpisujemy domyslna ilosc bitow
		);
		port (
			MODE: in integer range 0 to M-1;
			DATA_IN: in std_logic_vector (M-1 downto 0);
			DATA_OUT: out std_logic
		);
	end component;
	
	-- deklarujemy wewnętrzne pomocnicze sygnały
	signal tryb: integer range 0 to 2;
	signal wejscie: std_logic_vector (3 downto 0);
	
	begin
		wejscie <= '-' & c & b & a;
		-- musimy podać tez najwyższy bit (aby jego bitowość była 2^N)
		-- jako ze nie jest on nam potrzebny a korzystamy z std_logic to podajemy "don't cary"
		
		-- przy pomocy funkcji to_int z moj_pakiet konwertujemy wartość binarna na integer
		tryb<=to_int(MODE);
		
		-- mapujemy odpowiednie wejścia i wyjścia dla egzemplarza komponentu multiplexer
		-- określonego etykieta mux_31
		mux_31: multiplexer port map (MODE=>tryb, DATA_IN=>wejscie, DATA_OUT=>DATA_OUT);
end;



-- architektur może być kilka ...
architecture wybierany_case of mux_3to1 is
	begin
		with MODE select DATA_OUT <=
			a when "00",
			b when "01",
			c when "10",
			'-' when others;
			-- w przypadku std_logic formalnie (część kompilatorów tego nie wymaga)
			-- praktycznie zawsze konieczne jest podawanie "when others"
			-- gdyż mamy inne niż 0 i 1 wartości sygnału
end;

architecture proces_case of mux_3to1 is
	begin
		process (a,b,c,MODE)
			begin
				case MODE is
					when "00" => DATA_OUT <= a;
					when "01" => DATA_OUT <= b;
					when "10" => DATA_OUT <= c;
					when others => DATA_OUT <= '-';
				end case;
		end process;
end;

-- UWAGA ze względu na kolejność wykonywania instrukcji w poniższych konstrukcjach
-- oba układy opisane poniżej mogą się zsyntezować jako hierarchiczna struktura
-- multiplekserów 2 wejściowych
--
-- NIE JEST to zatem zalecany opis multipleksera 3 na 1

architecture wybierany_if_else of mux_3to1 is
	begin
		DATA_OUT <= 
			a when MODE = "00" else
			b when MODE = "01" else
			c when MODE = "10" else
			'-';
end;

architecture proces_if_else of mux_3to1 is
	begin
		process (a,b,c,MODE)
			begin
				if MODE="00" then
					DATA_OUT <= a;
				elsif MODE="01" then
					DATA_OUT <= b;
				elsif MODE="10" then
					DATA_OUT <= c;
				else
					DATA_OUT <= '-';
				end if;
		end process;
end;
