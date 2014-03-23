#!/usr/bin/env python
# -*- coding: utf-8 -*-

from derivations import as_align_env, primitive_valid
from sympy import (
    symbols, Eq, Derivative, Integral, log, solve,
    collect, atan, sqrt, S, exp, Piecewise
)

symbs = x, Y, Z, k_f, k_b, t, chi, tau, a, b, c, P, Q, R, alpha, beta = symbols(
    'x Y Z k_f k_b t chi tau a b c P Q R alpha beta', positive=True)
symbs = {str(s): s for s in symbs}

subs = {}
eqs = []

# rate of x
rate_expr = k_f*(Y-x)*(Z-x) - k_b*x
rate_eq = Eq(Derivative(x,t), rate_expr)
eqs.append(rate_eq)

gen_integrand = 1/(a*x**2+b*x+c)
poly = collect(rate_expr.expand(), x, evaluate=False)
a_ = poly[x**2]
b_ = poly[x]
c_ = poly[S.One]
subs[a] = a_
subs[b] = b_
subs[c] = c_

primitives = [
    1/sqrt(b**2-4*a*c)*log((2*a*x+b-sqrt(b**2-4*a*c))/(2*a*x+b+sqrt(b**2-4*a*c))),
    -2/(2*a*x+b),
    2/sqrt(4*a*c-b**2)*atan((2*a*x+b)/sqrt(4*a*c-b**2))
]

conds = [
    4*a*c < b**2,
    Eq(4*a*c, b**2),
    4*a*c > b**2,
]

C = symbols('C')
gen_integral_eq = Eq(Integral(gen_integrand,x), Piecewise(*zip([p+C for p in primitives], conds)))

for i, (prim, cond) in enumerate(zip(primitives, conds)):
    if i == 0:
        _a, _b, _c = 2, 3, 1
    elif i == 1:
        _a, _b, _c = 2, 4, 2
    else:
        _a, _b, _c = 3, 2, 4
    subsd = {a: _a, b: _b, c: _c}
    assert cond.subs(subsd) == True
    assert primitive_valid(prim, gen_integrand, x, subsd)


#inte_eq_lhs = Integral(gen_integrand.subs({x: chi}), (chi,0,x))
inte_eq_lhs = Integral((1/rate_expr).subs({x: chi}), (chi,0,x))
inte_eq_rhs = Integral(1, (tau,0,t))
inte_eq = Eq(inte_eq_lhs, inte_eq_rhs)
eqs.append(inte_eq)

eqs.append({k: subs[k] for k in [a, b, c]})
P_ = sqrt(b**2-4*a*c)
subs[P] = P_
eqs.append(Eq(P, P_))

candid = 1/P*log((2*a*x+b-P)/(2*a*x+b+P))
assert primitive_valid(candid.subs({P: P_}), gen_integrand, x)

expl_in_x_eq = Eq((candid-candid.subs({x: 0})).simplify(), t)
eqs.append(expl_in_x_eq)

sol = solve(expl_in_x_eq, x)
assert len(sol) == 1
sol = sol[0].simplify()
expl_in_t_eq = Eq(x, sol)
eqs.append(expl_in_t_eq)

Q_ = (P+b)
R_ = (P-b)
subs[Q] = Q_
subs[R] = R_
eqs.extend([Eq(Q, Q_), Eq(R, R_)])

alt_expl_in_t = -Q*(exp(P*t)-1)/(2*a*(Q/R+exp(P*t)))

assert (expl_in_t_eq.rhs - alt_expl_in_t.subs({Q: Q_, R: R_})).simplify().subs(subs).simplify() == 0

alt_expl_in_t_eq = Eq(x, alt_expl_in_t)
eqs.append(alt_expl_in_t_eq)

_P_subs = P_.subs(subs)
PQR_subs={k: v.simplify() for k, v in {
    P: _P_subs,
    Q: Q_.subs({P: _P_subs}).subs(subs),
    R: R_.subs({P: _P_subs}).subs(subs)
}.items()}

def main():
    open('rev_binary_1.tex', 'wt').write(as_align_env(eqs[:2]))
    open('rev_binary_2.tex', 'wt').write(as_align_env([gen_integral_eq]))
    open('rev_binary_3.tex', 'wt').write(as_align_env(eqs[2:]))

if __name__ == '__main__':
   main()
