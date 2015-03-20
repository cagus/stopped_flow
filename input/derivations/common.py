# -*- coding: utf-8 -*-
from sympy import symbols
symbs = x, Y, Z, k_f, k_b, t, chi, tau, a, b, c, P, Q, R, alpha, beta, K_eq = symbols(
    'x Y Z k_f k_b t chi tau a b c P Q R alpha beta K_eq', positive=True)
symbs = {str(s): s for s in symbs}
