#------------------------------------------------------------------------------#

ASY_FILES=$(shell find -maxdepth 1 -name '*.asy')
PDF_FILES=$(ASY_FILES:.asy=.pdf)
NON_FILES=$(ASY_FILES:.asy=)

all: $(PDF_FILES)

%.pdf: %.asy utils.ah
	asy ${<}

# Cleaning
#------------------------------------------------------------------------------#

RM_TMP_FILES=rm -vf *~ .*~ *.bak

.PHONY: clean
clean:
	-@ ${RM_TMP_FILES}

.PHONY: distclean
distclean: clean
	-@ rm -vf ${PDF_FILES}

#------------------------------------------------------------------------------#
