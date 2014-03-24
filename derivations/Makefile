
.PHONY: all

all: rev_unary_1.tex irrev_binary_1.tex rev_binary_1.tex

rev_unary_1.tex: rev_unary.py derivations.py
	python $<

irrev_binary_1.tex: irrev_binary.py derivations.py
	python $<


rev_binary_1.tex: rev_binary.py derivations.py
	python $<
