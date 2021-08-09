-- uwidaczniamy bibliotekę IEEE
library ieee;

-- używamy z tej biblioteki wszystkich elementów z pakietu std_logic_1164
-- pozwala to na pisanie std_logic zamiast ieee.std_logic_1164.std_logic
use ieee.std_logic_1164.all;
-- oraz z pakietu numeric_std
use ieee.numeric_std.all;


-- deklarujemy nasz własny pakiet
package moj_pakiet is
	-- w ramach niego będzie funkcja to_bits()
	function to_bits(liczba, dlugosc_wektora : in integer) return  std_logic_vector;
	-- oraz to_int()
	function to_int(wartosc_bitowa : in std_logic_vector) return integer;
	-- i procedura zwieksz
	-- procedury (w odróżnieniu od funkcji) mogą modyfikować przekazane do nich argumenty, co zobaczymy dalej
	procedure zwieksz(dane: inout std_logic_vector; ovf: out std_logic);
end package;

-- definiujemy zawartość naszego pakietu
package body moj_pakiet is
	function to_bits(liczba, dlugosc_wektora : in integer) return  std_logic_vector is
		begin
			return std_logic_vector(to_unsigned(liczba,dlugosc_wektora));
	end function;
	
	function to_int(wartosc_bitowa : in std_logic_vector) return integer is
		begin
			return to_integer(unsigned(wartosc_bitowa));
	end function;
	
	procedure zwieksz(dane: inout std_logic_vector; ovf: out std_logic) is
		begin
			-- pętla for po całym zakresie binarnym wektora wejściowego/wyjściowego
			-- to coś po ' nazywa się atrybutem, na przykład:
			--  * xx'range zwraca zakres xx'left to xx'right
			--  * xx'right jest maksymalnym indeksem wektora
			F1: for i in dane'range loop
				-- przypisanie do zmiennej
				dane(i) := not dane(i);
				-- przerwanie petli (tak jak break w C)
				exit when dane(i) = '1';
				-- pomiędzy exit a when można podać etykietę pętli z której chcemy wyjść ...
				
				-- jeżeli pętla doszła do końca
				-- nie osiągając warunku przerwania to mamy przepełnienie
				if i = dane'right then
					ovf := '1';
				else
					-- galąź else jest obowiązkowa gdy nie chcemy tworzyć zatrzasków
					ovf := '0';
				end if;
			end loop;
	end procedure;
end;
