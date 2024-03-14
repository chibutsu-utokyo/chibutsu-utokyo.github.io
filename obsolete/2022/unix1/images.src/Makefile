
TEX_EPS = fs-tree.eps
TEX_SRC = $(TEX_EPS:.eps=.tex)

MPOST_SRC = permission.mp #mpfigs.mp
MPOST_EPS = $(MPOST_SRC:.mp=.0)

LATEX = platex
#MPOST = jmpost -tex=$(LATEX) -interaction nonstopmode
MPOST = mpost -tex=$(LATEX) -interaction nonstopmode

TEX = $(TEX_EPS:.eps=.tex)

all: $(TEX_EPS) $(MPOST_EPS)

clean:
	rm -f $(TEX_EPS) *.dvi *.log *.aux \
	  $(MPOST_SRC:.mp=.[0-9]) $(MPOST_SRC:.mp=.[0-9][0-9]) $(MPOST_SRC:.mp=.mpx) \
	  mpxerr.tex

$(TEX_EPS): $(TEX_SRC)
	$(LATEX) $<
	dvips -E $(@:.eps=.dvi) -o $@

%.0: %.mp
	$(MPOST) $<

#$(MPOST_EPS): $(MPOST_SRC)
#	$(MPOST) $<
