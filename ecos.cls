%
% ---------------------------------------------------------------------------
%   filename:      ecos.cls
%   version:       1.0
%   date:          10-1-2017
%   ported by:     César Torres Cuadra
%   address:       CIRCE
%   e-mail:        ctorresc@unizar.es
%   description:   This is a LaTeX2e style file for the ECOS Congress
%                  proceedings.
%   usage:         \documentclass[options]{ecos}
% ---------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ecos}[2018/05/10 v1.0]
\LoadClass[a4paper,twoside,12pt]{article}
% Base Packages
\RequirePackage[fleqn]{amsmath}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[textheight=247mm,
	textwidth=170mm,
	top=20mm,
	left=20mm,
	nohead,
	footskip=20mm]{geometry}
\RequirePackage[bookmarksopen={true},
	pdffitwindow=true, 
	colorlinks=true, 
	linkcolor=bluecite, 
	citecolor=bluecite, 
	urlcolor=bluecite, 
	hyperfootnotes=false, 
	pdfstartview={FitH},
	pdfpagemode= UseNone]{hyperref}
\RequirePackage[brackets, sort, numbers]{natbib}
\RequirePackage[neverdecrease]{paralist}
\RequirePackage[justification=raggedright,singlelinecheck=false,labelsep=period,labelfont=sl,textfont=sl]{caption}
\RequirePackage{txfonts}
\RequirePackage{mathtools,amssymb,amsfonts,array,appendix,bm,booktabs,cleveref,courier,eurosym,fancyhdr,float,graphicx,ifthen,multirow,tabularx,tabulary,paralist,url,verbatim,subcaption,setspace,textcomp,titlesec,etoolbox,xcolor}
\RequirePackage{usercommands}
%Parameters and lenghts
\pdfcompresslevel=9
\parindent 0pt
\parskip 6pt plus 1pt minus 0pt
\clubpenalty 10000
\widowpenalty 10000
\hfuzz1pt
\tolerance 1000
\predisplaypenalty 100
\overfullrule4pt %For debug purpose
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\topfraction}{0.75}
\renewcommand{\textfraction}{0.15}
\renewcommand{\arraystretch}{1.2}
%Redefine values
\renewcommand\figurename{Fig.}
\renewcommand\tablename{Table}
\renewcommand\appendixname{Appendix}
\renewcommand\refname{References}
\definecolor{bluecite}{HTML}{0f00ff}
%Sections definitions
\setcounter{secnumdepth}{2}
\titleformat{\section}{\normalfont\large\sffamily\bfseries}{\thesection.}{0.5em}{}
\titleformat{\subsection}{\normalfont\normalsize\sffamily\bfseries}{\thesubsection.}{0.5em}{}
\titleformat{\subsubsection}{\normalfont\small\sffamily\bfseries}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}[runin]{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titlespacing*{\section} {0pt}{2ex plus 1ex minus .2ex}{1ex plus .2ex}
\titlespacing*{\subsection} {0pt}{2ex plus 1ex minus .2ex}{1ex plus .2ex}
\titlespacing*{\subsubsection} {0pt}{0.1ex plus 0.1ex minus .1ex}{0.1ex plus .1ex}
\titlespacing*{\paragraph}{0pt}{0.5ex plus 0.5ex minus .2ex}{1em}

%First page header/footer definition
\fancypagestyle{firstpage}{%
 \renewcommand\headrule{}
 \fancyhf{}
 \lfoot{\sffamily\footnotesize Version:\space\@version}
 \rfoot{\sffamily\footnotesize Date:\space\@pubdate}
}
\pagestyle{plain} %Default header/footer	
\setcitestyle{brackets,}
%
%Title Page
%
\def\@address{}
\newcommand{\address}[1]{\gdef\@address{#1}}
\def\@subject{}
\newcommand{\subject}[1]{\gdef\@subject{#1}}
\def\@abstract{}
\renewcommand{\abstract}[1]{\gdef\@abstract{#1}}
\def\@keywords{}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
\def\@version{}
\newcommand{\version}[1]{\gdef\@version{#1}}
\def\@pubdate{}
\renewcommand{\date}[1][\today]{\gdef\@pubdate{#1}}
% Construir el titulo
\renewcommand\maketitle{\par   
	\newpage
	\global\@topnum\z@   % Prevents figures from going at top of page.
	\@maketitle
	\thispagestyle{firstpage}
	\global\let\thanks\relax
	\global\let\maketitle\relax
	\global\let\@maketitle\relax
	\global\let\@thanks\@empty
	\global\let\@author\@empty
	\global\let\@date\@empty
	\global\let\@title\@empty
	\global\let\title\relax
	\global\let\author\relax
	\global\let\date\relax
	\global\let\and\relax
}

\def\@maketitle{%
	\newpage
	\vspace*{6pt}
	\begin{center}
		{\setstretch{1.2}\fontsize{18}{18pt}\selectfont\sffamily\bfseries\@title\par}%%
		\vspace{18pt}%
		{\normalsize \rmfamily\bfseries \itshape \@author\par}
		\vspace{12pt}%
		{\small \rmfamily\itshape \@address\par}
		\vspace{12pt}%  
	\end{center}
	\begingroup
	\leftskip 0.2cm \rightskip 0.2cm
	{\setstretch{1.1}\noindent\footnotesize\sffamily\textbf{Abstract:\space}\@abstract\par}
	\vspace{8pt}  
	{\noindent\footnotesize\sffamily\textbf{Keywords:\space}\@keywords\par}
	\vspace{12pt}
	\endgroup
	\hypersetup{
		pdftitle={\@title},
		pdfsubject={\@subject},
		pdfkeywords={\@keywords},
		pdfauthor={\@author}
	}%
}
%
% Appendix
%%%%% Defines the appendix
\newcommand{\apendix}{%
	\setcounter{section}{0}%
	\gdef\thesection{\@Alph\c@section}%	
	\titleformat {\section} [block] {\raggedright\large\sffamily\bfseries}
	{\appendixname~\thesection.~} {0pt} {}
	\titlespacing {\section} {0pt} {12pt} {6pt}
	\gdef\theHsection{\@Alph\c@section.}% for hyperref
}

% Define Nomenclature
\newcommand{\nomenclature}{%
	\section*{Nomenclature}
	\addcontentsline{toc}{section}{Nomenclature}	
}
\newenvironment{nlist}[2][3em]{%
	\parskip 0pt
	{\normalfont\small\sffamily\bfseries #2}
	\newcommand\entry[2]{\item[##1] ##2}
	\begin{list}{}
		{\renewcommand*{\makelabel}[1]{\hspace{\labelsep}\raggedleft ##1}
			\setlength{\labelwidth}{#1}
			\setlength{\leftmargin}{\labelwidth}
			\setlength{\parsep}{0pt}
			\setlength{\itemsep}{0pt}
			\sloppy}}
	{\end{list}}

% Lista de items comprimida
\newenvironment{elist}%
{ \begin{list}%
    {\tiny \raisebox{0.5ex}{$\blacksquare$}}%
    {\setlength{\itemindent}{0pt}%  --> space between bullet and margin
    \setlength{\topsep}{0pt}%  --> space between the item paragrapn and the previous text
    \setlength{\labelsep}{5pt}%  --> space between bullet and text's start
    \setlength{\leftmargin}{10pt}%  --> space between the text and the left margin (except for the first line)
    \setlength{\labelwidth}{5pt}% --> size of the box containing the bullet.
    \setlength{\listparindent}{0pt}% --> paragraphs indents
    \setlength{\itemindent}{0pt}% --> space between the margin and the bullet
    \setlength{\itemsep}{0pt}% --> vertical space between items (plus \parsep)
    \setlength{\parsep}{1pt}
    }}%
{ \end{list} }
%Caption Setup
\captionsetup[subfigure]{justification=centering}
\captionsetup[subtable]{justification=centering}

% Column types
\newcolumntype{W}{@{}>{\raggedright\arraybackslash}X@{}}
\newcolumntype{Y}{@{}>{\raggedleft\arraybackslash}X@{}}
\newcolumntype{Z}{@{}>{\centering\arraybackslash}X@{}}
\newcolumntype{U}{>{\centering\arraybackslash}p{1cm}}
\newcolumntype{V}{>{\centering\arraybackslash}p{1.15cm}}
\newcolumntype{A}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{B}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{D}[1]{>{\raggedleft\arraybackslash}p{#1}}
\newcolumntype{T}{>{\centering\arraybackslash$}m{0.9cm}<{$}}

%%%%% Defines the appendix
\newcommand{\apendice}{%
	\setcounter{section}{0}%
	\gdef\thesection{\@Alph\c@section}%	
	\titleformat {\section} [block] {\raggedright\large\sffamily\bfseries}
	             {\appendixname~\thesection.~} {0pt} {}
	\titlespacing {\section} {0pt} {12pt} {6pt}
	\gdef\theHsection{\@Alph\c@section.}% for hyperref
}
%%%% Code Execution
\AfterEndPreamble{%
%	\maketitle
}
\AtBeginDocument{%
	\setlength{\intextsep}{2pt plus 1pt minus 1pt}
	\setlength{\textfloatsep}{6pt plus 1pt minus 1pt}
	\setlength{\abovecaptionskip}{2pt plus 1pt minus 1pt}
	\setlength{\belowcaptionskip}{6pt plus 1pt minus 1pt}
	\setlength{\abovedisplayskip}{4pt}
	\setlength{\belowdisplayskip}{4pt}
	\setlength\abovedisplayshortskip{2pt}
	\setlength\belowdisplayshortskip{2pt}
	\setlength{\mathindent}{0.5cm}
	\setlength{\emergencystretch}{12pt}
}
\endinput