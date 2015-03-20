
DEPENDS=common.py derivations.py
.PHONY: all

all: analytic.c _analytic.pyx _analytic.so ${' '.join(map(' '.join, OUTPUTS.values()))}

analytic.c: render_code.py analytic_template.c ${'.c '.join(map('_'.join, RBKs))+'.c'}
	python $<

_analytic.pyx: render_code.py _analytic_template.pyx
	python $<

_analytic.so: setup.py _analytic.pyx analytic.c
	python $< build_ext --inplace

%for NAME in NAMES:
%for OUTPUT in OUTPUTS[NAME]:
${OUTPUT}: ${NAME}.py $(DEPENDS)
	python $<
%endfor
%endfor
