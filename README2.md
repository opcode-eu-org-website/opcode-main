## Struktura katalogów i Makefile

Oprócz plików `.tex` katalogi ze źródłami (np. `booklets`) mogą zawierać także:

* katalog `extra-tex-files` przeznaczony na dodatkowe pliki używane przez LaTeX (np. obrazki lub pliki LaTeX)
	* w plikach LaTeX odwoływać się do nich należy z pominięciem nazwy tego katalogu – np. do pliku `extra-tex-files/abc/xyz.jpg` poprzez `abc/xyz.jpg` lub `abc/xyz`
* katalog `extra-web-files` przeznaczony na dodatkowe pliki używane w XML/XHTML (np. obrazki)
	* w plikach XML odwoływać się do nich należy z pominięciem nazwy tego katalogu – np. do pliku `extra-tex-files/abc/xyz.jpg` poprzez `abc/xyz.jpg`
* katalog `images-src` przeznaczony na źródłowe wersje obrazków które będą automatycznie konwertowane na formaty obsługiwane przez LaTeX lub WWW
	* obsługiwane są pliki:
		* grafiki wektorowej .svg (tylko LaTeX, konwersja na pdf)
		* schematy pakietu [gEDA](http://www.geda-project.org/) .sch (konwersja na .pdf dla LaTeX lub .svg dla XHTML)
	* w plikach LaTeX odwoływać się do nich należy z zastąpieniem nazwy tego katalogu przez `img` i pominięciem rozszerzenia – np. do pliku `images-src/abc/xyz.sch` poprzez `abc/xyz`
	* w plikach XML odwoływać się do nich należy z zastąpieniem nazwy tego katalogu przez `img` i zastąpieniem rozszerzenia na `.svg` – np. do pliku `images-src/abc/xyz.sch` poprzez `abc/xyz.svg`
* plik `Makefile` w którym należy określić zależność pliku wynikowego od plików z katalogów `extra-tex-files` i `images-src`
	*  na przykład dla skryptu o treści w pliku `aaa.tex` używającego plików w katalogu `images-src/abc` i pliku `extra-tex-files/xyz.png` będzie to:<br />
	   `$(OUTDIR)/aaa.pdf:  extra-tex-files/xyz.png  $(call img4tex_from_src,abc/*)`
	* pominięcie zależności z `images-src` spowoduje nie wykonanie konwersji i niedostępność tych plików w trakcie budowania pliku LaTeX
	* pominięcie zależności z `extra-tex-files` lub `extra-web-files` spowoduje jedynie brak przebudowania skryptu przez make po modyfikacji tych plików

## Budowanie dokumentów PDF

* Aby zbudować wszystkie pliki można użyć polecenia `make all` (w danym podkatalogu lub w katalogu głównym).
* Aby zbudować pojedynczy plik PDF w katalogu z jego źródłami należy uruchomić polecenie `make nazwa`, gdzie `nazwa` to nazwa pliku bez rozszerzenia, np. dla pliku `aaa.pdf` budowanego z `aaa.tex` będzie to `make aaa`.
* Aby zbudować wersję dla prowadzącego do nazwy należy dodać przyrostek `--teacher`, np. `make aaa--teacher`
* Aby wymusić przebudowanie pliku (ignorując śledzenie zależności *make*) należy dodać do polecenia `VERBOSE=1`, np. `make aaa VERBOSE=1`
* Pliki wynikowe znajdują się w katalogu `output-www`

## Budowanie dokumentów XHTML

Możliwe jest tylko dla źródeł w formacie XML i odbywa się identycznie jak budowanie dokumentów PDF ze źródeł LaTeX.
Budowany jest także dokument PDF w oparciu o konwersję (wydruk) XHTML do PDF z użyciem `wkhtmltopdf`.
