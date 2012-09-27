#
# The makefile is used on MacOS and Unix to compile your LaTeX files in to PDF.
#
.SUFFIXES: .tex .pdf 

PACKAGES=npsbeamer
LATEX=pdflatex
LATEXDIFF=latexdiff
BIBTEX=bibtex


export TEXINPUTS := $(TEXINPUTS):$(PACKAGES)
export BSTINPUTS := $(BSTINPUTS)
export BIBINPUTS := $(BIBINPUTS)

TEXFILES = $(shell find . -iname "*.tex" -type f -exec echo "{}" \; | sed 's| |\\ |' | tr '\n' ' ')
ALL := presentation.pdf

all: $(ALL)

$(ALL): $(TEXFILES) 

#
# Build a pdf from a tex file
#
.tex.pdf:
	$(LATEX) $*
	-$(BIBTEX) $*
	$(LATEX) $*
	$(LATEX) $*


#
# Clean routines
#
clean:
	$(RM) *.log *.aux *.bbl *.blg  *.lof _*_.bib *.nav *.snm
	$(RM) *.lot *.toc *.out *.tmp *~ *.ain *.gz

distclean: clean
	$(RM) $(ALL)
	$(RM) revised*.pdf revised*.tex *.idx
