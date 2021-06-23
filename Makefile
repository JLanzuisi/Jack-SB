LATEXCMD= latexmk
LATEXFLAGS= -lualatex -output-directory=out
PANDOC= pandoc
PDFPANDOCFLAGS= -r markdown-auto_identifiers
MDSRC= chapters/ch(0).md chapters/ch(1).md chapters/ch(2).md chapters/ch(3).md chapters/ch(4).md \
	chapters/ch(5).md chapters/ch(6).md chapters/ch(7).md chapters/ch(8).md chapters/ch(9).md \
	chapters/ch(10).md chapters/ch(11).md chapters/ch(12).md chapters/ch(13).md chapters/ch(14).md \
	chapters/ch(15).md chapters/ch(16).md chapters/ch(17).md chapters/ch(18).md chapters/ch(19).md \
	chapters/ch(20).md chapters/ch(21).md chapters/ch(22).md chapters/ch(23).md chapters/ch(24).md \
	chapters/ch(25).md chapters/ch(26).md chapters/ch(27).md chapters/ch(28).md chapters/ch(29).md \
	chapters/ch(30).md chapters/ch(31).md

pdf: Main.tex body.tex preamble.tex
	$(LATEXCMD) $(LATEXFLAGS) Main.tex

body.tex:
	$(PANDOC) $(PDFPANDOCFLAGS) $(MDSRC) -o body.tex

epub:
	$(PANDOC) $(MDSRC) -o main.epub

.PHONY: clean

clean:
	rm body.tex