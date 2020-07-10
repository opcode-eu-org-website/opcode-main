ifeq ($(MAINDIR),)
	include ../Makefile
else

SECTIONS_SRC := $(MAINDIR)/booklets/extra-tex-files/booklets-sections
EXTRA_FILES  := $(MAINDIR)/booklets/extra-tex-files

$(OUTDIR)/Podstawy_C.pdf:                                    $(SECTIONS_SRC)/c_cpp/*
$(OUTDIR)/Wprowadzenie_do_elektroniki.pdf:                   $(SECTIONS_SRC)/electronics/*  $(call img4tex_from_src,elektronika/*)
$(OUTDIR)/Podstawowe_polecenia_Unix.pdf:                     $(SECTIONS_SRC)/linux/*        $(call img4tex_from_src,linux/*)
$(OUTDIR)/Bash_jako_narzędzie_programowania.pdf:             $(SECTIONS_SRC)/linux/*
$(OUTDIR)/Sieci.pdf:                                         $(SECTIONS_SRC)/network/*                                              $(EXTRA_FILES)/RJ-45_TIA-568*.png
$(OUTDIR)/Wprowadzenie_do_programowania_w_Pythonie.pdf:      $(SECTIONS_SRC)/python/*
$(OUTDIR)/Podstawy_programowania_mikrokontrolerów_STM32.pdf: $(SECTIONS_SRC)/stm32/*        $(call img4tex_from_src,stm32/*)        $(EXTRA_FILES)/stm32-examples/*/*
$(OUTDIR)/Warsztat_elektroniczny.pdf:                        $(SECTIONS_SRC)/stm32/01*.tex                                          $(EXTRA_FILES)/warsztat_elektroniczny/*

endif
