.PHONY: clean

SRCS = $(wildcard abella/*.thm)
HTMLS = $(patsubst abella/%.thm, abella/%.html, $(SRCS))

fc.zip: $(HTMLS) tex/fc.pdf README.md
	zip fc.zip $(SRCS) $(HTMLS) tex/fc.pdf README.md

abella/%.html: abella/%.thm
	abella_doc $<

tex/fc.pdf: tex/fc.tex tex/refs.bib
	cd tex && latexmk -pdf fc.tex

clean:
	cd tex && latexmk -c fc.tex
	rm -f abella/*.thc abella/*.json
