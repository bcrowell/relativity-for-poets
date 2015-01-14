#!/usr/bin/ruby

require_relative "../scripts/eruby_util.rb"

photo_credit("cow-and-car","Cow","Redrawn from a photo by Wikimedia Commons user Cgoodwin, CC-BY-SA")
  # http://commons.wikimedia.org/wiki/File:Adaptaur.jpg
photo_credit("cow-and-car","Car","Redrawn from a photo by Wikimedia Commons user Auregann, CC-BY-SA")
  # http://commons.wikimedia.org/wiki/File:Voiture_embourb%C3%A9e.JPG
photo_credit("waage-box","Ladybug","Redrawn from a photo by Wikimedia Commons user Gilles San Martin, CC-BY-SA")
  # http://commons.wikimedia.org/wiki/File:Coccinella_magnifica01.jpg
photo_credit("waage-box","M100","European Southern Observatory, CC-BY-SA")
  # http://en.wikipedia.org/wiki/File:M100.jpg
photo_credit("runner","Runner","Redrawn from photos by Muybridge, 1887")
photo_credit("plane-noninertial","Plane","Redrawn from a photo by Wikimedia Commons user Andy Mitchell, CC-BY-SA")
  # http://commons.wikimedia.org/wiki/File:A_Tiger_Airways_A320_9V-TAN.jpg
photo_credit("twin-paradox","Plane","Redrawn from a photo by Wikimedia Commons user Andy Mitchell, CC-BY-SA")
  # http://commons.wikimedia.org/wiki/File:A_Tiger_Airways_A320_9V-TAN.jpg
photo_credit("twin-paradox","Rotating earth","NASA image, public domain; animated gif by Wikimedia Commons user Marvel, CC-BY-SA")
  # http://commons.wikimedia.org/wiki/File:Rotating_earth_%28large%29.gif
photo_credit("cern-muons","Muon storage ring at CERN","(c) 1974 by CERN; used here under the U.S.~fair use doctrine")
photo_credit("galilean-transformation","Cow and car","As for the figure on p.~\\pageref{fig:cow-and-car}")





print <<-'HEAD'

%
%
%
%
%
%
%
%
%
%
%
%
%
%
%







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not edit this .tex file directly. Edit photo-credits.rb.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







\thispagestyle{plain}
%{Large \textbf{Photo credits}}

\section*{Photo credits}

\newcommand{\docred}[3]{\textbf{#1} \emph{#2:} #3.\quad}
\newcommand{\cred}[3]{\docred{\pageref{fig:#1}}{#2}{#3}}
\footnotesize
\begin{sloppypar}
\noindent
HEAD

print_photo_credits()

print <<-'FOOT'
\end{sloppypar}\normalsize
\thispagestyle{plain}
FOOT
