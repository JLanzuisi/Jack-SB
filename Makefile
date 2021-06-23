LATEXCMD= latexmk
LATEXFLAGS= -lualatex
PANDOC= pandoc
PANDOCFLAGS= -output-directory=out
MDSRC= chapters/intro.md \
	chapters/cap1.md chapters/cap2.md chapters/cap3.md chapters/cap4.md chapters/cap5.md chapters/cap6.md \
	chapters/cap7.md chapters/cap8.md chapters/cap9.md chapters/cap10.md chapters/cap11.md chapters/cap12.md \
	chapters/cap13.md chapters/cap14.md chapters/cap15.md chapters/cap16.md chapters/cap17.md chapters/cap18.md \
	chapters/cap19.md chapters/cap20.md chapters/cap21.md chapters/cap22.md chapters/cap23.md chapters/cap24.md \
	chapters/cap25.md chapters/cap26.md chapters/cap27.md chapters/cap28.md chapters/cap29.md chapters/cap30.md \
	chapters/cap31.md chapters/cap32.md

pdf: Main.tex body.tex preamble.tex
	$(LATEXCMD) $(LATEXFLAGS) Main.tex

body.tex:
	$(PANDOC) $(MDSRC) -o body.tex

epub:
	$(PANDOC) $(MDSRC) -o main.epub

.PHONY: clean

clean:
	rm body.tex