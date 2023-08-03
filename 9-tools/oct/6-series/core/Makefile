#------------------------------------------------------------------------------#

# List of all subderectories
SUBDIRS= 

# Files to be removed from this directory at cleaning
CLEAN_FILES= *~ octave-workspace

# Files to be removed from this directory at distribution cleaning
DISTCLEAN_FILES= ${CLEAN_FILES} 

all:

install:

# Cleaning
#------------------------------------------------------------------------------#

.PHONY: clean
clean:
	@ rm -vf ${CLEAN_FILES} ;    \
	for D in ${SUBDIRS} ; do   \
	  make -C $$D clean ;      \
	done


.PHONY: distclean
distclean: 
	@ rm -vf ${DISTCLEAN_FILES} ; \
	for D in ${SUBDIRS}; do     \
	  make -C $$D distclean ;   \
	done

#------------------------------------------------------------------------------#
