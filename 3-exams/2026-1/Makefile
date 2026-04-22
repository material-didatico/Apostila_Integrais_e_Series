#------------------------------------------------------------------------------#

# List of all subderectories
SUBDIRS=`find -mindepth 1 -maxdepth 1 -type d -not -name '.*' -not -name '_*'`

TEX_FILES=$(shell find -maxdepth 1 -name '*.tex')
PDF_FILES=$(TEX_FILES:.tex=.pdf)
NON_FILES=$(TEX_FILES:.tex=)

LATEX     := >/dev/null 2>&1 latexmk -pdf -silent
PRINT_LOG := texlogfilter --filename $(@:.pdf=.log)

all: $(PDF_FILES)
	for D in ${SUBDIRS} ; do   \
	  make -C $$D ;            \
	done

%.pdf: %.tex $(wildcard *.cls) $(wildcard *.sty) $(wildcard *.bib)
	-@ for D in $(SUBDIRS) ; do make -C $$D ; done
	$(LATEX) $(<:.tex=) || $(PRINT_LOG)

.PHONY: clean
clean:
	-@ rm -vf *~ .*~  *.bak \
       *.aux *.bbl *.blg *.lof *.log *.lot *.out *.toc \
       *.bcf *.run.xml .*.sw? *.synctex.gz *.txss *.idx \
			 *.ilg *.ind *.lod *.mtc* *.dvi *.fdb_latexmk *.fls *.pre
	-@ for D in $(SUBDIRS) ; do make -C $$D clean ; done

.PHONY: distclean
distclean: clean
	-@ rm -vf $(PDF_FILES)
	-@ for D in $(SUBDIRS) ; do make -C $$D distclean ; done

#------------------------------------------------------------------------------#
