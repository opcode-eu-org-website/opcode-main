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

To compile the tex toolkit, several packages are necesary (list written
after getting the tools to work, based on aptitude log)

    texlive-latex-base
    texlive-latex-extra
    texlive-xetex
    texlive-luatex
    poppler-utils:amd64 0.71.0-5 -> 0.48.0-2+deb9u2  (this had to be manually downgraded and put on hold)
    pdf2svg
    psutils
    texlive-font-utils
    fonts-symbola