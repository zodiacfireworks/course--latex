%% Información del paquete
\def\RCSfile{mydoctype}
\def\RCSversion{0.1}
\def\RCSdate{2017/09/25}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]

%% Opciones
\LoadClass{article}


%% Definiciones
\renewcommand{\maketitle}{
  {
    \centering
      {\huge
        \textbf{
          \textsc{
            \@title
          }
        }
        \par
      }
      \vspace{-3px}
      \rule{\textwidth}{2pt}\par
      \vspace{-9px}
      \rule{0.8\textwidth}{1pt}\par
      \vspace{18pt}
      {
        \large
          \textit{
            \@author
          }
        \par
      }
      \vspace{18pt}
  }
}
