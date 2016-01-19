
DEPENDS=common.py derivations.py
.PHONY: all

all: analytic.c _analytic.pyx _analytic.so rev_unary_1.tex rev_unary_rate.tex rev_unary_k_b.c rev_unary_K_eq.c irrev_unary_1.tex irrev_unary_rate.tex irrev_unary_k_b.c irrev_unary_K_eq.c irrev_binary_1.tex irrev_binary_2.tex irrev_binary_rate.tex irrev_binary_k_b.c irrev_binary_K_eq.c rev_binary_1.tex rev_binary_2.tex rev_binary_3.tex rev_binary_rate.tex rev_binary_k_b.c rev_binary_K_eq.c

analytic.c: render_code.py analytic_template.c rev_unary_k_b.c rev_unary_K_eq.c rev_binary_k_b.c rev_binary_K_eq.c irrev_unary_k_b.c irrev_unary_K_eq.c irrev_binary_k_b.c irrev_binary_K_eq.c
	python $<

_analytic.pyx: render_code.py _analytic_template.pyx
	python $<

_analytic.so: setup.py _analytic.pyx analytic.c
	python $< build_ext --inplace

variables.tex: variables.py $(DEPENDS)
	python $< >$@

rev_unary_1.tex: rev_unary.py $(DEPENDS)
	python $<
rev_unary_rate.tex: rev_unary.py $(DEPENDS)
	python $<
rev_unary_k_b.c: rev_unary.py $(DEPENDS)
	python $<
rev_unary_K_eq.c: rev_unary.py $(DEPENDS)
	python $<
rev_binary_1.tex: rev_binary.py $(DEPENDS)
	python $<
rev_binary_2.tex: rev_binary.py $(DEPENDS)
	python $<
rev_binary_3.tex: rev_binary.py $(DEPENDS)
	python $<
rev_binary_rate.tex: rev_binary.py $(DEPENDS)
	python $<
rev_binary_k_b.c: rev_binary.py $(DEPENDS)
	python $<
rev_binary_K_eq.c: rev_binary.py $(DEPENDS)
	python $<
irrev_unary_1.tex: irrev_unary.py $(DEPENDS)
	python $<
irrev_unary_rate.tex: irrev_unary.py $(DEPENDS)
	python $<
irrev_unary_k_b.c: irrev_unary.py $(DEPENDS)
	python $<
irrev_unary_K_eq.c: irrev_unary.py $(DEPENDS)
	python $<
irrev_binary_1.tex: irrev_binary.py $(DEPENDS)
	python $<
irrev_binary_2.tex: irrev_binary.py $(DEPENDS)
	python $<
irrev_binary_rate.tex: irrev_binary.py $(DEPENDS)
	python $<
irrev_binary_k_b.c: irrev_binary.py $(DEPENDS)
	python $<
irrev_binary_K_eq.c: irrev_binary.py $(DEPENDS)
	python $<
