default:
	pdflatex poets
	makeindex poets.idx 1>/dev/null 2>/dev/null

book:
	make && make && make

figs:
	#make cover
	make interior_figures

interior_figures:
	# The following requires Inkscape 0.47 or later.
	perl -e 'foreach my $$f(<*/figs/*.svg>) {system("scripts/render_one_figure.pl $$f")}'
	# For better reliability in RIP, make png versions as well.
	perl -e 'foreach my $$f(<*/figs/*.pdf>) {system("scripts/pdf_to_bitmap.pl $$f && rm $$f")}'

clean:
	rm -f *.toc *.log *.idx *.ind *.ilg *~ *.aux
	rm -f ch*/*.aux ch*/*~

very_clean:
	make clean
	rm poets.pdf
