#------------------------------------------------------------------------------#

SUBDIRS := $(shell find -mindepth 1         \
                        -maxdepth 1         \
                        -type d             \
                        -not -name '.git'   \
                        -not -name '_*'     \
                        -not -name 'pdf'    \
                        -not -name 'common' )

#------------------------------------------------------------------------------#

all: 
	@ for D in ${SUBDIRS} ; do           \
	  make --no-print-directory -C $$D ; \
	  rm -rf   ./pdf/1-pres/$${D} ;      \
	  rm -rf   ./pdf/2-hand/$${D} ;      \
	  mkdir -p ./pdf/1-pres/$${D} ;      \
	  mkdir -p ./pdf/2-hand/$${D} ;      \
	  cp -v $$D/pres_*.pdf       ./pdf/1-pres/$${D} ; \
	  cp -v $$D/[A-Z]-[0-9]*.pdf ./pdf/2-hand/$${D} ; \
	done

#------------------------------------------------------------------------------#

.PHONY: clean
clean:
	@ for D in ${SUBDIRS} ; do \
	  make --no-print-directory -C $$D clean ; \
	done

.PHONY: distclean
distclean: 
	@ for D in ${SUBDIRS}; do \
	  make --no-print-directory -C $$D distclean ; \
	done

#------------------------------------------------------------------------------#
