LATEX= latexmk
LATEXFLAGS= -lualatex -output-directory=out
PANDOC= pandoc
TEXPANDOCFLAGS= -r markdown-auto_identifiers --top-level-division=part
EPUBPANDOCFLAGS= --epub-embed-font="typefaces/Reforma1918/webfonts/*" \
	--css=epub-style.css --epub-chapter-level=2
MDSRC= chapters/ch(0).md chapters/ch(1).md chapters/ch(2).md chapters/ch(3).md chapters/ch(4).md \
	chapters/ch(5).md chapters/ch(6).md chapters/ch(7).md chapters/ch(8).md chapters/ch(9).md \
	chapters/ch(10).md chapters/ch(11).md chapters/ch(12).md chapters/ch(13).md chapters/ch(14).md \
	chapters/ch(15).md chapters/ch(16).md chapters/ch(17).md chapters/ch(18).md chapters/ch(19).md \
	chapters/ch(20).md chapters/ch(21).md chapters/ch(22).md chapters/ch(23).md chapters/ch(24).md \
	chapters/ch(25).md chapters/ch(26).md chapters/ch(27).md chapters/ch(28).md chapters/ch(29).md \
	chapters/ch(30).md chapters/ch(31).md chapters/ch(32).md chapters/ch(33).md chapters/ch(34).md \
	chapters/ch(35).md chapters/ch(36).md chapters/ch(37).md chapters/ch(38).md chapters/ch(39).md \
	chapters/ch(40).md chapters/ch(41).md chapters/ch(42).md chapters/ch(43).md chapters/ch(44).md \
	chapters/ch(45).md chapters/ch(46).md chapters/ch(47).md chapters/ch(48).md chapters/ch(49).md \
	chapters/ch(50).md chapters/ch(51).md chapters/ch(52).md chapters/ch(53).md chapters/ch(54).md \
	chapters/ch(55).md chapters/ch(56).md chapters/ch(57).md chapters/ch(58).md

pdf: Main.tex body.tex preamble.tex
	$(LATEX) $(LATEXFLAGS) Main.tex

body.tex: $(MDSRC)
	$(PANDOC) $(TEXPANDOCFLAGS) $(MDSRC) -o body.tex

epub:
	$(PANDOC) $(EPUBPANDOCFLAGS) epub-metadata.md $(MDSRC) -o main.epub

.PHONY: clean

clean:
	rm body.tex main.epub