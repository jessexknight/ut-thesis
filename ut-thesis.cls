%% ut-thesis.cls -- document class for formatting theses at UofT
%%
%% Copyright (c) 1998-2012 Francois Pitt <fpitt@cs.utoronto.ca>
%% last updated at 08:00 (EDT) on Fri 25 May 2012
%%
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3 of this license
%% or (at your option) any later version.
%% The latest version of this license is in
%%     http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%%
%% This work has the LPPL maintenance status "maintained".
%%
%% The Current Maintainer of this work is
%% Francois Pitt <fpitt@cs.utoronto.ca>.
%%
%% This work consists of the files listed in the accompanying README.

%% USAGE:  \documentclass{ut-thesis}
%%         \documentclass[...options...]{ut-thesis}
%% 
%% The default settings produce a final copy, ready for submission to
%% SGS (12pt font, single-sided, one-and-a-half-spaced, normal margins,
%% with single-spaced notes).
%% 
%% OPTIONS:
%% 
%%  - Any standard option for the LaTeX2e `report' class, including
%%    `10pt', `11pt', `12pt', `oneside', `twoside', etc.
%% 
%%  - `singlespaced', `oneandahalfspaced', or `doublespaced':  Set the
%%    entire document's default line spacing, except for notes, which
%%    are single-spaced by default.
%% 
%%  - `singlespacednotes' or `regularspacednotes':  Set line spacing for
%%    footnotes and marginal notes: either single-spaced or the same as
%%    the rest of the document (`spacednotes' is a synomym for
%%    `regularspacednotes').
%% 
%%  - `narrowmargins', `normalmargins', `widemargins', or
%%    `extrawidemargins':  Set the size of the margins, as follows:
%%     . `narrow': 1 1/4" on the left, 3/4" on all other sides,
%%       headers & footers 3/8" from body
%%       (these are the minimum values required by SGS);
%%     . `normal': 1 1/4" on the left, 1" on all other sides,
%%       headers & footers 1/2" from body;
%%     . `wide': 1 1/4" on all sides,
%%       headers & footers 5/8" from body;
%%     . `extrawide': 1 1/2" on all sides,
%%       headers & footers 3/4" from body.
%%    (If you have more than just a few marginal notes, it is
%%    recommended that you use at least `wide' margins.)
%% 
%%  - `draft':  Produce a draft copy (10pt font, double-sided,
%%    double-spaced, normal margins, with the word "DRAFT" printed at
%%    all four corners of every page).
%% 
%% Note that these options can be used to override the default or draft
%% document settings, so that it is possible, for example, to create a
%% double-sided final copy, or a 1 1/2-spaced draft copy with wide
%% margins, etc.  Also note that when producing double-sided documents,
%% new chapters and preliminary sections will always start on a
%% right-hand page under the default settings (inserting a blank page if
%% needed), but not if the `draft' option was used.  (This can be
%% overriden by using the `openany' or `openright' options.  To achieve
%% this effect for individual sections or chapters, use the
%% \cleardoublepage command.)  Note that the blank page inserted in
%% these cases will still contain the header and page number that is
%% present on all pages.  For `empty' or `plain' pages, explicitly use
%% one of the commands \clearemptydoublepage or \clearplaindoublepage.
%% 
%% NEW ENVIRONMENTS and COMMANDS:
%% 
%%  * \degree{...}:  (preamble only; REQUIRED)
%%    Specify the name of the degree (e.g., "Doctor of Philosophy").
%% 
%%  * \department{...}:  (preamble only; REQUIRED)
%%    Specify the name of the graduate department.
%% 
%%  * \gradyear{...}:  (preamble only; REQUIRED)
%%    Specify the year of graduation (defaults to current year).
%% 
%%  * \author{...}:  (preamble only; REQUIRED)
%%    Specify the name of the author.
%% 
%%  * \title{...}:  (preamble only; REQUIRED)
%%    Specify the title of the thesis.
%% 
%%  - \linespacing{...}:  (preamble only)
%%    Set the interline spacing directly, overriding document defaults
%%    and options; should be used only if none of the document options
%%    given above are adequate.  Note that in order to get the correct
%%    appearance, the argument to \linespacing must be equal to
%%    approximately 1/3 + 2/3 times the desired line spacing (for
%%    example:
%%       single-spaced = \linespacing{1},
%%        1 1/2-spaced = \linespacing{1.33}, and
%%       double-spaced = \linespacing{1.66}).
%% 
%%  - \clearemptydoublepage, \clearplaindoublepage:
%%    Same as \cleardoublepage except that it sets the pagestyle of any
%%    inserted blank page to `empty' or `plain', respectively.
%% 
%%  - \begin{preliminary}...\end{preliminary}:
%%    Delimit head matter (title page, abstract, table of contents,
%%    lists of tables and figures, etc.): set the page style and
%%    numbering for the preliminary sections and reset them for the main
%%    document.
%% 
%%     - \maketitle:
%%       Generate the title page from the information supplied in the
%%       preamble.
%% 
%%     - \begin{abstract}...\end{abstract}:
%%       Generate the abstract page, double-sided.  (According to SGS
%%       guidelines, this must immediately follow the title page.)
%% 
%%     - \begin{dedication}...\end{dedication}:
%%       Generate a dedication section, if needed.
%% 
%%     - \begin{acknowledgements}...\end{acknowledgements}:
%%       Generate an acknowledgements section, if needed.
%% 
%%    Note that neither the `dedication' nor the `acknowledgements' are
%%    put on a separate page by default (use \newpage to do this
%%    explicitly).  Also note that the table of contents, list of
%%    tables, and list of figures can be generated using the usual LaTeX
%%    commands.
%% 
%%  - \begin{longquote}...\end{longquote}:
%%    Single-spaced version of the `quote' environment.
%% 
%%  - \begin{longquotation}...\end{longquotation}:
%%    Single-spaced version of the `quotation' environment.
%% 
%%  - \begin{singlespaced}...\end{singlespaced}:
%%    Format single-spaced paragraphs.
%% 
%%  - \begin{oneandahalfspaced}...\end{oneandahalfspaced}:
%%    Format 1 1/2-spaced paragraphs.
%% 
%%  - \begin{doublespaced}...\end{doublespaced}:
%%    Format double-spaced paragraphs.
%% 
%%  - \begin{newspacing}{<n>}...\end{newspacing}:
%%    Format paragraphs with an interline spacing of `n' (see the
%%    note for `\linespacing' above regarding the value of `n').
%% 
%% (Note that the last four environments can be used to change the
%% default line spacing of any enclosed text, including figures, tables,
%% abstract or acknowledgement pages, table of contents, etc.)
%% 
%% The companion file `ut-thesis.tex' contains a skeleton illustrating
%% the use of this class.


%%%%%%%%%%%%        IDENTIFICATION        %%%%%%%%%%%%

\newcommand*{\utthesisversion}{v1.9} % current version number
\newcommand*{\utthesisupdated}{2012/05/25} % date of last change(s)

\NeedsTeXFormat{LaTeX2e}[1995/12/01] % robust macros with * form
\ProvidesClass{ut-thesis}[\utthesisupdated\space\utthesisversion\space
   for graduate theses at the University of Toronto]


%%%%%%%%%%%%         INITIAL CODE         %%%%%%%%%%%%

%% Switch for testing draft mode (toggled by `draft' option).
\newif\if@draft
\@draftfalse

