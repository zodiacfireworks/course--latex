%% Dependencias
\NeedsTeXFormat{LaTeX2e}[1995/12/01]

%% Clase que estoy creando
\ProvidesClass{examen}

%% Clase base que voy a utilizar
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}

%% Definiciones propias de mi clase
% Personalización de maketitle
% X
% funcion Y(arg1){ X = arg1 }
\let\@logo\@empty
\newcommand{\logo}[1]{
	\def\@logo{#1}
}

\let\@university\@empty
\newcommand{\university}[1]{
    \def\@university{#1}
}

\let\@course\@empty
\newcommand{\course}[1]{
	\def\@course{#1}
}

\def\@maketitle{
    \begin{center}
		\ifx\@logo\@empty
			\logo{\@latex@warning@no@line{No \noexpand\logo give}}
			\@logo
		\else    	
	        \includegraphics[height=1cm]{\@logo}\par
	        \ifx\@university\@empty
                \vskip 1.5em	        	
	        \fi
	    \fi
	    \ifx\@university\@empty
	    	\university{\@latex@warning@no@line{No \noexpand\university give}}
	    	\@university
	    \else
	    	{\scriptsize \textsc \@university \par}
	    	\vskip 1.5em
	    \fi
	    \ifx\@course\@empty
	        \course{\@latex@warning@no@line{No \noexpand\course give}}
	        \@course
	    \else
            {\normalsize \@course \par}
        \fi
        
        {\Large \textsf \@title \par}
        \vskip 0.5em
        {\small \textit{Prof. \@author} \par}
    \end{center}
    \vskip 0.25em
    \noindent\rule{1\textwidth}{1pt}
    \vskip 0.25em
    {\noindent Alumno:\hfill\@date\par}
    \noindent\rule{1\textwidth}{1pt}
    \vskip 0.5em
}
