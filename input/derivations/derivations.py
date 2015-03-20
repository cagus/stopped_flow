# -*- coding: utf-8 -*-

def primitive_valid(primitive, integrand, indep, subsd1=None, subsd2=None):
    subsd1 = subsd1 or {}
    subsd2 = subsd2 or {}
    return (primitive.diff(indep) - integrand).subs(subsd1).subs(subsd2).simplify() == 0

def aligned(args):
    return """\\begin{{align}}
  {}
\\end{{align}}
""".format('\\\\\n  '.join([latex(entry).replace(' =', ' &=') for entry in args]))


from sympy.printing.latex import latex
def as_latex_env(args, env, cbs=(), joinstr=' \\\\\n  '):
    begin = '\\begin{%s}\n  ' % env
    end = '\n\\end{%s}\n' % env
    for cb in cbs:
        args = map(cb, args)
    body = joinstr.join(args)
    return begin+body+end

as_align_env = lambda args: as_latex_env(args, 'align', (latex,))
as_equation_env = lambda args: as_latex_env(args, 'equation', (latex,))
