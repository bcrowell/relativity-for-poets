\pdfminorversion=4 % force pdf 1.4 output; http://tex.stackexchange.com/questions/95973/is-pdftex-1-40-13-outputting-malformed-pdfs

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{slides}

\LoadClass{beamer}
\usepackage[size=custom,width=27.94,height=21.59]{beamerposter}

\RequirePackage{graphicx,shaddap}
\DeclareGraphicsExtensions{.png,.jpg} % never .pdf, which causes endless hassles with lulu


% figures

\newcommand{\fig}[2]{%
  \begin{center}
    \includegraphics{ch#1/figs/#2}
  \end{center}
}
