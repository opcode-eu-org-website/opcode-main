ifeq ($(MAINDIR),)
	include ../Makefile
else

SECTIONS := extra-tex-files/booklets-sections
VIDEO := $(SECTIONS)/url-databse.tex $(SECTIONS)/video-intro.tex

$(OUTDIR)/Podstawy_C.pdf:                                    $(SECTIONS)/c_cpp/*        $(VIDEO)
$(OUTDIR)/Wprowadzenie_do_elektroniki.pdf:                   $(SECTIONS)/electronics/*  $(VIDEO)  $(call img4tex_from_src,elektronika/*)
$(OUTDIR)/Podstawowe_polecenia_Unix.pdf:                     $(SECTIONS)/linux/*        $(VIDEO)  $(call img4tex_from_src,linux/*)
$(OUTDIR)/Bash_jako_narzędzie_programowania.pdf:             $(SECTIONS)/linux/*        $(VIDEO)
$(OUTDIR)/Sieci.pdf:                                         $(SECTIONS)/network/*      $(VIDEO)                                          extra-tex-files/vip-code-src/sieciowe/*.py extra-tex-files/RJ-45_TIA-568*.png
$(OUTDIR)/Wprowadzenie_do_programowania_w_Pythonie.pdf:      $(SECTIONS)/python/*       $(VIDEO)  
$(OUTDIR)/Podstawy_programowania_mikrokontrolerów_STM32.pdf: $(SECTIONS)/stm32/*        $(VIDEO)  $(call img4tex_from_src,stm32/*)        extra-tex-files/stm32-examples/*/*        $(SECTIONS)/sbc/*
$(OUTDIR)/Warsztat_elektroniczny.pdf:                        $(SECTIONS)/warsztat/*     $(VIDEO)                                          extra-tex-files/warsztat_elektroniczny/*
$(OUTDIR)/Narzędzia_deweloperskie.pdf:                       $(SECTIONS)/tools/*
$(OUTDIR)/Podstawy_elektryki.pdf:                            $(SECTIONS)/elektryka/*              $(call img4tex_from_src,elektryka/*.s*)
$(OUTDIR)/Elektronika_trochę_bardziej_zaawansowana.pdf:                                           $(call img4tex_from_src,elektronika2/*)

$(OUTDIR)/Podstawy_VHDL.pdf:                                 $(OUTDIR)/Podstawy_VHDL.tgz
$(OUTDIR)/Podstawy_VHDL.tgz:                                 code-src/vhdl/*
	cd code-src/; tar -czf "$@" vhdl

endif
