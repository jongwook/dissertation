%---------------------------------------------------------------------------
% NYU steinhardt PhD dissertation version 1.1 style file by Oriol Nieto 2014
% Version 1.0 style file by Taemin Cho 2012
% PhDthesis version 2 style file by Jakob Suckale, 2007
% based on CUEDthesis version 1 by Harish Bhanderi 2002
%---------------------------------------------------------------------------

%-------------------------- identification ---------------------
\ProvidesClass{marl}[2017/11/11 MARL PhD dissertation class]

%:-------------------------- book -----------------------

\newif\if@nyustyle
\DeclareOption{nyustyle}{\@nyustyletrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[pdftex]{book}

%:-------------------------- packages for fancy things -----------------------
\usepackage{afterpage}
\usepackage{pdflscape}
\usepackage{setspace}
\usepackage{verbatim} % for commenting
\usepackage{subcaption} % replaces subfigure/subfig

%\usepackage{times} % set font to times

\usepackage{epsf} 
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{bm}
\usepackage{graphics} % for improved inclusion of graphics

%\usepackage{wrapfig} % to include figure with text wrapping around it
%\usepackage[margin=10pt,font=small,labelfont=bf]{caption} % for improved layout of figure captions with extra margin, smaller font than text

\usepackage{fancyhdr} % for better header layout
\usepackage{eucal}
\usepackage[usenames, dvipsnames]{color}
\usepackage[perpage]{footmisc}
\usepackage{ifthen}
\usepackage[algo2e]{algorithm2e} 
\usepackage{booktabs}
\usepackage{tabularx}
\usepackage{arydshln}
\usepackage{multicol} % for pages with multiple text columns, e.g. References
\usepackage{multirow}
\usepackage{hhline}
\usepackage{textcomp}
\usepackage{ wasysym }
\usepackage{mathbbol}

\usepackage[none]{hyphenat}
%\flushbottom
\setlength{\parskip}{0pt plus 6pt}
\setlength{\baselineskip}{12pt plus 1pt minus 0.5pt}

\DeclareMathSymbol{\shortminus}{\mathbin}{AMSa}{"39}
\renewcommand{\doublespacing}{\setstretch{1.8}}
%\newcommand{\mathbbm}[1]{\text{\usefont{U}{bbm}{m}{n}#1}}

\newcommand{\E}{\mathbb{E}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\x}{\mathbf{x}}
\newcommand{\y}{\mathbf{y}}
\newcommand{\z}{\mathbf{z}}
\newcommand{\X}{\mathbf{X}}
\newcommand{\Y}{\mathbf{Y}}


\newenvironment{dedication}
{\clearpage           % we want a new page
  \thispagestyle{empty}% no header and footer
  \vspace*{\stretch{1}}% some space at the top 
  \itshape             % the text is in italics
  \raggedleft          % flush to the right margin
}
{\par % end the paragraph
  \vspace{\stretch{3}} % space at bottom is three times that at the top
  \clearpage           % finish off the page
}

% for improved layout of figure captions with extra margin, smaller font than text
\usepackage[margin=10pt,font=small,labelfont=md]{caption}
\DeclareCaptionLabelSeparator{newline2}{\\[5pt]}
\captionsetup[table]{
  justification=raggedright,
  labelsep = newline2,
  skip = 6pt,
  position = above,
  singlelinecheck=off}
\captionsetup[subtable]{
  skip = 3pt,
  labelformat = simple,
  singlelinecheck=on,
  position = above
}
\captionsetup[figure]{position = bottom, skip = 15pt}

%\setlength{\columnsep}{20pt} % space between columns; default 10pt quite narrow
\usepackage[nottoc]{tocbibind} % correct page numbers for bib in TOC, nottoc suppresses an entry for TOC itself
\usepackage{textcase}
\usepackage{datetime}
\usepackage{prettyref}
\newrefformat{ch}{Chapter~\ref{#1}}
\newrefformat{tab}{Table~\ref{#1}}
\newrefformat{fig}{Figure~\ref{#1}}
\newrefformat{subtab}{Table~\ref{#1}}
\newrefformat{adx}{Appendix~\ref{#1}}
\newrefformat{eq}{Equation~\textup{(\ref{#1})}}
\newcommand{\prettyrefp}[1]{\prettyref{#1} on page~\pageref{#1}}

\usepackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{equation}{chapter}
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\thefigure}{\arabic{figure}}

%:-------------------------- PDF/PS setup -----------------------

\usepackage[ xetex,
             plainpages = false, pdfpagelabels,
             %ocgcolorlinks,
             pdfpagelayout = useoutlines,
             bookmarks,
             bookmarksopen = true,
             bookmarksnumbered = true,
             breaklinks = true,
             linktoc = all,
             pagebackref,
             colorlinks = true,
             allcolors = black,
             % linkcolor = red,
             % urlcolor  = BlueViolet,
             citecolor = RoyalBlue,
             % anchorcolor = Purple,
             hyperindex = true,
             hyperfootnotes=false,
             hyperfigures
             ]{hyperref}

\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{\color{RoyalBlue}{%
		\ifcase #1 Not cited.%
		\or #2.%
		\else #2.%
		\fi%
	}}

\DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf, .gif} %GIF doesn't work??
\usepackage[xetex]{graphicx}
% \pdfcompresslevel=9

\graphicspath{{figures/}}

\usepackage[xindy]{imakeidx}
\usepackage{makeidx}
\usepackage{xpatch}

\usepackage[nosectionbib]{apacite}
\bibliographystyle{marl}
\let\cite\shortcite
%\usepackage[
%	style=authoryear,
%	dashed=false,
%	backend=bibtex,
%	url=false,
%	doi=false,
%	eprint=false,
%	uniquename=false,
%	uniquelist=false,
%	hyperref=true,
%	backref=true,
%	mincitenames=1,
%	maxcitenames=2,
%	maxbibnames=1000
%]{biblatex}

\xpatchnameformat{labelname}{\ifciteseen}{\ifnumcomp{\value{listtotal}}{>}{\value{maxnames}}}{}{}
\setlength\bibitemsep{2\itemsep}

%\DeclareFieldFormat{apacase}{#1}
%\DeclareSourcemap{
%	\maps[datatype=bibtex]{
%		\map{
%			\step[fieldset=abstract, null]
%			\step[fieldset=month, null]
%			\step[fieldset=ISBN, null]
%			\step[fieldset=url, null]
%			\step[fieldset=institution, null]
%		}
%	}
%}
%\DeclareCiteCommand{\cite}[\mkbibparens]
%{\usebibmacro{prenote}}
%{\usebibmacro{citeindex}%
%	\printtext[bibhyperref]{\usebibmacro{cite}}}
%{\multicitedelim}
%{\usebibmacro{postnote}}

%\DeclareCiteCommand*{\cite}[\mkbibparens]
%{\usebibmacro{prenote}}
%{\usebibmacro{citeindex}%
%	\printtext[bibhyperref]{\usebibmacro{citeyear}}}
%{\multicitedelim}
%{\usebibmacro{postnote}}

%\DeclareCiteCommand{\parencite}[\mkbibparens]
%{\usebibmacro{prenote}}
%{\usebibmacro{citeindex}%
%	\printtext[bibhyperref]{\usebibmacro{cite}}}
%{\multicitedelim}
%{\usebibmacro{postnote}}

%\DeclareCiteCommand*{\parencite}[\mkbibparens]
%{\usebibmacro{prenote}}
%{\usebibmacro{citeindex}%
%	\printtext[bibhyperref]{\usebibmacro{citeyear}}}
%{\multicitedelim}
%{\usebibmacro{postnote}}

%\DeclareCiteCommand{\footcite}[\mkbibfootnote]
%{\usebibmacro{prenote}}
%{\usebibmacro{citeindex}%
%	\printtext[bibhyperref]{ \usebibmacro{cite}}}
%{\multicitedelim}
%{\usebibmacro{postnote}}

%\DeclareCiteCommand{\footcitetext}[\mkbibfootnotetext]
%{\usebibmacro{prenote}}
%{\usebibmacro{citeindex}%
%	\printtext[bibhyperref]{\usebibmacro{cite}}}
%{\multicitedelim}
%{\usebibmacro{postnote}}

%\DeclareCiteCommand{\textcite}
%{\boolfalse{cbx:parens}}
%{\usebibmacro{citeindex}%
%	\printtext[bibhyperref]{\usebibmacro{textcite}}}
%{\ifbool{cbx:parens}
%	{\bibcloseparen\global\boolfalse{cbx:parens}}
%	{}%
%	\multicitedelim}
%{\usebibmacro{textcite:postnote}}

%:-------------------------- Glossary/Abbrev./Symbols -----------------------
\usepackage[nomain,xindy, toc, acronym]{glossaries}
\renewcommand*{\glstextformat}[1]{\textcolor{black}{#1}}
\renewcommand{\glsnamefont}[1]{\mdseries #1 :}% $cdots$}
\renewcommand*{\glsgroupskip}{}
\makeglossaries
%:-------------------- clear double page -----------------------
% uses empty pagestyle for blank pages

\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}

\let\cleardoublepage\clearemptydoublepage

%:-------------------------- Table Of Contents  -----------------------
\usepackage{etoolbox}
\usepackage{xpatch}
\usepackage[titles]{tocloft}
\AtBeginDocument{%
  \renewcommand\contentsname{TABLE OF CONTENTS}
  \renewcommand\listtablename{LIST OF TABLES}
  \renewcommand\listfigurename{LIST OF FIGURES}
}
\renewcommand{\cftchappresnum}{\hspace{1em}}

\setlength{\cftbeforechapskip}{1em}
\setlength{\cftbeforepartskip}{1em}

\renewcommand{\cftpartfont}{\normalfont\normalsize}
\renewcommand{\cftchapfont}{\normalfont\normalsize}

\renewcommand{\cftchappagefont}{\normalfont}

\renewcommand{\cftchapleader}{\hfill}
\renewcommand{\cftsecleader}{\hfill}
\renewcommand{\cftsubsecleader}{\hfill}

\renewcommand{\cftfigleader}{\hfill}
\renewcommand{\cfttableader}{\hfill}
\setlength\cftbeforefigskip{\cftbeforechapskip}
\setlength\cftbeforetabskip{\cftbeforechapskip}

%\renewcommand{\@pnumwidth}{3em} \renewcommand{\@tocrmarg}{4em}

\newcommand{\chapterbegin}{\cftaddtitleline{toc}{part}{CHAPTER}{}}
\newcommand{\appendixbegin}{
	\cftaddtitleline{toc}{part}{APPENDICES}{}
	\titleformat{\chapter}[display]
	{\normalfont\normalsize}
	{\singlespacing\MakeUppercase
		\chaptertitlename~ \Alph{chapter}}{0em}
	{\singlespacing\normalsize\MakeUppercase}
}

\let\originall@chapter\l@chapter
\def\l@chapter#1#2{\originall@chapter{{\uppercase{#1}}}{#2}}

% Spaces for the TOC
\cftsetindents{chapter}{0em}{4em}
\cftsetindents{section}{2.5em}{2em}
\cftsetindents{subsection}{4em}{3em}
\cftsetindents{subsubsection}{6em}{4em}
\cftsetindents{figure}{0em}{3.5em}
\cftsetindents{table}{0em}{3.5em}

\AtBeginDocument{%
  \preto\section{\addtocontents{toc}{\vskip 0.4em}}
%  \preto\subsection{\addtocontents{toc}{\vskip 0.2em}}
}

%:-------------------------- Heading Formats -----------------------

\usepackage{fontspec}
\usepackage{titlesec}
\usepackage{sectsty}
\usepackage[normalem]{ulem}
\usepackage{blindtext}

\setmainfont{SourceSerifPro}[
Path=fonts/,
UprightFont=*-Regular.otf,
BoldFont=*-Semibold.otf,
ItalicFont=NotAtAllOfficialIt.ttf,
BoldItalicFont=Heuristica-BoldItalic.otf
]

\setsansfont{SourceSansPro}[
Path=fonts/ ,
Extension=.otf ,
UprightFont=*-Regular ,
BoldFont=*-Bold ,
ItalicFont=*-It ,
BoldItalicFont=*-BoldIt
]

\setmonofont{SourceCodePro}[
Path=fonts/ ,
Extension=.otf ,
UprightFont=*-Regular ,
BoldFont=*-Bold ,
ItalicFont=*-It ,
BoldItalicFont=*-BoldIt
]

\sectionfont{\bfseries\normalsize}
\subsectionfont{\normalfont\normalsize}
\subsubsectionfont{\normalfont\normalsize}

\renewcommand\cftsecaftersnum{.} 
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}

% Uncomment the following lines to *always* ignore section numbers (ignoring secnumdepth in the main tex)
%\renewcommand{\thesection}{\hspace{-0.45cm}}
%\renewcommand{\thesubsection}{}
%\renewcommand{\thesubsubsection}{\hspace{-0.45cm}}
     
% Chapter display following NYU's ugly guidelines
\renewcommand{\thechapter}{\Roman{chapter}}
\titleformat{\chapter}[display]
{\bfseries\normalsize\centering}
{\singlespacing\MakeUppercase
  \chaptertitlename~\Roman{chapter}}{0em}
{\singlespacing\normalsize\MakeUppercase}

% Section and subsection displays using NYU guidelines
%\titleformat{\section}{\normalsize}{\thesection}{0pt}{\underline}
%\titleformat{\subsection}{\centering\normalsize}{\thesubsection}{0pt}{\underline}
%\titleformat{\subsubsection}{\normalsize}{\thesubsubsection}{0pt}{}
%\titleformat{\subsubsubsection}{\normalsize\centering}{\thesubsubsubsection}{0pt}{}

% Margin
\titlespacing{\chapter}{0pt}{2em}{3em}
\titlespacing{\section}{0pt}{2.5em}{0.5em}
\titlespacing{\subsection}{0pt}{2.5em}{0.5em}
\titlespacing{\subsubsection}{0pt}{2.5em}{0.5em}
\titlespacing{\subsubsubsection}{0pt}{2.5em}{0.5em}

%:-------------------------- math -----------------------

% Uri: All of this is included in the non-deprecated subcaption package. 
% Stop using subfig or subfigure, this is 2014 for the love of the Flying Spaghetti Monster.
%\usepackage{subfig}
%\DeclareCaptionListOfFormat{parenssep}{#1\,(#2)}
%%\caption@setsubrefformat{parenssep}
%\caption@setlistofformat{parenssep}
%\captionsetup[subfigure]{listofformat=parenssep}
%\newrefformat{subfig}{Figure \subref{#1}}

\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}

% Strut macros for skipping spaces above and below text in tables.
\def\abovestrut#1{\rule[0in]{0in}{#1}\ignorespaces}
\def\belowstrut#1{\rule[-#1]{0in}{#1}\ignorespaces}

\def\abovespace{\abovestrut{0.20in}}
\def\aroundspace{\abovestrut{0.20in}\belowstrut{0.10in}}
\def\belowspace{\belowstrut{0.10in}}

\renewcommand{\arraystretch}{1.5}
%:-------------------------- page layout -----------------------

% %letter settings
% \ifpdf
%    \pdfpageheight=11in
%    \pdfpagewidth=8.5in
% \else
%    \setlength{\paperheight}{11in}
%    \setlength{\paperwidth}{8.5in}
% \fi

\setlength{\hoffset}{0.00in}
\setlength{\voffset}{0.00in}

\if@twoside
\setlength{\oddsidemargin}{0.7in}
\setlength{\evensidemargin}{0.3in}
\else
\setlength{\oddsidemargin}{0.5in}
\setlength{\evensidemargin}{0.5in}
\fi

\setlength{\topmargin}{-0.3in}
\setlength{\headheight}{0.3in}
\setlength{\headsep}{0.25in}
\setlength{\textheight}{8.5in}
\setlength{\textwidth}{5.5in}
\setlength{\marginparsep}{0in}
\setlength{\marginparwidth}{0in}
\setlength{\footskip}{0.5in}
\setlength{\skip\footins}{1.5em}


%---------- indent settings ----------

%\usepackage{indentfirst}
\setlength{\parindent}{0.4in}
\setlength{\footnotesep}{0.18in}
\setlength{\footnotemargin}{0.3em}
\renewcommand{\footnotelayout}{\hspace{0.1em}}
%: section below defines fancy page layout options
% ------------------------------
\pagestyle{plain}
\fancyfoot[C]{\thepage}
    \fancypagestyle{first}{
      \fancyhead{}
      \renewcommand{\headrulewidth}{0pt}
    }
    
      \fancypagestyle{toc}{
      \fancyhf{}
      \fancyfoot[C]{\thepage}
      \renewcommand{\headrulewidth}{0pt}
    }




%:-------------------------- title page layout -----------------------

% starts roman page numbering until chapter 1
% important to avoid two pages numbered 1 and 2 which may cause bad links
% bug: cover i + back side ii and then numbering restarts with i; should be iii

\renewcommand{\thepage}{\roman{page}}

\newcommand{\submittedtext}{{A thesis submitted for the degree of}}

% DECLARATIONS
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your Program
\def\program#1{\gdef\@program{#1}}
% The name of your Department
\def\department#1{\gdef\@department{#1}}
% The name of your University
\def\university#1{\gdef\@university{#1}}

\def\submittedtext#1{\gdef\@submittedtext{#1}}
% Defining the crest
\def\crest#1{\gdef\@crest{#1}}

\def\proposaltitle#1{
  \gdef\@uppercasetitle{A Proposal for\\ \uppercase{#1}}
  \gdef\@title{A Proposal for\\ #1}
}

\def\abstracttitle#1{
  \gdef\@uppercasetitle{An Abstract of\\ \uppercase{#1}}
  \gdef\@title{A Proposal for\\ #1}
}

\def\title#1{
  \gdef\@uppercasetitle{\uppercase{#1}}
  \gdef\@title{#1}
}

% Defining the crest
\def\threecommittee#1#2#3{
  \gdef\@committee{
%    \singlespacing
    \setstretch{0.6}
  \begin{tabular}{@{}ll@{}}
    Sponsoring Committee: &   #1\\
    &#2\\
    &#3
  \end{tabular}
  }
}

\def\fourcommittee#1#2#3#4{
  \gdef\@committee{
  \begin{tabular}{@{}ll@{}}
    \setstretch{0.8}
    Sponsoring Committee: &   #1\\
    &#2\\
    &#3\\
    &#4
  \end{tabular}
  }
}

\def\fivecommittee#1#2#3#4#5{
  \gdef\@committee{
  \begin{tabular}{@{}ll@{}}
    \setstretch{0.8}
    Sponsoring Committee: &   #1\\
    &#2\\
    &#3\\
    &#4\\
    &#5
  \end{tabular}
  }
}


% Stating the city of birth for title page where needed; uncommented for use
%\def\cityofbirth#1{\gdef\@cityofbirth{#1}}

% These macros define an environment for front matter that is always
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
  \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
  \else\newpage\fi}
{\if@restonecol\twocolumn\else\newpage\fi}

%define title page layout

\renewcommand{\maketitle}{%
  \thispagestyle{empty}
  \begin{alwayssingle}
    \renewcommand{\@evenhead}{}%
    \renewcommand{\@oddfoot}{}%
    \renewcommand{\@evenfoot}{}%
    \begin{center}
      {\@committee \par}
      \null\vfill
      {\@uppercasetitle\par}
      \null
      \vspace{3em}
      {\@author\par}
      \vspace*{1em}
      {
        \@program \par
        \@department \par
      }%end large
      \null\vfill
      \vspace*{3em}
      {\@submittedtext \par}
      { \@university \par}
%          \vspace*{10pt}
      { {\@degreedate}}
    \end{center}
  \end{alwayssingle}
}

% page number for cover back side should have page number blanked

\newcommand{\makecopyright}{%
  \thispagestyle{empty}
  \null\vfill
  \begin{center}
    Copyright \textcopyright \, \@degreedate \, \@author
  \end{center}
  \null\vfill
}

%:-------------------------- front matter layout -----------------------

% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{
  \chapter{Acknowledgements}
  % \begin{quote}
}
{
  % \end{quote}
}

% EPIGRAPH
%

\newenvironment{epigraph}
{
  % \begin{quote}
}
{
  % \end{quote}
}

%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{abstract}
{
  %\chapter{Abstract}
  % \begin{quote}
}
{
  % \end{quote}
}



%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractslong} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm} \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \pagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \LARGE {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}

%Statement of originality if required

\newenvironment{declaration} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Declaration}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%--------------------------- other things ---------------------------------

\definecolor{RED}{rgb}{1,0,0}
\newcommand\TODO[1]{ \textcolor{red}{[TODO: #1]} }
\newcommand\citesomething{ \textsuperscript{\textcolor{blue}{(citation needed)}} }

%:-------------------------- page numbers: roman+arabic -----------------------

% ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}
\usepackage{rotating}
