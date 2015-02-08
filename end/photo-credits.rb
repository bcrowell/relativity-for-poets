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
photo_credit("galaxy-lorentz-contraction","Galaxy","NASA/STScI/ESA, public domain")
  # http://upload.wikimedia.org/wikipedia/commons/b/b3/UGC_12158.jpg
photo_credit("convertible-and-cube","Cadillac","Redrawn from a photo by That Hartford Guy, CC-BY-SA")
  # http://commons.wikimedia.org/wiki/File:1965_Cadillac_Deville_convertible_left.jpg
photo_credit("define-mass","Astronaut","NASA")
photo_credit("e-p","Sprinters","Darren Wilkinson, CC-BY-SA")
  # http://en.wikipedia.org/wiki/File:London_2012_Olympic_100m_final_start.jpg
photo_credit("e-p","Fireworks","Kristina Servant, CC-BY")
  # http://en.wikipedia.org/wiki/File:Fireworks_June_23_2012.jpg
photo_credit("duck-rabbit-illusion","Duck-rabbit illusion","J.~Jastrow, Popular Science Monthly, 1899")
  # http://commons.wikimedia.org/wiki/File:Duck-Rabbit_illusion.jpg
photo_credit("pet-scan","PET scan","NIH, public domain")
  # http://en.wikipedia.org/wiki/File:PET_scan_image3699-PH.jpg
photo_credit("old-lady","Football player and old lady","Hazel Abaya")
photo_credit("ep","Girl","Georges H\\'ebert, L'\\'education Physique f\\'eminine, 1921, public domain")
  # http://commons.wikimedia.org/wiki/File:Bonne_et_mauvaises_attitudes_en_station_assise.png
photo_credit("ep","M100","European Southern Observatory, CC-BY-SA")
  # http://en.wikipedia.org/wiki/File:M100.jpg
photo_credit("ep","Saturn","NASA, public domain")
  # http://en.wikipedia.org/wiki/File:Saturn_PIA06077.jpg

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
