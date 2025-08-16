#------------------------------------------------------------------------------#

TEX_FILES=$(shell find -maxdepth 1 -name '*.tex')
PDF_FILES=$(TEX_FILES:.tex=.pdf)
NON_FILES=$(TEX_FILES:.tex=)

LATEX := >/dev/null 2>&1 latexmk -pdf -silent

PRINT_LOG = texlogfilter --filename $(@:.pdf=.log)

#------------------------------------------------------------------------------#

all: $(PDF_FILES)

%.pdf: %.tex \
	$(wildcard *.tex) \
	$(wildcard *.cls) \
	$(wildcard *.sty) \
	$(wildcard *.bib)
	$(LATEX) $(<:.tex=)

.PHONY: clean
clean:
	-@ rm -vf *~ .*~  *.bak \
           *.aux *.bbl *.blg *.lof *.log *.lot *.out *.toc \
           *.bcf *.run.xml .*.sw? *.synctex.gz *.txss *.idx \
           *.ilg *.ind *.lod *.mtc* *.dvi *.fdb_latexmk *.fls *.pre

.PHONY: distclean
distclean: clean
	-@ rm -vf $(PDF_FILES)

#------------------------------------------------------------------------------#
