#------------------------------------------------------------------------------#

ASY_FILES := $(shell find -maxdepth 1 -name '*.asy')
PDF_FILES := $(ASY_FILES:.asy=.pdf)

#------------------------------------------------------------------------------#

all: _all_done

_all_done: $(PDF_FILES)
	touch _all_done

%.pdf: %.asy utils.ah
	asy ${<}

#------------------------------------------------------------------------------#

.PHONY: clean
clean:
	@ echo Cleaning $(notdir $(CURDIR))
	@ rm -f *~ .*~ *.bak

.PHONY: distclean
distclean: clean
	@ echo Distcleaning $(notdir $(CURDIR))
	@ rm -f ${PDF_FILES} _all_done

#------------------------------------------------------------------------------#
