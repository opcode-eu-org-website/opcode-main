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
SVGICONURL  := https://bytebucket.org/OpCode-eu-org/svgiconset/raw/HEAD/other/
export PATH := $(MAINDIR)/TextUtils/convert:$(PATH)


.PHONY: help init installDependencies all upload serve
help:
	@ cd $(MAINDIR) && awk '/^#/ {x=0} x==1 {print $0} /^## Install/ {x=1}' README.md
	@ echo "Run \`make all\` to build all documents or build single document by run \`make dokumentName\` in source dir for this document (e.g. \`cd booklets; make Sieci\`)."

init: | checkout-submodules $(TEXBUILDDIR)/pdfArticle.cls $(TEXBUILDDIR)/labels4easylist.sty $(TEXBUILDDIR)/vtable.sty $(TEXBUILDDIR)/ehhline.sty $(TEXBUILDDIR)/tikzPackets.sty
	@ echo "init done"

installDependencies:
	cd $(MAINDIR)/TextUtils && make installDependencies
	apt install  texlive-xetex texlive-luatex texlive-latex-extra texlive-font-utils fonts-symbola wget
	@ if ! command -v sch2img.sh > /dev/null; then \
		echo "Cant't find sch2img.sh in PATH"; \
		echo "You should download and install EDA libs (with dependencies!) from https://bitbucket.org/OpCode-eu-org/eda-libs"; \
		return 3; \
	fi

all:
	$(MAKE) buildAll
	@ [ "$(MAINDIR)" = "$(PWD)" ] && (cd booklets    && $(MAKE) -f ../Makefile buildAll) || true
	@ [ "$(MAINDIR)" = "$(PWD)" ] && (cd LaTeX-demos && $(MAKE) -f ../Makefile buildAll) || true

serve:
	cd $(OUTDIR) && python3 -m http.server

upload:
	ln -sf $(MAINDIR)/newIndex.xhtml $(OUTDIR)/index.xhtml
	cd $(OUTDIR) && rsync -rLc --delete -v -e "ssh" --exclude="~rrp" ./ www.opcode.eu.org:/srv/WebPages/main/

upload-ln:
	cd booklets/booklets-sections/electronics && ./simulations2nginx.sh | ssh dragon 'cat > /srv/WebPages/ln/circuitjs.short_links.conf'
	@echo -e '\033[93mYou need to reload nginx to apply the changes.\033[0m'

#
# submodules
#

.PHONY: checkout-submodules

checkout-submodules:
	git submodule update --init --recursive

#
# extra dependencies
#

OutDir: $(OUTDIR)/lib/htmlFile-Blog.svg  $(OUTDIR)/lib/webSite-OldOpCode.svg

#
# include core makefile from TextUtils
#

-include $(MAINDIR)/TextUtils/makefiles/buildWebSite.mk

#
# addionals files
#

include $(MAINDIR)/booklets/Makefile

$(TEXBUILDDIR)/pdfArticle.cls $(TEXBUILDDIR)/labels4easylist.sty $(TEXBUILDDIR)/vtable.sty $(TEXBUILDDIR)/ehhline.sty $(TEXBUILDDIR)/tikzPackets.sty:
	mkdir -p $(TEXBUILDDIR)
	wget -O "$@" "https://bitbucket.org/OpCode-eu-org/latex-libs/raw/HEAD/pkgs/$(@F)"
