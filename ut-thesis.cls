%% ut-thesis.cls -- document class for graduate theses at UofT
%%
%% Copyright (c) 1998-2012 Francois Pitt <fpitt@cs.utoronto.ca>
%% last updated at 09:43 (EDT) on Fri  1 Jun 2012
%%
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3c of this license
%% or (at your option) any later version.
%% The latest version of this license is in
%%     http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
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
%% the School of Graduate Studies (SGS) at the University of Toronto:
%% single-sided, "normal" margins (see below), one-and-a-half spaced
%% with single-spaced notes.
%%
%% OPTIONS:
%%
%%  - Any standard option for the LaTeX2e `report' class, including
%%    `10pt', `11pt', `12pt', `oneside', `twoside', etc.
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
%%    If you have more than just a few marginal notes, it is recommended
%%    that you use at least `wide' margins.  For other settings, use the
%%    \geometry command (see the template for details).
%%
%%  - `singlespaced', `oneandahalfspaced', or `doublespaced':  Set the
%%    entire document's default line spacing (except for notes, which
%%    are single-spaced by default).  For other settings, use the
%%    \setstretch command (see the template for details).
%%
%%  - `singlespacednotes' or `standardspacednotes':  Set line spacing
%%    for footnotes and marginal notes: either single-spaced or the same
%%    as the rest of the document.
%%
%%  - `cleardoublepagestyleempty', `cleardoublepagestyleplain', or
%%    `cleardoublepagestylestandard':  Set the page style for all
%%    "cleared" pages (empty pages inserted in two-sided documents to
%%    put the next page on the right-hand side) to either `empty',
%%    `plain', or whatever style is in effect when the page is cleared
%%    (the default).
%%
%%  - `draft':  Produce a draft copy (double-sided, double-spaced,
%%    normal margins, with the word "DRAFT" printed at all four corners
%%    of every page).
%%
%% Note that these options can be used to override the default or draft
%% document settings, so that it is possible, for example, to create a
%% double-sided final copy, or a 1 1/2-spaced draft copy with wide
%% margins, etc.  You may use standard LaTeX packages to tailor the
%% layout and formatting in other ways.
%% Also note that when producing double-sided documents while _not_ in
%% draft mode, new chapters and preliminary sections will always start
%% on a right-hand page under the default settings (inserting a blank
%% page if needed).  This can be overridden by using the `openany' or
%% `openright' options.  To achieve this effect for individual sections
%% or chapters, use \cleardoublepage -- or one of the more specific
%% \clearemptydoublepage, \clearplaindoublepage, \clearthesisdoublepage,
%% or \clearstandarddoublepage (see below for details).
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
%%  - \clearemptydoublepage, \clearplaindoublepage,
%%    \clearthesisdoublepage:
%%    Same as \cleardoublepage except that cleared pages have style
%%    `empty', `plain', or `thesis' respectively.
%%
%%  - \clearstandarddoublepage:
%%    Same as the original \cleardoublepage (cleared pages use the style
%%    currently in effect) -- used to override the effects of options
%%    `cleardoublepagestyleempty' or `cleardoublepagestyleplain'.
%%
%% The companion file `ut-thesis.tex' contains a skeleton illustrating
%% the use of this class.


%%%%%%%%%%%%        IDENTIFICATION        %%%%%%%%%%%%

\newcommand*{\utthesisversion}{v2.0} % current version number
\newcommand*{\utthesisupdated}{2012/06/01} % date of last change(s)

\NeedsTeXFormat{LaTeX2e}[1995/12/01] % robust macros with * form
\ProvidesClass{ut-thesis}[\utthesisupdated\space\utthesisversion\space
   graduate theses at the University of Toronto]


%%%%%%%%%%%%         INITIAL CODE         %%%%%%%%%%%%

%% Switch for testing draft mode (toggled by `draft' option).
\newif\if@draft
\@draftfalse

%% Switch for testing current page style.
\newif\if@thesispagestyle
\@thesispagestyletrue

%% Save original definitions of footnote and marginal note macros and
%% lengths, to be able to reset them below as needed (when changing
%% between single-spaced and standard-spaced notes).
\let\@thesis@footnotetext\@footnotetext
\let\@thesis@mpfootnotetext\@mpfootnotetext
\let\@thesis@marginparreset\@marginparreset
\newlength{\@thesisfootnotesep}
\newlength{\@thesismarginparpush}
\AtBeginDocument
  {\setlength\@thesisfootnotesep{\footnotesep}
   \setlength\@thesismarginparpush{\marginparpush}}

