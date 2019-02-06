.POSIX:
.SUFFIXES:

# Standardize on local variables from NetBSD Make.
.ALLSRC ?= $^

REDIRECT = > /dev/null
DO_LATEX_WRITE18 = xelatex --shell-escape --interaction=nonstopmode poetrytex.dtx $(REDIRECT)
DO_SPLITINDEX = splitindex poetrytex $(REDIRECT) 2>&1
DO_MAKEINDEX = makeindex -s gind.ist -o poetrytex.ind poetrytex $(REDIRECT) 2>&1
DO_MAKECHANGES = makeindex -s gglo.ist -o poetrytex.gls poetrytex.glo $< $(REDIRECT) 2>&1

poetrytex.pdf: poetrytex.sty poetrytex.dtx
	$(DO_LATEX_WRITE18)
	$(DO_LATEX_WRITE18)
	$(DO_SPLITINDEX)
	$(DO_MAKEINDEX)
	$(DO_MAKECHANGES)
	while ($(DO_LATEX_WRITE18) ; \
	grep -q "Rerun to get" poetrytex.log ) do true; \
	done

poetrytex.sty: poetrytex.dtx poetrytex.ins
	xelatex --interaction=nonstopmode poetrytex.ins $(REDIRECT)

poetrytex.zip: poetrytex.dtx poetrytex.pdf Makefile LICENSE
	rm -f $@
	mkdir -p poetrytex/
	cp README.md poetrytex/README
	cp $(.ALLSRC) poetrytex/
	zip -9 -f $@ poetrytex/* >/dev/null
	rm -rf poetrytex/
