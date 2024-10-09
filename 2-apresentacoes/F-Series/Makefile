#------------------------------------------------------------------------------#

HANDOUT_FILES=$(shell find -maxdepth 1 -name '*-handout.tex')
PRESENT_FILES=$(shell find -maxdepth 1 -name '*-apresentacao.tex')
HANDOUT_PDF_FILES=$(HANDOUT_FILES:.tex=.pdf)
PRESENT_PDF_FILES=$(PRESENT_FILES:.tex=.pdf)
HANDOUT_NON_FILES=$(HANDOUT_FILES:.tex=)
PRESENT_NON_FILES=$(PRESENT_FILES:.tex=)

all: $(HANDOUT_PDF_FILES) $(PRESENT_PDF_FILES)

.PHONY: handout
handout: $(HANDOUT_PDF_FILES)

.PHONY: presentation
presentation: $(PRESENT_PDF_FILES)

RUBBER= rubber --quiet --short --inplace

%-handout.pdf: %-handout.tex %-conteudo.tex \
       $(wildcard *.cls) \
       $(wildcard *.sty) \
       $(wildcard *.bib) \
       $(wildcard ./figs/*)
	${RUBBER} --pdf $(<:.tex=)

%-apresentacao.pdf: %-apresentacao.tex %-conteudo.tex \
       $(wildcard *.cls) \
       $(wildcard *.sty) \
       $(wildcard *.bib) \
       $(wildcard ./figs/*)
	${RUBBER} --pdf $(<:.tex=)

# Cleaning
#------------------------------------------------------------------------------#

RM_TMP_FILES=rm -vf *~ .*~ *.bak                                    \
                    *.aux *.bbl *.blg *.lof *.log *.lot *.out *.toc \
                    *.bcf *.run.xml *.snm *.nav *.vrb .*.sw?        \
                    *.psynctex.gz *.synctex.gz

.PHONY: clean
clean:
	-@ for T in $(NON_FILES) ; do ${RUBBER} --clean --verbose $$T ; done
	-@ ${RM_TMP_FILES}

.PHONY: distclean
distclean: clean
	-@ rm -vf ${HANDOUT_PDF_FILES}
	-@ rm -vf ${PRESENT_PDF_FILES}

#------------------------------------------------------------------------------#
