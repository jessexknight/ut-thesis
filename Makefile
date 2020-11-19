all:
	make ins ;\
	make doc ;\
	make tests ;\
	make tds ;\
	make zip

ins:
	cd ut-thesis ;\
	rm ut-thesis.cls ;\
	pdflatex ut-thesis.ins ;

doc:
	cd ut-thesis ;\
	pdflatex ut-thesis.dtx ;

tests:
	for example in test/* ; do \
		cp ut-thesis/ut-thesis.cls $$example ;\
		cd $$example ;\
		pdflatex main && pdflatex main && bibtex main && pdflatex main ;\
		rm ut-thesis.cls ;\
		cd ../../ ;\
	done

tds:
	mkdir -p ctan/tex/latex/ut-thesis ;\
	mkdir -p ctan/doc/latex/ut-thesis ;\
	mkdir -p ctan/source/latex/ut-thesis ;\
	cd ut-thesis ;\
	cp ut-thesis.cls ../ctan/tex/latex/ut-thesis/ ;\
	cp ut-thesis.pdf ../ctan/doc/latex/ut-thesis/ ;\
	cp README        ../ctan/doc/latex/ut-thesis/ ;\
	cp ut-thesis.ins ../ctan/source/latex/ut-thesis ;\
	cp ut-thesis.dtx ../ctan/source/latex/ut-thesis ;\
	cd ../ctan ;\
	zip ut-thesis.tds.zip -r * ;\
	rm -r tex doc source

zip:
	cd ut-thesis ;\
	cp ../ctan/ut-thesis.tds.zip . ;\
	zip ../ctan/ut-thesis.zip \
		ut-thesis.tds.zip \
		ut-thesis.dtx \
		ut-thesis.ins \
		ut-thesis.cls \
		ut-thesis.pdf \
		README ;\