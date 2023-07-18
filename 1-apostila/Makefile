#------------------------------------------------------------------------------#

TEX_FILES=Integracao_e_Series.tex
PDF_FILES=$(TEX_FILES:.tex=.pdf)
NON_FILES=$(TEX_FILES:.tex=)
DIRS= 

all: $(PDF_FILES)

RUBBER= rubber --inplace --quiet --short 
RUBBER_PDF= ${RUBBER} --pdf

%.pdf: %.tex $(wildcard *.tex) $(wildcard *.cls) $(wildcard *.sty) $(wildcard *.bib)
	${RUBBER_PDF} $(<:.tex=)

.PHONY: clean
clean:
	-@ rm -vf *~ .*~  *.bak \
      *.aux *.bbl *.blg *.lof *.log *.lot *.out *.toc \
		  *.bcf *.run.xml .*.sw? *.synctex.gz *.txss *.idx \
			*.ilg *.ind *.lod 
	-@ for T in $(NON_FILES) ; do ${RUBBER} --clean --verbose $$T ; done
	-@ for D in $(DIRS)      ; do make -C $$D clean               ; done

.PHONY: distclean
distclean: clean
	-@ rm -vf $(PDF_FILES)

#------------------------------------------------------------------------------#
