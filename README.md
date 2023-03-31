# `scrwfile` — Use LaTeX .aux file in place of `\newrite` files

------------------------------------------------------------------------------

LaTeX package `scrwfile`  
Copyright (c) 2010—2023 Markus Kohm  
Release: 2023-04-01 v0.1.99  
License: LPPL 1.3c (see [LICENSE.md](https://github.com/komascript/scrwfile/blob/main/LICENSE.md))  
CTAN Location: https://ctan.org/pkg/scrwfile

------------------------------------------------------------------------------

## Summary

`scrwfile` is a LaTeX package, that provides a means of sending all LaTeX
`\newrite`, table of contents, and other miscellaneous output via the LaTeX
`.aux`-file. The mechanism subverts the mechanism of `\newrite`, and means there
will almost never be a “`No room for new \write`” message.

`scrwfile` is a [KOMA-Script](https://www.ctan.org/pkg/koma-script)
spin-off and was part of that bundle up to `scrwfile` version 0.1.12
resp. KOMA-Script version 3.38. It has been removed from KOMA-Script because
it is experimental and no longer maintained officially.

## Status

This is an experimental package. There is currently no official maintainer
of this package.

## Installation

We recommend to use the package manager of your TeX distribution to install
packages. However, if you need to install `scrwfile` manually, you
can either use a semi-manual installation or a completely manual installation.

### Semi-manual Installation

For a semi-manual installation you can first create a local clone
of the repository:

```bash
git clone https://github.com/komascript/scrwfile.git
```

Then enter the directory created while cloning the repository:

```bash
cd scrwfile
```

Last, but not least use `l3build` to install it locally with manual and
sources:

```bash
l3build install --full
```

or without manual and sources:

```bash
l3build install
```

### Completely Manual Installation

To do a completely manual installation, download `scrwfile.dtx`.
Then extract it using:

```bash
tex scrwfile.dtx
```

To create the manual use:

```bash
pdflatex scrwfile.dtx
mkindex scrwfile
pdflatex scrwfile.dtx
pdflatex scrwfile.dtx
```

Now, you can either install it in the proper directory (see the
documentation of your TeX distribution) or copy `scrwfile.sty`
to your document directory.

------------------------------------------------------------------------------
