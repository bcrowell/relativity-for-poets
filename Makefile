BOOK = poets
NICE = nice ionice -n7
TEX_INTERPRETER = pdflatex
# ... can also try lualatex
TERMINAL_OUTPUT = err
DO_PDFLATEX_RAW = $(NICE) $(TEX_INTERPRETER) -interaction=nonstopmode $(BOOK) >$(TERMINAL_OUTPUT)
# ... if using write18, need to add -shell-escape
#     environment variable  openout_any=a allows writing to files (?) [see lm]
SHOW_ERRORS = \
        system("scripts/filter_latex_messages.rb <$(TERMINAL_OUTPUT) >a.a && mv a.a $(TERMINAL_OUTPUT)")
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

default:
	@$(DO_PDFLATEX)

book:
	@$(DO_PDFLATEX)
	@$(DO_PDFLATEX)
	makeindex $(BOOK).idx 1>/dev/null 2>/dev/null
	@$(DO_PDFLATEX)

figs:
	#make cover
	make interior_figures

interior_figures:
	# The following requires Inkscape 0.47 or later.
	# To force rendering of all figures, even if they seem up to date, do FORCE=1 make interior_figures
	perl -e 'foreach my $$f(<*/figs/*.svg>) {system("scripts/render_one_figure.pl $$f $(FORCE)")}'
	# For better reliability in RIP, make png versions as well.
	perl -e 'foreach my $$f(<*/figs/*.pdf>) {system("scripts/pdf_to_bitmap.pl $$f png $(FORCE) && rm $$f")}'

clean:
	rm -f *.toc *.log *.idx *.ind *.ilg *~ *.aux
	rm -f ch*/*.aux ch*/*~

very_clean:
	make clean
	rm poets.pdf
