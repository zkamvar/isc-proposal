TARGETS: 2022-carpentries-isc-proposal.pdf index.html

2022-carpentries-isc-proposal.pdf: isc-proposal.md font_def.tex
	pandoc -t pdf \
		--pdf-engine=xelatex \
		-V geometry:margin=1in \
		--include-in-header=font_def.tex \
		-o $@ $<

isc-proposal.docx: isc-proposal.md
	pandoc -t docx \
		-o $@ $<

index.html: isc-proposal.md
	pandoc -t html \
		--standalone \
		--toc \
		-o $@ isc-proposal.md