%% Save original definition of \cleardoublepage.
\let\clearstandarddoublepage\cleardoublepage

%% The \singlespacing macro from `setspace' includes some vertical space
%% (to make it easier to change line spacing within the document).
%% Unfortunately, this has undesirable side-effects within macros, so we
%% define our own replacement here for use within the class.
\newcommand*{\singlespacingnoskip}{\setstretch{\setspace@singlespace}}


%%%%%%%%%%%%      OPTION DECLARATION      %%%%%%%%%%%%

%% `draft' option: change default document settings.
\DeclareOption{draft}{\@drafttrue
   \newcommand*{\tlDRAFT}%
     {\raisebox{ 3ex}[0pt][0pt]{\llap{\sffamily\scriptsize DRAFT\ \ }}}
   \newcommand*{\trDRAFT}%
     {\raisebox{ 3ex}[0pt][0pt]{\rlap{\sffamily\scriptsize \ \ DRAFT}}}
   \newcommand*{\blDRAFT}%
     {\raisebox{-3ex}[0pt][0pt]{\llap{\sffamily\scriptsize DRAFT\ \ }}}
   \newcommand*{\brDRAFT}%
     {\raisebox{-3ex}[0pt][0pt]{\rlap{\sffamily\scriptsize \ \ DRAFT}}}
   \ExecuteOptions{doublespaced}
   \PassOptionsToClass{draft,twoside,openany}{report}}

%% Margin options.
\DeclareOption{narrowmargins}{\AtEndOfClass % 1 1/4" left, 3/4" others
  {\geometry{margin=.75in,left=1.25in,headsep=.375in-\headheight,
             footskip=.375in,marginparwidth=.5in,marginparsep=.125in}}}
\DeclareOption{normalmargins}{\AtEndOfClass % 1 1/4" left, 1" others
  {\geometry{margin=1in,left=1.25in,headsep=.5in-\headheight,
             footskip=.5in,marginparwidth=.75in,marginparsep=.125in}}}
\DeclareOption{widemargins}{\AtEndOfClass % 1 1/4" all around
  {\geometry{margin=1.25in,headsep=.625in-\headheight,
             footskip=.625in,marginparwidth=.75in,marginparsep=.25in}}}
\DeclareOption{extrawidemargins}{\AtEndOfClass % 1 1/2" all around
  {\geometry{margin=1.5in,headsep=.75in-\headheight,
             footskip=.75in,marginparwidth=1in,marginparsep=.25in}}}

%% Line Spacing options.
\DeclareOption{singlespaced}{\AtEndOfClass{\singlespacingnoskip}}
\DeclareOption{onehalfspaced}{\AtEndOfClass{\onehalfspacing}}
\DeclareOption{doublespaced}{\AtEndOfClass{\doublespacing}}

