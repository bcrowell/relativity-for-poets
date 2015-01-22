#!/usr/bin/ruby

def die(message)
  $stderr.print "make_slides.rb: " + message + "\n"
  exit(-1)
end

if ARGV.empty? then die("Usage: make_slides figures.csv >slides.tex") end
infile = ARGV[0]
if ! File.exist?(infile) then die("File #{infile} does not exist.") end
File.open(infile,'r') { |f|
  old_ch = -1
  print <<-"HEAD"
    \\documentclass{slides}
    \\begin{document}
    HEAD
  f.each_line { |line|
    if line=~/^(\d+),(.*)$/ then
      ch,name = [$1,$2]
      if ch.to_i<10 then ch_2_digits = "0"+ch else ch_2_digits = ch end
      if ch!=old_ch then
        old_ch = ch
        print <<-"CH"
          \\begin{frame}{}
            {\\Huge Chapter #{ch}}
          \\end{frame}
          CH
      end
      print <<-"STUFF"
        \\begin{frame}{}
          \\fig{#{ch_2_digits}}{#{name}}

          \\vfill\\hfill
          {\\footnotesize ch.~#{ch}, #{name}}
        \\end{frame}
        STUFF
    else
      die("Illegal line in input file: #{line}")
    end
  }
  print <<-"FOOT"
    \\end{document}
    FOOT
}
