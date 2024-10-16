#------------------------------------------------------------------------------#

# List of all subderectories
SUBDIRS=`find -mindepth 1        \
              -maxdepth 1        \
              -type d            \
              -not -name '.*'    \
              -not -name '_*'    \
              -not -name 'sty'`

# Files to be removed from this directory at cleaning
CLEAN_FILES= *~ .*.sw?

# Files to be removed from this directory at distribution cleaning
DISTCLEAN_FILES= ${CLEAN_FILES} 

# Destination paths
PDF_DEST=./_pdfs
PDF_HAND=${PDF_DEST}/Z-Handouts

all:
	rm -rf ${PDF_DEST}/*
	for D in ${SUBDIRS} ; do           \
	  make -C $$D                    ; \
	  mkdir -p ${PDF_DEST}/$${D}     ; \
	  mkdir -p ${PDF_HAND}/$${D}     ; \
	  cp -v $$D/*-apresentacao.pdf ${PDF_DEST}/$${D} ; \
	  cp -v $$D/*-handout.pdf      ${PDF_HAND}/$${D} ; \
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
