MAINDIR     := $(dir $(lastword $(MAKEFILE_LIST)))
OUTDIR      := $(MAINDIR)/output-www
TEXBUILDDIR := $(MAINDIR)/output-tmp
LIBFILESDIR := $(MAINDIR)/OpCode-core/lib
SVGICONURL  := https://bytebucket.org/OpCode-eu-org/svgiconset/raw/HEAD/other/
export PATH := $(shell realpath $(MAINDIR)/TextUtils/convert):$(PATH)


.PHONY: all installDependencies init upload
all: | init
	$(MAKE) buildAll
	[ "$(abspath $(MAINDIR))" = "$(PWD)" ] && (cd booklets &&    $(MAKE) -f ../Makefile buildAll) || true
	[ "$(abspath $(MAINDIR))" = "$(PWD)" ] && (cd LaTeX-demos && $(MAKE) -f ../Makefile buildAll) || true

installDependencies:
	cd $(MAINDIR)/TextUtils && make installDependencies
	apt install  texlive-xetex texlive-luatex texlive-latex-extra texlive-font-utils fonts-symbola
	@ if ! which sch2img.sh > /dev/null; then \
		echo "Cant't find sch2img.sh in PATH"; \
		echo "You should download and install EDA libs (with dependencies!) from https://bitbucket.org/OpCode-eu-org/eda-libs"; \
		return 3; \
	fi

init: | check-submodules $(TEXBUILDDIR)/pdfArticle.cls $(TEXBUILDDIR)/labels4easylist.sty $(TEXBUILDDIR)/vtable.sty $(TEXBUILDDIR)/ehhline.sty
	@ echo "init done"

upload:
	ln -sf `realpath newIndex.xhtml` $(OUTDIR)/index.xhtml
	cd $(OUTDIR) && rsync -rLc --delete -v -e "ssh" --exclude="~rrp" ./ www.opcode.eu.org:/srv/WebPages/main/


#
# addionals files
#

$(MAINDIR)/output-www/Podstawowe_polecenia_Unix.pdf: $(MAINDIR)/output-tmp/link_twardy_i_symboliczny.pdf

$(MAINDIR)/output-tmp/%.pdf: $(MAINDIR)/booklets/extra-tex-files/%.svg
	inkscape $^ --export-pdf=$@

$(TEXBUILDDIR)/pdfArticle.cls $(TEXBUILDDIR)/labels4easylist.sty $(TEXBUILDDIR)/vtable.sty $(TEXBUILDDIR)/ehhline.sty:
	mkdir -p $(TEXBUILDDIR)
	wget -O "$@" "https://bitbucket.org/OpCode-eu-org/latex-libs/raw/HEAD/pkgs/$(@F)"

#
# submodules
#

.PHONY: check-submodules update-submodules

check-submodules: $(MAINDIR)/OpCode-core/lib/base.css $(MAINDIR)/TextUtils/Makefile $(MAINDIR)/OpCode-vip/vademecum/images-src4web

$(MAINDIR)/OpCode-core/% $(MAINDIR)/TextUtils/% $(MAINDIR)/OpCode-vip/%:
	$(MAKE) update-submodules
	chmod 111 `git submodule | awk '{print $$2}'`

update-submodules:
	git submodule update --init
	git submodule foreach git pull origin master
	git submodule foreach git checkout -f .

#
# include core makefile from TextUtils
#

-include $(MAINDIR)/TextUtils/makefiles/buildWebSite.mk
