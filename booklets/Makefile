ifeq ($(MAINDIR),)
	include ../Makefile
else

SECTIONS := extra-tex-files/booklets-sections

$(OUTDIR)/Podstawy_C.pdf:                                    $(SECTIONS)/c_cpp/*
$(OUTDIR)/Wprowadzenie_do_elektroniki.pdf:                   $(SECTIONS)/electronics/*  $(call img4tex_from_src,elektronika/*)
$(OUTDIR)/Podstawowe_polecenia_Unix.pdf:                     $(SECTIONS)/linux/*        $(call img4tex_from_src,linux/*)
$(OUTDIR)/Bash_jako_narzędzie_programowania.pdf:             $(SECTIONS)/linux/*
$(OUTDIR)/Sieci.pdf:                                         $(SECTIONS)/network/*                                              extra-tex-files/RJ-45_TIA-568*.png
$(OUTDIR)/Wprowadzenie_do_programowania_w_Pythonie.pdf:      $(SECTIONS)/python/*
$(OUTDIR)/Podstawy_programowania_mikrokontrolerów_STM32.pdf: $(SECTIONS)/stm32/*        $(call img4tex_from_src,stm32/*)        extra-tex-files/stm32-examples/*/*
$(OUTDIR)/Warsztat_elektroniczny.pdf:                        $(SECTIONS)/warsztat/*                                             extra-tex-files/warsztat_elektroniczny/*
$(OUTDIR)/Narzędzia_deweloperskie.pdf:                       $(SECTIONS)/tools/*

endif
