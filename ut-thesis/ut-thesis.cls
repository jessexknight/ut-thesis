%%
%% This is file `ut-thesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ut-thesis.dtx  (with options: `class')
%% 
%% The |ut-thesis| document class and template implements
%% the requirements of the University of Toronto School of Graduate Studies (SGS),
%% as of Winter 2020.
%% 
%% Copyright (c) 1998-2013 Francois Pitt <fpitt@cs.utoronto.ca>,
%%               2020-2020 Jesse Knight <jesse.knight@mail.utoronto.ca>
%% last updated at 17:00 (EST) on Wed 26 Aug 2020
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
%% Jesse Knight <jesse.knight@mail.utoronto.ca>.
%% 
%% This work consists of the files:
%% - README
%% - ut-thesis.dtx
%% - ut-thesis.ins
%% - ut-thesis.pdf (derived user manual)
%% - ut-thesis.cls (derived class file)
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ut-thesis}
[2020/09/01 v3.0.a University of Toronto thesis class]

%% Switch for testing draft mode (toggled by |draft| option).
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

%% Save original definition of |\cleardoublepage|.
\let\clearstandarddoublepage\cleardoublepage

%% The |\singlespacing| macro from |setspace| includes some vertical space
%% (to make it easier to change line spacing within the document).
%% Unfortunately, this has undesirable side-effects within macros, so we
%% define our own replacement here for use within the class.
\newcommand*{\singlespacingnoskip}{\setstretch{\setspace@singlespace}}


%% |draft| option: change default document settings.
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
   \PassOptionsToClass{draft,twoside,openany}{book}}

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

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{letterpaper} % from book
\ExecuteOptions{center,onehalfspacing,chapterhead} % from ut-thesis
\ProcessOptions
\LoadClass{book}
\RequirePackage{calc}
\RequirePackage{geometry}
\RequirePackage{setspace}
\renewcommand*{\author}  [1]{\gdef\@author{#1}}
\renewcommand*{\title}   [1]{\gdef\@title{#1}}
\newcommand*{\degree}    [1]{\gdef\@degree{#1}}
\newcommand*{\department}[1]{\gdef\@department{#1}}
\newcommand*{\gradyear}  [1]{\gdef\@gradyear{#1}}
\author    {(author)}
\title     {(title)}
\degree    {(degree)}
\department{(department)}
\gradyear  {(gradyear)}
\renewcommand*{\maketitle}%
  {\thispagestyle{empty}
   \large
   \begin{center}
      \singlespacing
      \null
      \vfill
      \textsc{\@title}
      \vfill
      by
      \vfill
      {\@author}
      \vfill
      \vfill
      A thesis submitted in conformity with the requirements\\
      for the degree of {\@degree}\\[1ex]
      Graduate Department of {\@department}\\
      University of Toronto\\
      \vfill
      {\copyright} Copyright {\@gradyear} by {\@author}
   \end{center}
   \cleardoublepage}
\newenvironment*{abstract}%
  {\thispagestyle{plain}
   \begin{center}
     \singlespacing
      {\@title}\\[2ex]
      {\@author}\\
      {\@degree}\\[1ex]
      Graduate Department of {\@department}\\
      University of Toronto\\
      {\@gradyear}\\
      \section*{Abstract}
   \end{center}
   \begingroup
   \doublespacing}%
  {\endgroup\cleardoublepage}

%% |\begin{dedication}...\end{dedication}| formats a dedication section
%% (*not* on a separate page -- just a paragraph formatted flush right).
\newenvironment*{dedication}%
  {\begin{flushright}}%
  {\end{flushright}}

%% |\begin{acknowledgements}...\end{acknowledgements}| formats an
%% acknowledgements section (*not* on a separate page).
\newenvironment*{acknowledgements}%
  {\begin{center}
      \section*{Acknowledgements}
   \end{center}
   \begingroup\noindent}%
  {\par\endgroup}

%% Redefine |\thebibliography| environment so that it generates headers
%% in the same style as the rest of the document.
\let\@thesisthebibliography\thebibliography
\renewcommand*{\thebibliography}[1]{\@thesisthebibliography{#1}
   \if@thesispagestyle\@mkboth{\textsc{\bibname}}{\textsc{\bibname}}\fi}

%% Variations of |\cleardoublepage| that explicitly set the pagestyle of
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


%% Redefine all four standard page styles (empty, plain, headings,
%% myheadings), based on the definitions in |book|, so that they
%% conform to the SGS guidelines (and include draft information if
%% applicable).  Then, define a new pagestyle |thesis|.

%% TODO: Get rid of copy-pasted definitions for pagestyles?

%% Pagestyle |empty|.
\renewcommand*{\ps@empty}%
  {\@thesispagestylefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\hfil
      {\slshape\small\today}\hfil\trDRAFT\fi}%
   \let\@evenhead\@oddhead}

%% Pagestyle |plain|.
\renewcommand*{\ps@plain}%
  {\@thesispagestylefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\fi\hfil
      \thepage\hfil\if@draft\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\hfil
      {\slshape\small\today}\hfil\trDRAFT\fi}%
   \let\@evenhead\@oddhead}

%% Pagestyle |headings|.
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

%% Pagestyle |myheadings|.
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

%% Pagestyle |thesis| (based on |headings|).
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
\endinput
%%
%% End of file `ut-thesis.cls'.