%% Switch for testing current page style.
\newif\if@thesispage
\@thesispagetrue

%% Switch for testing line spacing of notes.
\newif\if@singlespacednotes
\@singlespacednotestrue

%% Initial definitions for options below.
\newcommand*{\@marginsize}{1} % 1 = normal margins
\newcommand*{\@thesislnsp}{1.33} % 1.33 = one-and-a-half spaced


%%%%%%%%%%%%      OPTION DECLARATION      %%%%%%%%%%%%

%% `draft' option: change default document settings.
\DeclareOption{draft}
  {%% Macros for printing "DRAFT" at the corners of a page.
   \newcommand*{\tlDRAFT}%
     {\raisebox{ 3ex}[0pt][0pt]{\llap{\sffamily\scriptsize DRAFT\ \ }}}
   \newcommand*{\trDRAFT}%
     {\raisebox{ 3ex}[0pt][0pt]{\rlap{\sffamily\scriptsize \ \ DRAFT}}}
   \newcommand*{\blDRAFT}%
     {\raisebox{-3ex}[0pt][0pt]{\llap{\sffamily\scriptsize DRAFT\ \ }}}
   \newcommand*{\brDRAFT}%
     {\raisebox{-3ex}[0pt][0pt]{\rlap{\sffamily\scriptsize \ \ DRAFT}}}
   \typeout{UT-Thesis Class Option: `draft'}
   \PassOptionsToClass{draft}{report}\@drafttrue}