%% Line spacing for notes.
\DeclareOption{singlespacednotes}{\AtBeginDocument
  {\setlength\footnotesep{\@thesisfootnotesep}
   \setlength\marginparpush{\@thesismarginparpush}
   \renewcommand{\@footnotetext}[1]%
     {\@thesis@footnotetext{#1\singlespacingnoskip}}
   \renewcommand{\@mpfootnotetext}[1]%
     {\@thesis@mpfootnotetext{#1\singlespacingnoskip}}
   \renewcommand*{\@marginparreset}%
     {\@thesis@marginparreset\singlespacingnoskip}}}
\DeclareOption{standardspacednotes}{\AtBeginDocument
  {\setlength\footnotesep{\baselineskip-\@thesisfootnotesep}
   \setlength\marginparpush{\baselineskip-\@thesismarginparpush}
   \let\@footnotetext\@thesis@footnotetext
   \let\@mpfootnotetext\@thesis@mpfootnotetext
   \let\@marginparreset\@thesis@marginparreset}}

%% Page styles for cleared pages.
\DeclareOption{cleardoublepagestyleempty}
  {\AtEndOfClass{\let\cleardoublepage\clearemptydoublepage}}
\DeclareOption{cleardoublepagestyleplain}
  {\AtEndOfClass{\let\cleardoublepage\clearplaindoublepage}}
\DeclareOption{cleardoublepagestylestandard}
  {\AtEndOfClass{\let\cleardoublepage\clearstandarddoublepage}}

%% All other options are passed to the base class directly.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}


%%%%%%%%%%%%       OPTION EXECUTION       %%%%%%%%%%%%

%% Default settings: standard options followed by ut-thesis options.
\ExecuteOptions{letterpaper,oneside,openright}
\ExecuteOptions{normalmargins,onehalfspaced,singlespacednotes}

%% Process options.
\ProcessOptions


%%%%%%%%%%%%       PACKAGE  LOADING       %%%%%%%%%%%%

%% Load base class using current setting for basic options.
\LoadClass{report}

%% To set/change page layout.
\RequirePackage{calc}
\RequirePackage{geometry}

%% To set/change line spacing.
\RequirePackage{setspace}


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

%% Default values for the required fields.
\degree{\emph{(degree)}}
\department{\emph{(department)}}
\gradyear{\emph{(year of graduation)}}
\author{\emph{(author)}}
\title{\emph{(title)}}

%%%%%%    New formatting environments and commands.

%% \begin{preliminary} sets the pagestyle and page numbering for the
%% preliminary sections; \end{preliminary} resets the page numbering.
%% The default page style is used outside of the preliminary block.
\newenvironment*{preliminary}%
  {\pagestyle{plain}\pagenumbering{roman}}%
  {\cleardoublepage\pagenumbering{arabic}}

%% Change \maketitle to follow SGS guidelines.
\renewcommand*{\maketitle}%
  {\begin{titlepage}
   \large\singlespacingnoskip
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
   \setcounter{page}{1}
   \end{titlepage}
   \setcounter{page}{2}}

%% Change \begin{abstract}...\end{abstract} to follow SGS guidelines.
\renewenvironment*{abstract}%
  {\begin{center}
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
   \ifdim \baselinestretch pt < 1.6pt \doublespacing\fi}%
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
\let\@thesisthebibliography\thebibliography
\renewcommand*{\thebibliography}[1]{\@thesisthebibliography{#1}
   \if@thesispagestyle\@mkboth{\textsc{\bibname}}{\textsc{\bibname}}\fi}

%% Variations of \cleardoublepage that explicitly set the pagestyle of
%% any inserted blank page.
\newcommand*{\clearemptydoublepage}%
  {{\pagestyle{empty}\clearstandarddoublepage}}
\newcommand*{\clearplaindoublepage}%
  {{\pagestyle{plain}\clearstandarddoublepage}}
\newcommand*{\clearthesisdoublepage}%
  {{\pagestyle{thesis}\clearstandarddoublepage}}

%% Single-spaced quotes and quotations.
\newenvironment*{longquote}%
  {\begin{quote}\singlespacingnoskip}{\end{quote}}
\newenvironment*{longquotation}%
  {\begin{quotation}\singlespacingnoskip}{\end{quotation}}

%%%%%%    Page Styles

%% Redefine all four standard page styles (empty, plain, headings,
%% myheadings), based on the definitions in `report', so that they
%% conform to the SGS guidelines (and include draft information if
%% applicable).  Then, define a new pagestyle `thesis'.

%% TODO: Get rid of copy-pasted definitions for pagestyles?

%% Pagestyle `empty'.
\renewcommand*{\ps@empty}%
  {\@thesispagestylefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\hfil
      {\slshape\small\today}\hfil\trDRAFT\fi}%
   \let\@evenhead\@oddhead}

%% Pagestyle `plain'.
\renewcommand*{\ps@plain}%
  {\@thesispagestylefalse
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
  {\@thesispagestylefalse
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
  {\@thesispagestylefalse
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
  {\@thesispagestylefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\@evenhead{\if@draft\tlDRAFT\fi\thepage\hfil
      {\slshape\leftmark}\if@draft\trDRAFT\fi}%
   \let\chaptermark\@gobble\let\sectionmark\@gobble}

%% Pagestyle `thesis' (based on `headings').
\if@twoside % two-sided printing
\newcommand*{\ps@thesis}%
  {\@thesispagestyletrue
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
\newcommand*{\ps@thesis}%
  {\@thesispagestyletrue
   \let\@mkboth\markboth
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\chaptermark##1{\markright
      {\textsc{\ifnum \c@secnumdepth >\m@ne
         \@chapapp\ \thechapter. \ \fi ##1}}}}
\fi%@twoside

%% Default page style.
\pagestyle{thesis}
