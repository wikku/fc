.PHONY: clean

fc.zip: abella/adq.html abella/conf.html tex/fc.pdf
	zip fc.zip abella/adq.thm abella/adq.html abella/conf.thm abella/conf.html tex/fc.pdf

abella/adq.html: abella/adq.thm
	abella_doc abella/adq.thm

abella/conf.html: abella/conf.thm
	abella_doc abella/conf.thm

tex/fc.pdf: tex/fc.tex tex/refs.bib
	cd tex && latexmk -pdf fc.tex

all:
	cd tex && latexmk -pdf fc.tex

clean:
	cd tex && latexmk -c fc.tex
	rm abella/*.thc abella/*.json