%% Margin options.
\DeclareOption{narrowmargins}{\renewcommand*{\@marginsize}{0}}
\DeclareOption{normalmargins}{\renewcommand*{\@marginsize}{1}}
\DeclareOption{widemargins}{\renewcommand*{\@marginsize}{2}}
\DeclareOption{extrawidemargins}{\renewcommand*{\@marginsize}{3}}

%% Line Spacing options.
\DeclareOption{singlespaced}{\renewcommand*{\@thesislnsp}{1}}
\DeclareOption{oneandahalfspaced}{\renewcommand*{\@thesislnsp}{1.33}}
\DeclareOption{doublespaced}{\renewcommand*{\@thesislnsp}{1.66}}

%% Line spacing for notes.
\DeclareOption{singlespacednotes}{\@singlespacednotestrue}
\DeclareOption{regularspacednotes}{\@singlespacednotesfalse}
\DeclareOption{spacednotes}{\@singlespacednotesfalse}
 % for backward compatibility

%% All other options are passed to the base class directly.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}


%%%%%%%%%%%%       OPTION EXECUTION       %%%%%%%%%%%%

%% Default settings -- other than the ones above.
\ExecuteOptions{12pt,oneside,openright}

%% Process options.
\ProcessOptions


%%%%%%%%%%%%       PACKAGE  LOADING       %%%%%%%%%%%%

%% Load base class using current setting for basic options.
\LoadClass{report}


%%%%%%%%%%%%          MAIN  CODE          %%%%%%%%%%%%

%%%%%%    Parameters

