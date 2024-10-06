#------------------------------------------------------------------------------#

# List of all subderectories
SUBDIRS=`find -mindepth 1        \
		      -maxdepth 1        \
			  -type d            \
			  -not -name '.git'  \
			  -not -name '_*'    \
			  -not -name 'pdf'   \
			  -not -name 'sty'`

# Files to be removed from this directory at cleaning
CLEAN_FILES= *~ .*.sw?

# Files to be removed from this directory at distribution cleaning
DISTCLEAN_FILES= ${CLEAN_FILES} 

all: 
	for D in ${SUBDIRS} ; do                                      \
	  make -C $$D ;                                               \
	  mkdir -p ./pdf/1-apresentacoes/$${D} ;                      \
	  mkdir -p ./pdf/2-handouts/$${D}      ;                      \
	  cp -v $$D/*-apresentacao.pdf  ./pdf/1-apresentacoes/$${D} ; \
	  cp -v $$D/*-handout.pdf       ./pdf/2-handouts/$${D}      ; \
	done

# Cleaning
#------------------------------------------------------------------------------#

.PHONY: clean
clean:
	-@ rm -vf ${CLEAN_FILES} ; \
	for D in ${SUBDIRS} ; do    \
	  make -C $$D clean ;       \
	done


.PHONY: distclean
distclean: 
	-@ rm -vf ${DISTCLEAN_FILES} ; \
	for D in ${SUBDIRS}; do        \
	  make -C $$D distclean ;      \
	done

#------------------------------------------------------------------------------#
