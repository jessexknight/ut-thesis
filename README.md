# `ut-thesis` LaTeX class

The `ut-thesis` document class for LaTeX implements the formatting requirements of
the University of Toronto School of Graduate Studies (SGS), as of Fall 2020.

## Contents

- `ut-thesis/`: source code to generate `ut-thesis.cls` class file & `ut-thesis.pdf` documentation
- `test/`: some example usage of the class, including:
  - `mwe`: a minimal working example
  - `full`: a more realistic example
  - `margins`: illustration of the margins using `showframe`
- `Makefile`: compile stuff
- `ctan/`: output for uploading to CTAN

## Installation

There are many ways to install the class. Here are two:
1. **local file:**
  Simply download the class file (`.cls`) and documentation (`.pdf`)
  from here: `ut-thesis/`, and place it in your working directory.
  The class will only be available in this directory.
2. **tds:**
  Download the [tds](http://www.texfaq.org/FAQ-tds) version of the package
  from here: `ctan/ut-thesis.tds.zip`.
  CTAN won't host this file, because the package is too small.
  Then, run: `sudo unzip ut-thesis.tds.zip -d $texmf`
  where `$texmf` is the root of your texmf tree.
  This makes the class available to your whole LaTeX distribution.

## Issues & Requests

... are welcome! Please file them [here](https://github.com/jessexknight/ut-thesis) on GitHub.

