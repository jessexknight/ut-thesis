all:
	make ins ;\
	make doc ;\
	make tests ;\
	make zip ;\
	make tds

ins:
	cd ut-thesis ;\
	rm ut-thesis.cls ;\
	pdflatex ut-thesis.ins

doc:
	cd ut-thesis ;\
	pdflatex ut-thesis.dtx

tests:
	for example in test/* ; do \
		cp ut-thesis/ut-thesis.cls $$example ;\
		cd $$example ;\
		pdflatex main && pdflatex main && biber main && pdflatex main ;\
		rm ut-thesis.cls ;\
		cd ../../ ;\
	done

debug:
	cp ut-thesis/ut-thesis.cls test/.debug/ ;\
	cd test/.debug ;\
	pdflatex main && pdflatex main && biber main && pdflatex main ;\
	rm ut-thesis.cls ;\

zip:
	zip ctan/ut-thesis.zip \
		ut-thesis/ut-thesis.dtx \
		ut-thesis/ut-thesis.ins \
		ut-thesis/ut-thesis.pdf \
		ut-thesis/README

tds:
	mkdir -p .texmf/tex/latex/ut-thesis ;\
	mkdir -p .texmf/doc/latex/ut-thesis ;\
	cd .texmf ;\
	cp ../ut-thesis/ut-thesis.cls tex/latex/ut-thesis/ ;\
	cp ../ut-thesis/ut-thesis.pdf doc/latex/ut-thesis/ ;\
	cp ../ut-thesis/README doc/latex/ut-thesis/ ;\
	zip ut-thesis.tds.zip -r * ;\
	cp ut-thesis.tds.zip ../ctan ;\
	cd .. ;\
	rm -r .texmf
