#!/usr/bin/perl

use strict;

# usage:
#   pdf_to_bitmap.pl foo.pdf
#   pdf_to_bitmap.pl foo.pdf jpg
#   pdf_to_bitmap.pl foo.pdf png
# default format is png
# quality for jpg is set to imagemagick's default of 92
# If the file foo.jpg or foo.png exists and is newer than foo.pdf, then nothing is done, and this is not an error.
# If the file foo.jpg or foo.png exists and foo.pdf doesn't exist, then nothing is done, and this is not an error.

my $pdf = $ARGV[0];
my $dest_fmt = $ARGV[1];
if ($dest_fmt=='') {$dest_fmt='png'}

my @temp_files = ();

unless ($pdf =~ /\.pdf$/) {finit("Error in pdf_to_bitmap.pl, input file doesn't have extension .pdf")}

my $rendered = $pdf;
$rendered =~ s/\.pdf$/.$dest_fmt/;


if (-e $rendered && (! (-e $pdf))) {exit(0)}
###if (-e $rendered && -M $pdf > -M $rendered) {exit(0)} # -M finds age in days

print "rendering $pdf to $rendered\n";

# Don't use inkscape --export-png, because as of april 2013, it messes up on transparency.
# Can convert pdf directly to bitmap of the desired resolution using imagemagick, but it messes up on some files (e.g., huygens-1.pdf), so
# go through pdftoppm first.
my $ppm = 'z-1.ppm'; # only 1 page in pdf
push @temp_files,$ppm;
if (system("pdftoppm -r 300 $pdf z")!=0) {finit("Error in pdf_to_bitmap.pl, pdftoppm")}
if (system("convert $ppm -density 300 -gamma 2.3 -units PixelsPerInch $rendered")!=0) {finit("Error in pdf_to_bitmap.pl, ImageMagick's convert")}
# ... uses default quality of 92
#     without -gamma 2.3 it comes out much too dark -- why??

print "\n";
finit();

sub finit {
  my $message = shift;
  tidy();
  if ($message eq '') {
    exit(0);
  }
  else {
    die $message;
  }
}

sub tidy {
  foreach my $f(@temp_files) {
    unlink($f) or die "error deleting $f, $!";
  }
}
