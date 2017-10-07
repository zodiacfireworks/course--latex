%%
%% This file is `homeworksm.cls',
%%
%% Style for homeworks at San Marcos University
%% Lima, Perú.
%%
%% Copyright 2017 zodiacfireworks
%% https://zodiacfireworks.github.io
%%

%% Package info ---------------------------------------------------------------
\def\RCSfile{homeworksm}%
\def\RCSversion{0.1}%
\def\RCSdate{2017/10/07}%
\def\RCSauthor{zodiacfireworks}

\def\@shortid{homeworksm}

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{\@shortid}[\RCSdate, \RCSversion]


%% Options --------------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}


%% Requirement ----------------------------------------------------------------
\RequirePackage[spanish]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage{xstring}
\RequirePackage{xcolor}

%% Useful Constants and functions ---------------------------------------------
\def\@indentationlength{0pt}

% \definecolor{textcolor}{rbg}{0.1216, 0.1216, 0.1216}
\definecolor{textcolor}{HTML}{212121}

% \definecolor{textcolor}{rbg}{0.9804, 0.9804, 0.9804}
\definecolor{pagecolor}{HTML}{FAFAFA}

\def\@textcolor{textcolor}
\def\@pagecolor{pagecolor}

% Check if some language package is in use
\newcommand*\iflanguagepackage[1]{%
  \@ifpackageloaded{babel}{#1}{%
  \@ifpackageloaded{polyglossia}{#1}{}}%
}

%% Misc setting at the begin of the document ----------------------------------
\AtBeginDocument{%
    \setlength{\parindent}{\@indentationlength}%
    \color{\@textcolor}\global\let\default@color\current@color%
    \pagecolor{\@pagecolor}%
}


%% Customization --------------------------------------------------------------
%% Logo - optional
\let\@logo\@empty
\newcommand{\logo}[1]{
    \def\@logo{#1}
}

%% Univerity - optional
\let\@university\@empty
\newcommand{\university}[1]{
    \def\@university{#1}
}

%% Course - optional
\let\@course\@empty
\newcommand{\course}[1]{
    \def\@course{#1}
}

%% \@maketitle
\def\@maketitle{
    \begin{center}
        % Logo
        \ifx\@logo\@empty
            \logo{\@latex@warning@no@line{No \noexpand\logo given}}
            \@logo
        \else
            \includegraphics[width=1.25cm]{\@logo}\par%
            \vskip\baselineskip
        \fi

        % University
        \ifx\@university\@empty
            \university{\@latex@warning@no@line{No \noexpand\university given}}
            \@university
        \else
            \small\textsc{\@university}\par%
            \vskip\baselineskip
        \fi

        % Course
        \ifx\@course\@empty
            \course{\@latex@warning@no@line{No \noexpand\course given}}
            \@course
        \else
            {\normalsize\@course\par}%
            \vskip\baselineskip
        \fi

        {\Large\@title\par}
    \end{center}
    \vskip\baselineskip
    \hrule\par%
    \vskip 6pt
    Nombres: \par%
    Código: \par%
    Fecha de entrega: \par%
    \vskip 6pt
    \hrule\par%
}

%% Problem environment
\newcommand*\problemname{Problem}
\iflanguagepackage{
    \addto\captionsenglish{\def\problemname{Problem}}
    \addto\captionsspanish{\def\problemname{Problema}}
}

\newcounter{problem}
\renewcommand{\theproblem}{\arabic{problem}}
\def\@theproblem{{\bfseries \problemname~\arabic{problem}}}

\newenvironment{problem}[1]{
    \refstepcounter{problem}\par\bigskip
    \@theproblem\par
    #1%
}{\par\medskip\ignorespacesafterend}
