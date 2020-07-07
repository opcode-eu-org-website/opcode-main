ifeq ($(MAINDIR),)
	include ../Makefile
else

SECTIONS_SRC := $(MAINDIR)/booklets/extra-tex-files/booklets-sections
IMAGES_SRC   := $(MAINDIR)/booklets/images-src4tex
EXTRA_FILES  := $(MAINDIR)/booklets/extra-tex-files

$(OUTDIR)/Podstawy_C.pdf:                                    $(SECTIONS_SRC)/c_cpp/*
$(OUTDIR)/Wprowadzenie_do_elektroniki.pdf:                   $(SECTIONS_SRC)/electronics/*  $(IMAGES_SRC)/elektronika/*
$(OUTDIR)/Podstawowe_polecenia_Unix.pdf:                                                                                 $(TEXBUILDDIR)/img/link_twardy_i_symboliczny.pdf
$(OUTDIR)/Sieci.pdf:                                                                                                     $(EXTRA_FILES)/RJ-45_TIA-568*.png
$(OUTDIR)/Wprowadzenie_do_programowania_w_Pythonie.pdf:      $(SECTIONS_SRC)/python/*
$(OUTDIR)/Podstawy_programowania_mikrokontrolerów_STM32.pdf: $(SECTIONS_SRC)/stm32/*        $(IMAGES_SRC)/stm32/*        $(EXTRA_FILES)/stm32-examples/*/*
$(OUTDIR)/Warsztat_elektroniczny.pdf:                                                                                    $(EXTRA_FILES)/warsztat_elektroniczny/*

endif
