
DEPENDS=common.py derivations.py
.PHONY: all

all: symbnames.tex analytic.c _analytic.pyx _analytic.so ${' '.join(map(' '.join, OUTPUTS.values()))}

symbnames.tex: common.py
	python -c "from common import write_tex_commands as wtc; wtc('symbnames.tex')"

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
