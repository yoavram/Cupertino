version=`git rev-parse --short HEAD`

md=draft.md
pdf=draft.pdf

template=./ms/template.latex

main_bib=/Users/yoavram/Documents/library.bib
ms_bib=ms/bibtex.bib
citation_keys=ms/citation_keys
csl=ms/tpb.csl

pandoc_opts=-r markdown+simple_tables+table_captions+yaml_metadata_block -s -S --filter pandoc-crossref --filter pandoc-citeproc --bibliography=$(ms_bib) --csl $(csl) --template=$(template) --latex-engine=xelatex --number-sections --variable=version:$(version) --variable geometry:a4paper --variable classoption:twocolumn

list:
	@sh -c "$(MAKE) -p no_targets__ | awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {split(\$$1,A,/ /);for(i in A)print A[i]}' | grep -v '__\$$' | grep -v 'make\[1\]' | grep -v 'Makefile' | sort"
no_targets__:

$(citation_keys): $(md)
	python src/get_citations.py $(md) $(citation_keys)

$(ms_bib): $(citation_keys) $(main_bib)
	python src/get_bibtex.py $(citation_keys) $(main_bib) $@

$(pdf): $(md) $(ms_bib) $(template)
	pandoc $< -o $@ $(pandoc_opts)
	@open $(pdf)

version:
	@echo $(version)
