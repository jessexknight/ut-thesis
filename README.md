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

There are two main options to start using the class:
1. **installing:**
  The *ut-thesis* class is available under the major LaTeX distributions
  (Linux: TeX Live, macOS: MacTeX, Windows: MiKTeX).
  Installation steps will depend on the distribution; some helpful information is
  [here](https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages).
  Within TeX Live, *ut-thesis* is part of the
  [publishers](https://packages.ubuntu.com/kinetic/all/texlive-publishers/filelist)
  bundle, so it should be available on Overleaf.
2. **local file:**
  Place the file `ut-thesis.cls` in your project directory.
  The class will only be available in this directory.
  This works if you don't have write access in the LaTeX distribution,
  or if you want to use an updated version of the class.
  The documentation is available on
  [GitHub](https://github.com/jessexknight/ut-thesis/blob/master/ut-thesis/ut-thesis.pdf).

## Examples

There is some example code on
[GitHub](https://github.com/jessexknight/ut-thesis/tree/master/test).

## Issues & Requests

... are welcome!
Please file them [here](https://github.com/jessexknight/ut-thesis) on GitHub.

If you have your thesis rejected by SGS / ProQuest due to formatting,
please help us track the (inconsistent) reasons
[here](https://github.com/jessexknight/ut-thesis/issues/23),
to see if any changes are actually needed in *ut-thesis*.

## Versions

If there are any differences between
the version here on GitHub vs the versions on CTAN or your LaTeX distribution,
the GitHub version is likely more up-to-date.
