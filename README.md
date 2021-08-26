# `ut-thesis` LaTeX class

The `ut-thesis` document class for LaTeX implements the formatting requirements of
the University of Toronto School of Graduate Studies (SGS), as of Fall 2020.

## Contents

Within this [repo](https://github.com/jessexknight/ut-thesis):

- `ut-thesis/`: source code to generate `ut-thesis.cls` class file & `ut-thesis.pdf` documentation
- `test/`: some example usage of the class, including:
  - `mwe`: a minimal working example
  - `full`: a more realistic example
  - `frame`: illustration of the margins using `showframe`
  - `margin-*`: testing the margin options
- `makefile`: compile stuff
- `ctan/`: output for uploading to CTAN

## Installation

There are three main ways to install the class:
1. **latex distriubtion:**
  The `ut-thesis` class is available under the major LaTeX distributions
  (linux: TeX Live, macOS: MacTeX, windows: MiKTeX).
  Within TeX Live, it is part of the bundle "texlive-publishers".
2. **local file:**
  Simply download the class file (`.cls`) and maybe documentation (`.pdf`)
  from GitHub: `ut-thesis/`, and place it in your working directory.
  The class will only be available in this directory.
3. **tds:**
  Download the [tds](http://www.texfaq.org/FAQ-tds) version of the package
  from here: `ctan/ut-thesis.tds.zip`.
  CTAN won't host this file, because the package is too small.
  Then, run: `sudo unzip ut-thesis.tds.zip -d $texmf`
  where `$texmf` is the root of your texmf tree.
  This makes the class available to your whole LaTeX distribution.

## Issues & Requests

... are welcome!
Please file them [here](https://github.com/jessexknight/ut-thesis) on GitHub.

## Versions

If there are any differences between
the version here on GitHub vs the versions on CTAN or your LaTeX distribution,
the GitHub version is likely more up-to-date.
