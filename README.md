** This is source code repo for [www.opcode.eu.org](http://www.opcode.eu.org) **

## Licence

	Copyright (c) 2003-2019 Robert Ryszard Paciorek <rrp@opcode.eu.org>
	
	To jest wolny i otwarty dokument/oprogramowanie. Redystrybucja,
	użytkowanie i/lub modyfikacja SĄ DOZWOLONE na warunkach licencji MIT.
	
	This is free and open document/software. Redistribution, use
	and/or modify ARE PERMITTED under the terms of the MIT license. 

### The MIT Licence

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	 
	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.
	 
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.


## Install dependencies

To build pdf booklets and xhtml files from this repo you must install dependencies:

1. run `make init` in main dir of this repo
2. download and install *Libraries and tools for free EDA suites (gEDA/gschem and pcb-rnd)* from [https://bitbucket.org/OpCode-eu-org/eda-libs](https://bitbucket.org/OpCode-eu-org/eda-libs) with its dependencies:
    1. `git clone https://bitbucket.org/OpCode-eu-org/eda-libs && cd eda-libs`
    2. `sudo make installDependencies`
    3. `make installLibs; sudo make installTools`
3. run `sudo make installDependencies` in main dir of this repo

**NOTE:** Steps 2.2 and 3 are dedicated for Debian based system (`installDependencies` targets use apt for software installation).
On non-Debian system see `Makefile` (in this repo main dir and in *eda-libs* repo main dir) for list of needed software and install it manually.

After this you can build all document by run `make all` or single document by run `make dokumentName` in source dir for this document (for example `cd booklets; make Podstawowe_polecenia_Unix`).

### Package dependencies

To compile the tex toolkit, several packages are necessary (on Debian Buster)

	texlive-xetex
	texlive-luatex
	texlive-latex-base
	texlive-latex-recommended
	texlive-latex-extra
	texlive-font-utils
	fonts-symbola
	
	poppler-utils:amd64 0.71.0-5 -> 0.48.0-2+deb9u2  (this had to be manually downgraded and put on hold)
	python3-pygments
	pdftk
	make
	wkhtmltopdf
	
	geda-gschem  (need also symbols and tools from [https://bitbucket.org/OpCode-eu-org/eda-libs](eda-libs) repo)
	ps2eps
	ghostscript
	pdf2svg
	inkscape
	netpbm

Those packages will be installed automatically (with apt) when run `installDependencies` make target during the procedure described above.

## Usage instruction

## Build PDF documents

* To build all the files use `make all` (in a given subdirectory or in the root directory).
* To build a single PDF file run the command `make filename` in a directory with its sources, where `name` is the name of the file without extension,
  e.g. for a file `aaa.pdf` built from `dir/aaa.tex` it will be `cd dir && make aaa`.
* To build a *teacher version* add the suffix `--teacher` to the filename, e.g. `make aaa - teacher` 
* To force a file rebuild (ignoring *make* dependency tracking) add `VERBOSE=1` to the command, e.g. `make aaa VERBOSE=1`
* The output files are located in the `output-www` directory

## Build XHTML documents

It is only possible for XML sources and is identical to building PDF documents from LaTeX sources.
A PDF document is also built based on the conversion (printout) of XHTML to PDF using `wkhtmltopdf`. 

## Directory structure and Makefile

Source directories (e.g. `booklets`) can also (besides `.tex`, `.xml` files) contain:

* `extra-tex-files` directory for additional files used by LaTeX (e.g. pictures or LaTeX files)
	* in LaTeX files you should refer to them without the name of this directory – e.g. to the file `extra-tex-files/abc/xyz.jpg` via `abc/xyz.jpg` or `abc/xyz`
* `extra-web-files` directory for additional files used in XML / XHTML (e.g. images)
	* in XML files you should refer to them without the name of this directory – e.g. to the file `extra-tex-files/abc/xyz.jpg` via `abc/xyz.jpg`
* `images-src` directory for source versions of images that will be automatically converted to formats supported by LaTeX or WWW
	* supported are:
		* vector graphics `.svg` (LaTeX only, convert to pdf)
		* [gEDA] (http://www.geda-project.org/) schemas `.sch` (convert to pdf for LaTeX or svg for XHTML)
	* in LaTeX files you should refer to them with replacing the directory name with `img` and omitting the extension – e.g. to the file `images-src/abc/xyz.sch` via `abc/xyz`
	* in XML files you should refer to them with replacing the directory name with `img` and replacing the extension with `.svg` - e.g. to the file `images-src/abc/xyz.sch` via `abc/xyz.svg`
* `Makefile` file for specify dependencies of the output file on files from `extra-tex-files` and `images-src` directories should be specified
	* for example:  when content in `aaa.tex` used files from images-src/abc` directory and `extra-tex-files/xyz.png file, it would be: <br />
	   `$(OUTDIR)/aaa.pdf:  extra-tex-files/xyz.png  $(call img4tex_from_src,abc/*)`
	* omitting dependencies from `images-src` will result in failure to perform the conversion and inaccessibility of these files while building the LaTeX file
	* omitting dependencies from `extra-tex-files` or `extra-web-files` will only cause make not to rebuild the script after modifying these files 
