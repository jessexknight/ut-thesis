LaTeX2e document class and template for graduate theses that conform to
the guidelines of the School of Graduate Studies at the University of
Toronto (as of 2008).  [http://www.sgs.utoronto.ca/informationfor/+
students/finup/producingthesis/formatting.htm]

Copyright (c) 1998-2013 Francois Pitt <fpitt@cs.utoronto.ca>
last updated at 16:17 (EDT) on Wed 25 Sep 2013

This work may be distributed and/or modified under the conditions of
the LaTeX Project Public License, either version 1.3c of this license
or (at your option) any later version.
The latest version of this license is in
    http://www.latex-project.org/lppl.txt
and version 1.3c or later is part of all distributions of LaTeX
version 2005/12/01 or later.

This work has the LPPL maintenance status "maintained".

The Current Maintainer of this work is
Francois Pitt <fpitt@cs.utoronto.ca>.

This work consists of the following files:
  README:        this file
  ut-thesis.cls: class file
  ut-thesis.tex: template

See the comments inside each file for further details.

---------------
Version History
---------------

TODO:
- [2012/12/06] Redefinition of \thebibliography not compatible with
  packages like natbib. Figure out how to fix this.

v2.1: 2013/09/25 (Francois Pitt)
- Changed definition of dedication environment to simply format its
  paragraph flush right with no header -- this also helps fix a bug
  where LaTeX complains of a "missing \item" when both dedication and
  acknowledgement sections are used (reported by Bardia Bina).

v2.0: 2012/06/01 (Francois Pitt)
- Rewritten to use standard packages: `setspace' to handle line spacing
  and `geometry' for page layout.  Some options and macros have been
  renamed from v1.8, hence the change of major version number -- this
  version is _not_ fully backward-compatible because of these changes.
- Renamed `oneandahalfspaced' option to `onehalfspaced' (for consistency
  with `setspace' package).
- Removed `singlespaced', `oneandahalfspaced', `doublespaced', and
  `spacing' environments -- use environments from `setspace' package
  instead.
- Renamed `spacednotes' option to `standardspacednotes' and added
  `singlespacednotes' option.
- Added options `cleardoublepagestyleempty', `cleardoublepagestyleplain'
  and `cleardoublepagestylestandard' to set the default style for
  cleared pages, and new macros `\clearthesisdoublepage' and
  `\clearstandarddoublepage'.
- Changed default options: now 1 1/2-spaced and LaTeX default font size.
- Renamed `utthesis' page style to `thesis'.
- The abstract is no longer put on a right-side page by default.
- Cleaned up the code and comments throughout.

v1.8: 2000/02/20, 1999/12/10 (Francois Pitt)
- Minor formatting changes to comments.
- Fixed circular definition problem with \currenttextsize that caused
  TeX to run out of input stack memory.

v1.7: 1999/06/02, 1999/05/20, 1999/05/13 (Francois Pitt)
- Minor change to the format of the date printed on every page with the
  `draft' option.
- Minor cosmetic change to the word "DRAFT" printed on the corners of
  every page with the `draft' option.
- Made `draft' mode doublespaced by default (it just makes more sense
  for actual drafts; suggested by Eric Joanis).
- Changed \currenttextsize from a "\newcommand" to a "\let".
- Added "known bugs" above.

v1.6: 1999/03/06 (Francois Pitt)
- Minor change: replaced ``\ifx\empty#1\else...\fi'' with
  ``\ifx\empty#1\empty\else...\fi'' (the former works only by accident
  while the latter is logically correct).

v1.5: 1999/02/17 (Francois Pitt)
- Fixed missing page numbers and headers by removing redefinition of
  \cleardoublepage (reported by Robert Bernecky 1999/02/04 and Nedialko
  Nedialkov 1999/02/12).
- Added \clearemptydoublepage and \clearplaindoublepage commands.
- Removed redefinitions of \tableofcontents, \listoftables, and
  \listoffigures because they already call \clearpage or
  \cleardoublepage by default.
- Removed "\setcounter{tocdepth}{2}" from the page layout section (moved
  to `ut-thesis.tex' where it belongs).
- Added \ignore command to comment out parts of a file.
- Put version macros at the top of the file.
- Changed order of revision comments.

v1.4: 1998/11/05 (Francois Pitt)
- Fixed `abstract' environment so that it is really put on a separate
  page, and changed "\newpage\endgroup" at the end to
  "\par\endgroup\newpage", which is more logical.
- Changed `acknowledgements' environment so that it is *not* put on a
  separate page, allowing users to add other text on that page (e.g.,
  `dedication' described next).
- Added `dedication' environment based on `acknowledgements'
  (suggested by Robert Bernecky 98/11/04).
- Changed page layout so that it is defined in terms of the physical
  page size instead of being hard-coded for letter paper (8.5" x 11").

v1.3: 1998/11/01 (Francois Pitt)
- Fixed `thebibliography' so page headers are generated in the same
  style as for the rest of the thesis.
- Swapped \endgroup and \newpage in definition of `abstract' and
  `acknowledgements' environments, to fix problem with adjusted line
  spacing in `abstract'.
- Renamed `\currentsize' to `\currenttextsize'.
- Added \cleardoublepage at the end of preliminary sections, so that
  page 1 of main text is on right-hand side.

v1.2: 1998/10/20 (Francois Pitt)
- Changed `spacenotes' option to `spacednotes' to have more consistently
  named options.
- Fixed spacing between main text and footnotes.
- Fixed `singlespaced' environment, which didn't seem to work at all
  (reported by Nedialko Nedialkov 98/10/12): Actually, created a
  `newspacing' environment, which takes a parameter, and based
  `singlespaced', `oneandahalfspaced', and `doublespaced' environments
  on `newspacing'.

v1.1: 1998/10/01 (Francois Pitt)
- Fixed bug that caused footnotes to make following tables single-spaced
  (reported by Philip Edmonds 98/09/30).
- Made spacing of marginal notes and footnotes the same.
- Added option to control line spacing of notes.
- Added options to control the size of margins.
- Changed names of temporary macros used in redefinitions to avoid
  conflicts with existing names.

v1.0: 1998/09/29 (Francois Pitt)
- Initial version.
