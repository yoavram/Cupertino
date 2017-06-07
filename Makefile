version=`git rev-parse --short HEAD`

md=draft.md
pdf=draft.pdf

pandoc_opts=-r markdown+simple_tables+table_captions+yaml_metadata_block -s -S --filter pandoc-crossref --variable=version:$(version) --variable geometry:a4paper --latex-engine=xelatex 

list:
	@sh -c "$(MAKE) -p no_targets__ | awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {split(\$$1,A,/ /);for(i in A)print A[i]}' | grep -v '__\$$' | grep -v 'make\[1\]' | grep -v 'Makefile' | sort"
no_targets__:

$(pdf): $(md)
	pandoc $< -o $@ $(pandoc_opts)
	@open $(pdf)

version:
	@echo $(version)
