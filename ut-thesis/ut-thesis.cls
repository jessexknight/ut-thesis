%%
%% This is file `ut-thesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ut-thesis.dtx  (with options: `class')
%% 
%% LaTeX2e document class for graduate theses
%% that conform to the formatting requirements of
%% the School of Graduate Studies at the University of Toronto,
%% as of Fall 2020:
%% [https://www.sgs.utoronto.ca/academic-progress/program-completion/formatting]
%% 
%% Copyright (c) 1998-2013 Francois Pitt <fpitt@cs.utoronto.ca>,
%%               2020-2021 Jesse Knight <jesse.knight@mail.utoronto.ca>
%% last updated at 23:30 (EST) on Tue 20 July 2021
%% 
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project Public Licence, either version 1.3c of this licence
%% or (at your option) any later version.
%% The latest version of this licence is in
%%     http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% Note that the output thesis document (e.g. PDF)
%% is not considered a "Compiled Work"
%% and is not covered by the licence.
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
%% To generate ut-thesis.cls (class file), run: pdflatex ut-thesis.ins
%% To generate ut-thesis.pdf (documentation), run: pdflatex ut-thesis.dtx
%% To use the class, make ut-thesis.cls visible to your LaTeX distribution,
%% by placing ut-thesis.cls either in your working directory,
%% or in your texmf tree, perhaps: $texmf/tex/latex/ut-thesis/ut-thesis.cls
%% and the documentation: $texmf/doc/latex/ut-thesis/ut-thesis.pdf
%% 
%% See version history on GitHub:
%% [https://github.com/jessexknight/ut-thesis]
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ut-thesis}
[2021/08/26 v3.1.5 University of Toronto thesis class]
\newif\ifmargins@equal
\newlength{\margin@base}
\newlength{\margin@offset}
\setlength{\margin@offset}{0.5in}
\AtEndOfClass{
  \ifmargins@equal
    \setlength{\leftmargin}{\dimexpr\margin@base+.5\margin@offset}
    \setlength{\rightmargin}{\dimexpr\margin@base+.5\margin@offset}
  \else
    \setlength{\leftmargin}{\dimexpr\margin@base+\margin@offset}
    \setlength{\rightmargin}{\dimexpr\margin@base}
  \fi
  \geometry{
    top      = \margin@base,
    bottom   = \margin@base,
    inner    = \leftmargin,
    outer    = \rightmargin,
    headsep  = \dimexpr0.5\margin@base-\headheight,
    footskip = \dimexpr0.5\margin@base,
    marginparwidth = \dimexpr\rightmargin-0.25in,
    marginparsep   = 0.125in,
}}
\DeclareOption{narrowmargins}   {\setlength{\margin@base}{0.75in}}
\DeclareOption{normalmargins}   {\setlength{\margin@base}{1.00in}}
\DeclareOption{widemargins}     {\setlength{\margin@base}{1.25in}}
\DeclareOption{extrawidemargins}{\setlength{\margin@base}{1.50in}}
\DeclareOption{equalmargins}{\margins@equaltrue}
\DeclareOption{unequalmargins}{\margins@equalfalse}
\DeclareOption{doublespacing}{%
  \AtEndOfClass{\doublespacing}
}
\DeclareOption{onehalfspacing}{%
  \AtEndOfClass{\onehalfspacing}
}
\DeclareOption{singlespacing}{%
  \AtEndOfClass{\singlespacing}
}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{book}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{onehalfspacing,normalmargins,equalmargins,oneside}
\ProcessOptions\relax
\LoadClass{book}
\RequirePackage{geometry} % for margins etc.
\RequirePackage{setspace} % for line spacing
\renewcommand*{\author}  [1]{\gdef\@author{#1}}
\renewcommand*{\title}   [1]{\gdef\@title{#1}}
\newcommand*{\degree}    [1]{\gdef\@degree{#1}}
\newcommand*{\gradyear}  [1]{\gdef\@gradyear{#1}}
\newcommand*{\department}[2][Department of]%
  {\gdef\@deptpre{#1}\gdef\@deptname{#2}}
\author    {(author)}
\title     {(title)}
\degree    {(degree)}
\gradyear  {(gradyear)}
\department{(department)}
\g@addto@macro\frontmatter{\pagenumbering{roman}\pagestyle{plain}}
\g@addto@macro\mainmatter {\pagenumbering{arabic}\pagestyle{headings}}
\renewcommand*{\maketitle}%
  {\thispagestyle{empty}
   \begin{center}
      \large
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
      {\@deptpre} {\@deptname}\\
      University of Toronto\\
      \vfill
      {\copyright} Copyright {\@gradyear} by {\@author}
   \end{center}
   {{\pagestyle{empty}\ocleardoublepage}}
  }
\newenvironment*{abstract}%
  {\thispagestyle{plain}
   \begin{center}
     \singlespacing
      {\@title}\\[2ex]
      {\@author}\\
      {\@degree}\\[1ex]
      {\@deptpre} {\@deptname}\\
      University of Toronto\\
      {\@gradyear}\\
      \section*{Abstract}
   \end{center}
   \begingroup
   \doublespacing}%
  {\par\endgroup\cleardoublepage}
\newenvironment*{dedication}%
  {\thispagestyle{plain}
   \null
   \vfill
   \begin{flushright}}%
  {\end{flushright}
   \vfill
   \vfill
   \clearpage}
\newenvironment*{acknowledgements}%
  {\thispagestyle{plain}
   \begin{center}
   \section*{Acknowledgements}
   \end{center}
   \begingroup}%
  {\endgroup\clearpage}
\let\ocleardoublepage\cleardoublepage
\def\cleardoublepage{{\newpage\pagestyle{plain}\ocleardoublepage}}
\newcommand{\headerstyle}[1]{\footnotesize\MakeUppercase{#1}}
\if@twoside
\renewcommand*{\ps@headings}%
  {\let\@mkboth\markboth
   \let\@oddfoot\@empty
   \let\@evenfoot\@empty
   \def\@oddhead{\headerstyle{\rightmark\hfil\thepage}}%
   \def\@evenhead{\headerstyle{\thepage\hfil\leftmark}}%
   \def\chaptermark##1{\markboth{%
     \if@mainmatter\headerstyle{\@chapapp\ \thechapter.\ ##1}\fi}{}}
   \def\sectionmark##1{\markright{%
     \if@mainmatter\headerstyle{\thesection.\ ##1}\fi}}}
\else
\renewcommand*{\ps@headings}%
  {\let\@mkboth\markboth
   \let\@oddfoot\@empty
   \let\@evenfoot\@empty
   \def\@oddhead{\headerstyle{\rightmark\hfil\thepage}}%
   \def\chaptermark##1{\markright{%
     \if@mainmatter\headerstyle{\@chapapp\ \thechapter.\ ##1}\fi}}}
\fi
\pagestyle{headings}
\setlength\abovecaptionskip{1ex}
\setlength\belowcaptionskip{1ex}
\endinput
%%
%% End of file `ut-thesis.cls'.
