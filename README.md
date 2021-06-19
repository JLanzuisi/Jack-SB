# Swimming backwards
This repo holds the TeX, and any other, files required
to typeset the book with LaTeX.

# Structure
The `Main.tex` file is the main file
and it's the one targeted by the compilation tool.
This file holds the document structure and
includes all other required files.

Each chapter as it's `.tex` file.

The `preamble.tex` file holds the preamble matter:
packages, classes, custom command, etc.
The book uses as a base the KOMA-Script book class.

# Building
The build process relies on `latexmk` and
`lualatex`. A TeX distribution (MikTeX was used here)
is required, of course, as are all the packages
invoked by `\usepackage`.

The book's typefaces are those in the Reforma family
by Pampatype. They're free to download and use.

# License
The typefaces are under a creative commons license:
```
© Copyright 2018 by the Universidad Nacional de Córdoba [AR]. Designed by Alejandro Lo Celso. Programmed by Guido Ferreyra. PampaType font foundry.
http://pampatype.com.

This Font Software is licensed under the Creative Commons BY-ND 4.0. This full license is available at: https://creativecommons.org/licenses/by-nd/4.0/
```

Usage or distribution of any book file must have prior permission.
*Any used of the files without permission is forbidden*.
