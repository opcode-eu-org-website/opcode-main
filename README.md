**This is source code repo for [www.opcode.eu.org](http://www.opcode.eu.org)**

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


## Build

### make way

1. run `make init` in main dir of this repo
2. run `sudo make installDependencies` in main dir of this repo
3. run `make all` to build all documents
4. results will be write into `output-www` directory

#### single document build

* To build a single document run `make dokumentName` in source dir for this document, where `name` is the name of the file without extension (for example `(cd booklets; make Sieci)`).
* To build a *teacher version* add the suffix `--teacher` to the filename, (e.g. `make Sieci--teacher`.
* To force rebuild a file (ignoring *make* dependency tracking) add `FORCE=1` to the command (e.g. `make Sieci FORCE=1`).

### act way

You can use [act](https://github.com/nektos/act) to locally run [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml)

1. run `act --reuse` in main dir of this repo
2. use `docker cp` to copy output directory (`output-www`) from container to host system.


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
