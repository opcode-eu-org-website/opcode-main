# Copyright (c) 2019-2020 Robert Ryszard Paciorek <rrp@opcode.eu.org>
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

MAINDIR     := $(dir $(lastword $(MAKEFILE_LIST)))
OUTDIR      := $(MAINDIR)/output-www
TEXBUILDDIR := $(MAINDIR)/output-tmp
LIBFILESDIR := $(MAINDIR)/OpCode-core/lib
SVGICONURL  := https://bytebucket.org/OpCode-eu-org/svgiconset/raw/HEAD/other/
export PATH := $(shell realpath $(MAINDIR)/TextUtils/convert):$(PATH)


.PHONY: help init installDependencies all upload serve
help:
	@ cd $(MAINDIR) && awk '/^#/ {x=0} x==1 {print $0} /^## Install/ {x=1}' README.md

init: | checkout-submodules $(TEXBUILDDIR)/pdfArticle.cls $(TEXBUILDDIR)/labels4easylist.sty $(TEXBUILDDIR)/vtable.sty $(TEXBUILDDIR)/ehhline.sty
	@ echo "init done"

installDependencies:
	cd $(MAINDIR)/TextUtils && make installDependencies
	apt install  texlive-xetex texlive-luatex texlive-latex-extra texlive-font-utils fonts-symbola
	@ if ! which sch2img.sh > /dev/null; then \
		echo "Cant't find sch2img.sh in PATH"; \
		echo "You should download and install EDA libs (with dependencies!) from https://bitbucket.org/OpCode-eu-org/eda-libs"; \
		return 3; \
	fi

all:
	$(MAKE) buildAll
	[ "$(abspath $(MAINDIR))" = "$(PWD)" ] && (cd booklets    && $(MAKE) -f ../Makefile buildAll) || true
	[ "$(abspath $(MAINDIR))" = "$(PWD)" ] && (cd LaTeX-demos && $(MAKE) -f ../Makefile buildAll) || true

serve:
	cd $(OUTDIR) && python3 -m http.server

upload:
	ln -sf `realpath $(MAINDIR)/newIndex.xhtml` $(OUTDIR)/index.xhtml
	cd $(OUTDIR) && rsync -rLc --delete -v -e "ssh" --exclude="~rrp" ./ www.opcode.eu.org:/srv/WebPages/main/

#
# submodules
#

.PHONY: checkout-submodules update-submodules protect-submodules

checkout-submodules:
	git submodule update --init

update-submodules: | checkout-submodules
	git submodule foreach 'git pull origin master; git checkout -f .'
	git submodule | awk '{print $$2}' | while read sm; do git add $$sm 2>/dev/null; done

protect-submodules:
	chmod 111 `git submodule | awk '{print $$2}'`
	git submodule | awk '{print $$2}' | while read sm; do git config --local "submodule.$$sm.ignore" all; done

#
# include core makefile from TextUtils
#

-include $(MAINDIR)/TextUtils/makefiles/buildWebSite.mk

#
# addionals files
#

include $(MAINDIR)/booklets/Makefile

$(TEXBUILDDIR)/pdfArticle.cls $(TEXBUILDDIR)/labels4easylist.sty $(TEXBUILDDIR)/vtable.sty $(TEXBUILDDIR)/ehhline.sty:
	mkdir -p $(TEXBUILDDIR)
	wget -O "$@" "https://bitbucket.org/OpCode-eu-org/latex-libs/raw/HEAD/pkgs/$(@F)"
