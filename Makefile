name=ms

$(name).pdf: $(name).tex
	pdflatex $<
	bibtex $(name)
	pdflatex $<
	pdflatex $<
	@open $(name).pdf

list:
	@sh -c "$(MAKE) -p no_targets__ | awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {split(\$$1,A,/ /);for(i in A)print A[i]}' | grep -v '__\$$' | grep -v 'make\[1\]' | grep -v 'Makefile' | sort"
no_targets__:

clean:
	@rm $(name).{aux,blg,log,out,pdf,bbl}