#------------------------------------------------------------------------------#

M_FILES=$(shell find -maxdepth 1 -name 'build_*.m')
P_FILES=$(M_FILES:.m=.pdf)

# List of all subderectories
SUBDIRS=

# Files to be removed from this directory at cleaning
CLEAN_FILES= *~ .*.sw? octave-workspace *.pdf

# Files to be removed from this directory at distribution cleaning
DISTCLEAN_FILES= ${CLEAN_FILES} aux_build_* build_*.pdf

OCTAVE=/usr/bin/octave --no-gui --silent 

all: ${P_FILES}

%.pdf: %.m
	@ ${OCTAVE} $^
	@ cp aux_$(patsubst %.pdf,%,$@)/$@ .

# Instalation
#------------------------------------------------------------------------------#

.PHONY: install
install: 
	/usr/bin/cp -v */figs/* /home/luis/01-Work/04-latex/05-apostilas/4-Calculo-4/3-Series-Numericas/figs/

# Cleaning
#------------------------------------------------------------------------------#

.PHONY: clean
clean:
	@ rm -rvf ${CLEAN_FILES} ;  \
 	for D in ${SUBDIRS} ; do    \
 	  make -C $$D clean ;       \
 	done


.PHONY: distclean
distclean: 
	@ rm -rvf ${DISTCLEAN_FILES} ; \
 	for D in ${SUBDIRS}; do        \
 	  make -C $$D distclean ;      \
 	done

#------------------------------------------------------------------------------#
