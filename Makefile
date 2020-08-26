all:
	make ins ; \
	make doc ; \
	make tests ; \

ins:
	cd ut-thesis ; \
	rm ut-thesis.cls ; \
	pdflatex ut-thesis.ins ;

doc:
	cd ut-thesis ; \
	pdflatex ut-thesis.dtx ;

tests:
	for example in test/* ; do \
		cp ut-thesis/ut-thesis.cls $$example ; \
		cd $$example ; \
		for i in 1 2 3 ; do \
			pdflatex main ; \
		done ; \
		rm ut-thesis.cls ; \
		cd ../../ ; \
	done
