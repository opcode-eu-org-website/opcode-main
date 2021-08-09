library ieee;
use IEEE.STD_LOGIC_1164.all;

-- deklarujemy multiplexer 1 bitowy o M wejściach
entity multiplexer is
	-- parametr ogólny, modyfikuje zachowanie jednostki projektowej
	-- na etapie jej umieszczania w projekcie (coś jak #define w C)
	generic (
		M: natural := 2
	);
	-- porty wejściowe i wyjściowe jednostki
	-- przy ich pomocy komunikujemy się z innymi elementami systemu
	-- kierunek portu oprócz zaprezentowanego in i out może być:
	--  * inout - port dwukierunkowy (jak GPIO w AVR)
	--  * buffer - port wyjściowy z którego możemy odczytać wpisana do niego
	--             wartość (przerzutnik wyjściowy),
	--             tryb ten może stwarzać problemy z kompatybinością
	port (
		-- tryb jest liczba całkowita z zakresu 0-M
		MODE: in integer range 0 to M-1;
		-- wejścia zgrupowane sa w postaci wektora M-1 bitowego
		DATA_IN: in std_logic_vector (M-1 downto 0);
		-- wyjściem jest pojedynczy bit
		DATA_OUT: out std_logic
	);
end;

-- definiujemy architekturę naszego multipleksera
architecture logic of multiplexer is
	begin
		DATA_OUT <= DATA_IN(MODE);
end;
