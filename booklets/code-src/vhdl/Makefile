GHDL_OPT = --std=08

tester:
	# dodanie do biblioteki
	ghdl -i $(GHDL_OPT) *.vhdl
	# analiza/kompilacja rzeczy potrzebnych do uruchomienia jednostki (unit'a) $@
	ghdl -m $(GHDL_OPT) $@
	# uruchomienie (symulacji) jednostki (unit'a) $@
	ghdl -r $(GHDL_OPT) $@ --wave=$@.ghw
	# wyświetlenie wyniku
	gtkwave $@

clean:
	rm -f *.ghw *.cf
