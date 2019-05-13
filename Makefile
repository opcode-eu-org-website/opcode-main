MAINDIR     := $(dir $(lastword $(MAKEFILE_LIST)))
OUTDIR      := $(MAINDIR)/output-www
TEXBUILDDIR := $(MAINDIR)/output-tmp
LIBFILESDIR := $(MAINDIR)/OpCode-core/lib
SVGICONURL  := https://bytebucket.org/OpCode-eu-org/svgiconset/raw/HEAD/other/
export PATH := $(shell realpath $(MAINDIR)/TextUtils/convert):$(PATH)


all: | check-submodules $(TEXBUILDDIR)/pdfArticle.cls $(TEXBUILDDIR)/labels4easylist.sty $(TEXBUILDDIR)/vtable.sty $(TEXBUILDDIR)/ehhline.sty
	cd booklets;    $(MAKE) -f ../Makefile buildAll
	cd LaTeX-demos; $(MAKE) -f ../Makefile buildAll

upload:
	ln -sf `realpath newIndex.xhtml` $(OUTDIR)/index.xhtml
	cd $(OUTDIR); rsync -rLc --delete -v -e "ssh" ./ www.opcode.eu.org:/srv/WebPages/main/


#
# addionals files
#

$(TEXBUILDDIR)/pdfArticle.cls $(TEXBUILDDIR)/labels4easylist.sty $(TEXBUILDDIR)/vtable.sty $(TEXBUILDDIR)/ehhline.sty:
	mkdir -p $(TEXBUILDDIR)
	wget -O "$@" "https://bitbucket.org/OpCode-eu-org/latex-libs/raw/HEAD/pkgs/$(@F)"

#
# submodules
#

.PHONY: check-submodules update-submodules

check-submodules: $(MAINDIR)/OpCode-core/lib/base.css $(MAINDIR)/TextUtils/convert/xml2xhtml.py $(MAINDIR)/OpCode-vip/vademecum/images-src4web

$(MAINDIR)/OpCode-core/% $(MAINDIR)/TextUtils/% $(MAINDIR)/OpCode-vip/%:
	git submodule update --init
	[ -e "$@" ] || $(MAKE) update-submodules
	chmod 111 `git submodule | awk '{print $$2}'`

update-submodules:
	git submodule foreach git pull origin master
	git submodule foreach git checkout -f .

#
# include core makefile from TextUtils
#

-include $(MAINDIR)/TextUtils/makefiles/buildWebSite.mk
