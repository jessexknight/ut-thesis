.PHONY: test
test:
	for example in test/* ; do \
		cp ut-thesis/ut-thesis.cls $$example ; \
		cd $$example ; \
		for i in 1 2 3 ; do \
			pdflatex main ; \
		done ; \
		rm ut-thesis.cls ; \
		cd ../../ ; \
	done
