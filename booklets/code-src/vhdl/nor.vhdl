library ieee;
use ieee.std_logic_1164.all;

entity nor3 is
	port (
		wej: in std_logic_vector(0 to 2);
		wyj: out std_logic
	);
end;


architecture logic of nor3 is
	begin
		wyj <= not (wej(0) or wej(1) or wej(2));
		-- ze względu na to iż funkcjonalność XOR opisuje się w taki prosty sposób
		-- w praktycznych zastosowaniach raczej nie ma sensu robienia osobnego komponentu XOR ...
end;

-- możemy jednak użyć innych sposobów implementacji XOR
-- do zademonstrowania procesów z pętlami i oczekiwaniem:

architecture proces_while of nor3 is
	begin
		process
			variable i: integer range -1 to 3;
			variable x: std_logic;
			begin
				-- czekamy na zmianę któregoś z sygnałów
				wait on wej;
				-- jest to podobne do listy podawanej po słowie proces ...
				-- tyle ze wtedy oczekiwanie jest umieszczane na końcu ciała procesu ...
				-- należy wspomnieć ze jest też wait until (czekanie na spełnienie warunku)
				
				x := '0';
				i := -1;
				
				-- petla typu while
				L0: while i<2 loop
					i := i+1;
					
					-- instrukcja next powoduje przejście do następnego kroku pętli
					next when wej(i) = '0';
					-- pomiędzy next a when można podać etykietę pętli której iteracje chcemy zakończyć ...
					
					x := '1';
				end loop;
				
				wyj <= not x;
		end process;
end;


architecture proces_loop of nor3 is
	begin
		process (wej)
			variable i: integer range -1 to 2;
			variable x: std_logic;
			begin
				x := '0';
				i := -1;
				-- pętla prosta
				L0: loop
					exit when i=2;
					i := i+1;
					next when wej(i) = '0';
					x := '1';
					exit;
				end loop;
				
				wyj <= not x;
		end process;
end;
