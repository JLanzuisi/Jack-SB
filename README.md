# Swimming backwards

This repo holds the Markdown, TeX, and any other, files required
to typeset the book with LaTeX or pandoc, for a
pdf or an epub, respectively.

## Getting the book

The final version of the pdf and epub can be
found in the releases.

## Structure

The chapters are in markdown files.

The `Main.tex` file is the main file
for the pdf and the one targeted by `latexmk`.
The `out` directory contains the output of running LaTeX,
including the pdf file.

The `preamble.tex` file holds the TeX preamble:
packages, classes, custom command, etc.
The book uses the KOMA-Script book class.

The `docx` file is the draft of the book that the
author made. It is where the markdown files are taken from.

## Building

### Epub

The epub is produced from the markdown files
using `pandoc`. Evidently, pandoc is a dependency.

To make the epub, type `make epub`.

### PDF

The build process relies on `latexmk` and
luaLaTeX. A TeX distribution (MikTeX was used here)
is required, of course, as are all the packages
invoked by `\usepackage`.

The book's typefaces are those in the Reforma family
by Pampatype. They're free to download and use.

To make the pdf, run `make` or `make pdf`.

## License

Usage or distribution of any book file must have prior permission.
*Any used of the files without permission is forbidden*.

The typefaces are under a creative commons license:

```{none}
© Copyright 2018 by the Universidad Nacional de Córdoba [AR]. Designed by Alejandro Lo Celso. Programmed by Guido Ferreyra. PampaType font foundry.
http://pampatype.com.

This Font Software is licensed under the Creative Commons BY-ND 4.0. This full license is available at: https://creativecommons.org/licenses/by-nd/4.0/
```
