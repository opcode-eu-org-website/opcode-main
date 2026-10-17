# Copyright (c) 2019-2021 Robert Ryszard Paciorek <rrp@opcode.eu.org>
# 
# MIT License
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

MAINDIR     := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
OUTDIR      := $(MAINDIR)/output-www
TEXBUILDDIR := $(MAINDIR)/tmp-build
LIBFILESDIR := $(MAINDIR)/OpCode-core/lib

include $(shell if [ ! -f "$(MAINDIR)/OpCode-core/Makefile" ]; then \
	git submodule update --quiet --init "$(MAINDIR)/OpCode-vip" > /dev/null; \
	cd "$(MAINDIR)/OpCode-vip" && make > /dev/null; \
fi; echo "$(MAINDIR)/OpCode-core/Makefile")

.PHONY: init installDependencies all upload serve

init: | checkout-submodules $(TEXBUILDDIR)/pdfArticle.cls $(TEXBUILDDIR)/labels4easylist.sty $(TEXBUILDDIR)/vtable.sty $(TEXBUILDDIR)/ehhline.sty $(TEXBUILDDIR)/tikzPackets.sty
	@ echo "init done"

installDependencies:
	$(SUDO_CMD) cd $(MAINDIR)/OpCode-core && make installCoreDependencies
	$(SUDO_CMD) apt install -y  texlive-xetex texlive-luatex texlive-latex-extra texlive-font-utils fonts-symbola wget gnuplot

all:
	$(MAKE) buildAll
	@ if [ "$(realpath $(MAINDIR))" = "$(realpath $(PWD))" ]; then \
		(cd booklets    && $(MAKE) -f ../Makefile buildAll); \
		(cd LaTeX-demos && $(MAKE) -f ../Makefile buildAll); \
		ln -sf $(MAINDIR)/newIndex.xhtml $(OUTDIR)/index.xhtml; \
		(cd output-www; rm -f offline.tar.xz; tar -chJf ../tmp-build/offline.tar.xz .; mv ../tmp-build/offline.tar.xz .); \
	fi

serve:
	cd $(OUTDIR) && python3 -m http.server

upload:
	cd $(OUTDIR) && rsync -rLc --delete -v -e "ssh" --exclude="~rrp" ./ www.opcode.eu.org:/srv/WebPages/main/

upload-ln:
	cd booklets/booklets-sections/electronics && ./simulations2nginx.sh | ssh dragon 'cat > /srv/WebPages/circuitjs/short_links.conf'
	@echo -e '\033[93mYou need to reload nginx to apply the changes.\033[0m'

#
# extra dependencies
#

OutDir: $(OUTDIR)/lib/htmlFile-Blog.svg  $(OUTDIR)/lib/webSite-OldOpCode.svg

#
# addionals files
#

include $(MAINDIR)/booklets/Makefile
