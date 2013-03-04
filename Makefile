PDFLATEX=xelatex
PDFFLAGS=-halt-on-error -interaction=nonstopmode -file-line-error
PROJECT=ArchLinux From Scratch
MAKEINDEX=makeindex
MAKEINDEXFLAGS=
INDICES=abv

.PHONY: clean

book: clean book-1stpass $(INDICES)
	$(PDFLATEX) $(PDFFLAGS) "$(PROJECT).tex" | ./filter.sh 2>&1
book-1stpass:
	$(PDFLATEX) $(PDFFLAGS) "$(PROJECT).tex" > error.log 2>&1 && \
	$(PDFLATEX) $(PDFFLAGS) "$(PROJECT).tex" > error.log 2>&1
$(INDICES):
	$(MAKEINDEX) $(MAKEINDEXFLAGS) $@.idx
clean:
	rm -rf *.{aux,log,out,loe,ilg,ind,idx}
	find . -type f -name "*~" -exec rm {} \;
	find . -type f -name "*.aux" -exec rm {} \;
	rm -rf *.{toc,pdf}
