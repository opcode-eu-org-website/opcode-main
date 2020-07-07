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
	[ "$(abspath $(MAINDIR))" = "$(PWD)" ] && (cd booklets &&    $(MAKE) -f ../Makefile buildAll) || true
	[ "$(abspath $(MAINDIR))" = "$(PWD)" ] && (cd LaTeX-demos && $(MAKE) -f ../Makefile buildAll) || true

serve:
	cd $(OUTDIR) && python3 -m http.server

upload:
	ln -sf `realpath newIndex.xhtml` $(OUTDIR)/index.xhtml
	cd $(OUTDIR) && rsync -rLc --delete -v -e "ssh" --exclude="~rrp" ./ www.opcode.eu.org:/srv/WebPages/main/

#
# addionals files
#

include $(MAINDIR)/booklets/Makefile

$(TEXBUILDDIR)/img/%.pdf: $(MAINDIR)/booklets/extra-tex-files/%.svg
	inkscape $^ --export-pdf=$@

$(TEXBUILDDIR)/pdfArticle.cls $(TEXBUILDDIR)/labels4easylist.sty $(TEXBUILDDIR)/vtable.sty $(TEXBUILDDIR)/ehhline.sty:
	mkdir -p $(TEXBUILDDIR)
	wget -O "$@" "https://bitbucket.org/OpCode-eu-org/latex-libs/raw/HEAD/pkgs/$(@F)"

#
# submodules
#

.PHONY: checkout-submodules update-submodules protect-submodules

checkout-submodules:
	git submodule update --init

update-submodules: | checkout-submodules
	git submodule foreach 'git pull origin master; git checkout -f .'

protect-submodules:
	chmod 111 `git submodule | awk '{print $$2}'`
	git submodule | awk '{print $$2}' | while read sm; do git config --local "submodule.$$sm.ignore" all; done

#
# include core makefile from TextUtils
#

-include $(MAINDIR)/TextUtils/makefiles/buildWebSite.mk
