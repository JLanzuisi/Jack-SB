LATEX = latexmk
LATEXFLAGS = -lualatex -output-directory=out
PANDOC = pandoc
POWERSHELL = pwsh
TEXPANDOCFLAGS = -r markdown-auto_identifiers --top-level-division=part
EPUBPANDOCFLAGS = --epub-embed-font="typefaces/Reforma1918/webfonts/*" \
	--css=epub-style.css --epub-chapter-level=2 --number-sections
MDSRC = chapters/ch0.md chapters/ch1.md chapters/ch2.md chapters/ch3.md chapters/ch4.md \
	chapters/ch5.md chapters/ch6.md chapters/ch7.md chapters/ch8.md chapters/ch9.md \
	chapters/ch10.md chapters/ch11.md chapters/ch12.md chapters/ch13.md chapters/ch14.md \
	chapters/ch15.md chapters/ch16.md chapters/ch17.md chapters/ch18.md chapters/ch19.md \
	chapters/ch20.md chapters/ch21.md chapters/ch22.md chapters/ch23.md chapters/ch24.md \
	chapters/ch25.md chapters/ch26.md chapters/ch27.md chapters/ch28.md chapters/ch29.md \
	chapters/ch30.md chapters/ch31.md chapters/ch32.md chapters/ch33.md chapters/ch34.md \
	chapters/ch35.md chapters/ch36.md chapters/ch37.md chapters/ch38.md chapters/ch39.md \
	chapters/ch40.md chapters/ch41.md chapters/ch42.md chapters/ch43.md chapters/ch44.md \
	chapters/ch45.md chapters/ch46.md chapters/ch47.md chapters/ch48.md chapters/ch49.md \
	chapters/ch50.md chapters/ch51.md chapters/ch52.md chapters/ch53.md chapters/ch54.md \
	chapters/ch55.md chapters/ch56.md chapters/ch57.md chapters/ch58.md \
	about-author-acknowledge.md
EPUBMD = dedication.md copy-info.md epub-metadata.md epub-toc.md

pdf: Main.tex body.tex preamble.tex
	$(LATEX) $(LATEXFLAGS) Main.tex

body.tex: $(MDSRC) dedication.tex copy-info.tex about-author-acknowledge.tex
	$(PANDOC) $(TEXPANDOCFLAGS) $(MDSRC) -o body.tex
#   Body post-processing using powershell cmdlets
	$(POWERSHELL) -Command "((Get-Content -Path .\body.tex) \
		-replace '^\\part\*{Introduction}','\part*{Introduc\kern1pt tion}' \
		-replace '(^\\part{.*})','$$1\setcounter{chapter}{0}') \
		| Set-Content -Path .\body.tex"

dedication.tex: dedication.md
	$(PANDOC) $(TEXPANDOCFLAGS) dedication.md -o dedication.tex

copy-info.tex: copy-info.md
	$(PANDOC) $(TEXPANDOCFLAGS) copy-info.md -o copy-info.tex
	
about-author-acknowledge.tex: about-author-acknowledge.md
	$(PANDOC) $(TEXPANDOCFLAGS) about-author-acknowledge.md -o about-author-acknowledge.tex

epub: $(MDSRC) $(EPUBMD)
	$(PANDOC) $(EPUBPANDOCFLAGS) $(EPUBMD) $(MDSRC) -o out/main.epub

both: pdf epub

.PHONY: clean

clean:
	$(POWERSHELL) -Command "Remove-Item body.tex, dedication.tex, copy-info.tex"
	$(POWERSHELL) -Command "Remove-Item  (Join-Path "." "out\*" -Resolve)"
