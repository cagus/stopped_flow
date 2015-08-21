# -*- coding: utf-8 -*-

from sympy import log, Symbol

from derivations import primitive_valid

def test_primitive_valid():
    x, Y, Z = map(Symbol, 'x Y Z'.split())
    assert primitive_valid(log(x), 1/x, x)

    integrand = 1/((Y-x)*(Z-x))
    primitive_attempt = 1/(Y-Z)*log((Y-x)/(Z-x))
    assert primitive_valid(primitive_attempt, integrand, x)
