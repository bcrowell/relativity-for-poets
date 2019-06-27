BOOK = poets
NICE = nice ionice -n7
TEX_INTERPRETER = pdflatex
# ... can also try lualatex
PROBLEMS_CSV = /dev/null
TERMINAL_OUTPUT = err
DO_PDFLATEX_RAW = $(NICE) $(TEX_INTERPRETER) -interaction=nonstopmode $(BOOK) >$(TERMINAL_OUTPUT)
# ... if using write18, need to add -shell-escape
#     environment variable  openout_any=a allows writing to files (?) [see lm]
SHOW_ERRORS = \
	system("scripts/filter_latex_messages.rb <$(TERMINAL_OUTPUT) >a.a && mv a.a $(TERMINAL_OUTPUT)"); \
	print "========error========\n"; \
	open(F,"$(TERMINAL_OUTPUT)"); \
	while ($$line = <F>) { \
	  if ($$line=~m/^\! / || $$line=~m/^l.\d+ /) { \
	    print $$line \
	  } \
	} \
	close F; \
	exit(1)
DO_PDFLATEX = echo "$(DO_PDFLATEX_RAW)" ; perl -e 'if (system("$(DO_PDFLATEX_RAW)")) {$(SHOW_ERRORS)};'

book1:
	@make preflight
	@rm -f figures.csv
	@make eruby
	@$(DO_PDFLATEX)

z:
	make book
	make post
	make slides
	cd alr && make figs && make && cd -

book:
	@make preflight
	@rm -f figures.csv
	@make eruby
	@$(DO_PDFLATEX)
	@$(DO_PDFLATEX)
	makeindex $(BOOK).idx 1>/dev/null 2>/dev/null
	scripts/harvest_aux_files.rb
	end/photo-credits.rb >end/photo-credits.tex
	@$(DO_PDFLATEX)

post:
	cp poets.pdf ~/Lightandmatter/poets

prepress:
	scripts/pdf_extract_pages.rb poets.pdf 3-end poets_lulu.pdf

slides:
	@./scripts/make_slides.rb figures.csv >slides.tex
	@pdflatex slides
	@mv slides.pdf ~/Lightandmatter/alr/slides_poets.pdf
	@make clean

figs:
	make interior_figures
	scripts/render_one_figure.pl cover/cover-for-pdf.svg $(FORCE)
	scripts/pdf_to_bitmap.pl cover/cover-for-pdf.pdf png $(FORCE) && rm cover/cover-for-pdf.pdf

eruby:
	perl -e 'foreach $$f(<ch*/*rbtex>) {$$g=$$f; $$g=~s/\.rbtex/temp.tex/; $$c="RBTEX=$$f ./scripts/fruby $$f >$$g"; system $$c}'

interior_figures:
	# The following requires Inkscape 0.47 or later.
	# To force rendering of all figures, even if they seem up to date, do FORCE=1 make interior_figures
	perl -e 'foreach my $$f(<*/figs/*.svg>) {system("scripts/render_one_figure.pl $$f $(FORCE)")}'
	# For better reliability in RIP, make png versions as well.
	perl -e 'foreach my $$f(<*/figs/*.pdf>) {system("scripts/pdf_to_bitmap.pl $$f png $(FORCE) && rm $$f")}'

clean:
	rm -f *.toc *.log *.idx *.ind *.ilg *~ *.aux
	rm -f ch*/*.aux ch*/*~ ch*/*temp.tex
	@rm -f slides.nav slides.out slides.snm slides.tex

very_clean:
	make clean
	rm -f poets.pdf poets_lulu.pdf

preflight:
	@chmod +x scripts/*
	@chmod +x end/photo-credits.rb
	@perl -e 'if (-e "scripts/custom/enable") {system("chmod +x scripts/custom/*"); foreach $$f(<scripts/custom/*.pl>) {$$c="$$f $(BOOK) $(PROBLEMS_CSV)"; system($$c)}}'
