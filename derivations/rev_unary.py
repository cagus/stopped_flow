from derivations import as_align_env, primitive_valid
from sympy import (
    symbols, Eq, Derivative, Integral, log, solve,
    collect, atan, sqrt, S, exp, Piecewise
)

symbs = x, Z, k_f, k_b, t, chi, tau = symbols(
    'x Z k\'_f k_b t chi tau', positive=True)
symbs = {str(s): s for s in symbs}

subs = {}
eqs = []

# rate of x
rate_expr = k_f*(Z-x) - k_b*x
rate_eq = Eq(Derivative(x,t), rate_expr)
eqs.append(rate_eq)

integrand = 1/rate_expr
inte_eq_lhs = Integral(integrand.subs({x: chi}), (chi,0,x))
inte_eq_rhs = Integral(1, (tau,0,t))
inte_eq = Eq(inte_eq_lhs, inte_eq_rhs)
eqs.append(inte_eq)

expl_in_x_eq = inte_eq.doit().simplify()
eqs.append(expl_in_x_eq)

expl_in_t_eq = Eq(x, solve(expl_in_x_eq, x)[0])
eqs.append(expl_in_t_eq)

alt_expl_in_t = Z*k_f/(k_f+k_b)*(1-exp(-t*(k_f+k_b)))
assert (expl_in_t_eq.rhs - alt_expl_in_t).simplify() == 0

alt_expl_in_t_eq = Eq(x, alt_expl_in_t)
eqs.append(alt_expl_in_t_eq)


def main():
    open('rev_unary_1.tex', 'wt').write(as_align_env(eqs))

if __name__ == '__main__':
   main()