%% The following five commands set the respective field values so we can
%% generate the title page and abstract page automatically.
\newcommand*{\degree}[1]%
  {\ifx\empty#1\empty\else\gdef\@degree{#1}\fi}
\newcommand*{\department}[1]%
  {\ifx\empty#1\empty\else\gdef\@department{#1}\fi}
\newcommand*{\gradyear}[1]%
  {\ifx\empty#1\empty\else\gdef\@gradyear{#1}\fi}
\renewcommand*{\author}[1]%
  {\ifx\empty#1\empty\else\gdef\@author{#1}\fi}
\renewcommand*{\title}[1]%
  {\ifx\empty#1\empty\else\gdef\@title{#1}\fi}

%%%%%%    New formatting environments and commands.

%% \begin{preliminary} sets the pagestyle and pagenumbering for the
%% preliminary sections; \end{preliminary} resets the pagenumbering.
%% The default page style is used outside of the preliminary block.
\newenvironment*{preliminary}%
  {\pagestyle{plain}\pagenumbering{roman}}%
  {\cleardoublepage\pagenumbering{arabic}}

%% Change \maketitle to follow SGS guidelines.
\renewcommand*{\maketitle}%
  {\begingroup
   \newlinestretch{1}
   \begin{titlepage}
   \begin{large}
   \begin{center}
      \mbox{}
      \vfill
      \textsc{\@title}\\
      \vfill
      by \\
      \vfill
      {\@author}\\
      \vfill
      \vfill
      A thesis submitted in conformity with the requirements\\
      for the degree of {\@degree}\\
      Graduate Department of {\@department}\\
      University of Toronto\\
      \vfill
      {\copyright} Copyright {\@gradyear} by {\@author}\\
      \vspace{.01\textheight}
      \mbox{}
   \end{center}
   \end{large}
   \setcounter{page}{1}
   \end{titlepage}
   \endgroup
   \setcounter{page}{2}}

%% Change \begin{abstract}...\end{abstract} to follow SGS guidelines and
%% put the abstract on a separate page (checking @openright).
\renewenvironment*{abstract}%
  {\if@openright\cleardoublepage\else\clearpage\fi
   \begin{center}
      \section*{Abstract}
   \end{center}
   \begin{center}
      {\@title}\\[2ex]
      {\@author}\\
      {\@degree}\\
      Graduate Department of {\@department}\\
      University of Toronto\\
      {\@gradyear}\\
   \end{center}
   \begingroup
   %% Adjust line spacing: if it was less than 2, increase it to 2;
   %% otherwise, leave it as is.
   \ifdim \baselinestretch pt < 1.66pt \newlinestretch{1.66}\fi}%
  {\par\endgroup\newpage}

%% \begin{dedication}...\end{dedication} formats a dedication section
%% (*not* on a separate page).
\newenvironment*{dedication}%
  {\begin{center}
      \section*{Dedication}
   \end{center}
   \begingroup}%
  {\par\endgroup}

%% \begin{acknowledgements}...\end{acknowledgements} formats an
%% acknowledgements section (*not* on a separate page).
\newenvironment*{acknowledgements}%
  {\begin{center}
      \section*{Acknowledgements}
   \end{center}
   \begingroup}%
  {\par\endgroup}

%% Redefine `thebibliography' environment so that it generates headers
%% in the same style as the rest of the document.
\let\tmp@thebibliography\thebibliography
\renewcommand*{\thebibliography}[1]{\tmp@thebibliography{#1}
   \if@thesispage\@mkboth{\textsc{\bibname}}{\textsc{\bibname}}\fi}

%% Variations of \cleardoublepage that explicitly set the pagestyle of
%% any inserted blank page.
\newcommand*{\clearemptydoublepage}%
  {{\pagestyle{empty}\cleardoublepage}}
\newcommand*{\clearplaindoublepage}%
  {{\pagestyle{plain}\cleardoublepage}}

%%%%%%    Line Spacing

%% Set the line spacing for footnotes and marginal notes.
\if@singlespacednotes
%% footnotes
\let\tmp@@footnotetext\@footnotetext
\renewcommand{\@footnotetext}[1]%
  {{\newlinestretch{1}\tmp@@footnotetext{#1}}}
%% footnotes inside a minipage
\let\tmp@@mpfootnotetext\@mpfootnotetext
\renewcommand{\@mpfootnotetext}[1]%
  {{\newlinestretch{1}\tmp@@mpfootnotetext{#1}}}
%% marginal notes
\let\tmp@@marginparreset\@marginparreset
\renewcommand{\@marginparreset}%
  {\newlinestretch{1}\tmp@@marginparreset}
\fi%@singlespacednotes

%% Change the line spacing.  If the argument is less than 1.33 (for
%% 1.5-spaced) a warning message is displayed when not in draft mode.
\newcommand*{\linespacing}[1]%
  {\newlinestretch{#1}\if@draft\else\ifdim #1pt < 1.33pt\typeout
   {UT-Thesis Class Warning: line spacing less than 1 1/2}\fi\fi}

%% `longquote' and `longquotation' produce single-spaced quotes, while
%% `newspacing' encloses paragraphs with a different line spacing, such
%% as `singlespaced', `oneandahalfspaced', or `doublespaced'.
\newenvironment*{longquote}%
  {\begin{quote}\newlinestretch{1}}{\end{quote}}
\newenvironment*{longquotation}%
  {\begin{quotation}\newlinestretch{1}}{\end{quotation}}
\newenvironment*{singlespaced}%
  {\begin{newspacing}{1}}{\end{newspacing}}
\newenvironment*{oneandahalfspaced}%
  {\begin{newspacing}{1.33}}{\end{newspacing}}
\newenvironment*{doublespaced}%
  {\begin{newspacing}{1.66}}{\end{newspacing}}
\newenvironment*{newspacing}[1]%
  {\par\begingroup\newlinestretch{#1}}%
  {\par\vskip\parskip\vskip\baselineskip\endgroup
   \vskip-\parskip\vskip-\baselineskip}

%% Change the actual line spacing.
\newcommand*{\newlinestretch}[1]%
  {\renewcommand*{\baselinestretch}{#1}\currenttextsize}

%% Keep track of the current text size -- required for \newlinestretch.
\let\currenttextsize\normalsize
\let\tmp@tiny\tiny
\renewcommand*{\tiny}%
  {\let\currenttextsize\tmp@tiny\tmp@tiny}
\let\tmp@scriptsize\scriptsize
\renewcommand*{\scriptsize}%
  {\let\currenttextsize\tmp@scriptsize\tmp@scriptsize}
\let\tmp@footnotesize\footnotesize
\renewcommand*{\footnotesize}%
  {\let\currenttextsize\tmp@footnotesize\tmp@footnotesize}
\let\tmp@small\small
\renewcommand*{\small}%
  {\let\currenttextsize\tmp@small\tmp@small}
\let\tmp@normalsize\normalsize
\renewcommand*{\normalsize}%
  {\let\currenttextsize\tmp@normalsize\tmp@normalsize}
\let\tmp@large\large
\renewcommand*{\large}%
  {\let\currenttextsize\tmp@large\tmp@large}
\let\tmp@Large\Large
\renewcommand*{\Large}%
  {\let\currenttextsize\tmp@Large\tmp@Large}
\let\tmp@LARGE\LARGE
\renewcommand*{\LARGE}%
  {\let\currenttextsize\tmp@LARGE\tmp@LARGE}
\let\tmp@huge\huge
\renewcommand*{\huge}%
  {\let\currenttextsize\tmp@huge\tmp@huge}
\let\tmp@Huge\Huge
\renewcommand*{\Huge}%
  {\let\currenttextsize\tmp@Huge\tmp@Huge}

%%%%%%    Page Styles

%% Redefine all four standard page styles (empty, plain, headings,
%% myheadings), based on the definitions in `report', so that they
%% conform to the SGS guidelines (and include draft information if
%% applicable).  Then, define a new pagestyle `utthesis'.

%% Pagestyle `empty'.
\renewcommand*{\ps@empty}%
  {\@thesispagefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\hfil
      {\slshape\small\today}\hfil\trDRAFT\fi}%
   \let\@evenhead\@oddhead}

%% Pagestyle `plain'.
\renewcommand*{\ps@plain}%
  {\@thesispagefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\fi\hfil
      \thepage\hfil\if@draft\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\hfil
      {\slshape\small\today}\hfil\trDRAFT\fi}%
   \let\@evenhead\@oddhead}

%% Pagestyle `headings'.
\if@twoside % two-sided printing
\renewcommand*{\ps@headings}%
  {\@thesispagefalse
   \let\@mkboth\markboth
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\@evenhead{\if@draft\tlDRAFT\fi\thepage\hfil
      {\slshape\leftmark}\if@draft\trDRAFT\fi}%
   \def\chaptermark##1{\markboth
      {\MakeUppercase{\ifnum \c@secnumdepth >\m@ne
         \@chapapp\ \thechapter. \ \fi ##1}}{}}%
   \def\sectionmark##1{\markright
      {\MakeUppercase{\ifnum \c@secnumdepth >\z@
         \thesection. \ \fi ##1}}}}
\else % one-sided printing
\renewcommand*{\ps@headings}%
  {\@thesispagefalse
   \let\@mkboth\markboth
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\chaptermark##1{\markright
      {\MakeUppercase{\ifnum \c@secnumdepth >\m@ne
         \@chapapp\ \thechapter. \ \fi ##1}}}}
\fi%@twoside

%% Pagestyle `myheadings'.
\renewcommand*{\ps@myheadings}%
  {\@thesispagefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\@evenhead{\if@draft\tlDRAFT\fi\thepage\hfil
      {\slshape\leftmark}\if@draft\trDRAFT\fi}%
   \let\chaptermark\@gobble\let\sectionmark\@gobble}

%% Pagestyle `utthesis' (based on `headings').
\if@twoside % two-sided printing
\newcommand*{\ps@utthesis}%
  {\@thesispagetrue
   \let\@mkboth\markboth
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\@evenhead{\if@draft\tlDRAFT\fi\thepage\hfil
      {\slshape\leftmark}\if@draft\trDRAFT\fi}%
   \def\chaptermark##1{\markboth
      {\textsc{\ifnum \c@secnumdepth >\m@ne
         \@chapapp\ \thechapter. \ \fi ##1}}{}}%
   \def\sectionmark##1{\markright
      {\textsc{\ifnum \c@secnumdepth >\z@
         \thesection. \ \fi ##1}}}}
\else % one-sided printing
\newcommand*{\ps@utthesis}%
  {\@thesispagetrue
   \let\@mkboth\markboth
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\chaptermark##1{\markright
      {\textsc{\ifnum \c@secnumdepth >\m@ne
         \@chapapp\ \thechapter. \ \fi ##1}}}}
\fi%@twoside

%%%%%%    Document Layout

%% Page layout (see The LaTeX Companion pp.84-86).

%% By default, TeX puts the `reference point' one inch down and to the
%% right of the top-left corner of the page.  This moves it back to the
%% top-left corner (making the rest of the layout easier to define).
\setlength{\voffset}{-1in}
\setlength{\hoffset}{-1in}

%% Instead of hard-coding the page layout for letter paper (8.5" x 11"),
%% we will base it on \paperheight and \paperwidth, so that it works
%% with options that change the paper size.
\setlength{\textheight}{\paperheight}
\setlength{\textwidth}{\paperwidth}

%% Now, set the margin-dependent values.
\ifcase\@marginsize % narrow margins: 1 1/4" left, 3/4" others
\addtolength{\textheight}{-1.5in}
\setlength{\topmargin}{.375in}
\setlength{\headsep}{.375in}
\setlength{\footskip}{.375in}
\addtolength{\textwidth}{-2in}
\setlength{\oddsidemargin}{1.25in}
\setlength{\evensidemargin}{.75in}
\setlength{\marginparwidth}{.5in}
\setlength{\marginparsep}{.125in}
\or % normal margins: 1 1/4" left, 1" others
\addtolength{\textheight}{-2in}
\setlength{\topmargin}{.5in}
\setlength{\headsep}{.5in}
\setlength{\footskip}{.5in}
\addtolength{\textwidth}{-2.25in}
\setlength{\oddsidemargin}{1.25in}
\setlength{\evensidemargin}{1in}
\setlength{\marginparwidth}{.75in}
\setlength{\marginparsep}{.125in}
\or % wide margins: 1 1/4" all around
\addtolength{\textheight}{-2.5in}
\setlength{\topmargin}{.625in}
\setlength{\headsep}{.625in}
\setlength{\footskip}{.625in}
\addtolength{\textwidth}{-2.5in}
\setlength{\oddsidemargin}{1.25in}
\setlength{\evensidemargin}{1.25in}
\setlength{\marginparwidth}{.75in}
\setlength{\marginparsep}{.25in}
\or % extra wide margins: 1 1/2" all around
\addtolength{\textheight}{-3in}
\setlength{\topmargin}{.75in}
\setlength{\headsep}{.75in}
\setlength{\footskip}{.75in}
\addtolength{\textwidth}{-3in}
\setlength{\oddsidemargin}{1.5in}
\setlength{\evensidemargin}{1.5in}
\setlength{\marginparwidth}{1in}
\setlength{\marginparsep}{.25in}
\fi%@marginsize

%% Adjust \headsep to include height of running head.
\addtolength{\headsep}{-\headheight}

%% Adjust the vertical spacing between the main text and the notes, and
%% between successive notes if they are not single-spaced.
\setlength{\skip\footins}{.75\baselineskip}
\if@singlespacednotes\else
\let\oldtextsize\currenttextsize
\footnotesize
\setlength{\marginparpush}{\baselineskip}
\setlength{\footnotesep}{\baselineskip}
\oldtextsize
\fi%@singlespacednotes

%%%%%%    Default values.

%% Default values for the required fields.
\degree{\mbox{}}
\department{\mbox{}}
\gradyear{\number\year}
\author{\mbox{}}
\title{\mbox{}}

%% Default line spacing: use current setting from options.
\linespacing{\@thesislnsp}

%% Default page style.
\pagestyle{utthesis}
