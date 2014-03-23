# -*- coding: utf-8 -*-

from sympy import log, Symbol

def test_primitive_valid(self):
    x, Y, Z = Symbol('x Y Z')
    assert primitive_valid(log(x), 1/x, x)

    integrand = 1/((Y-x)*(Z-x))
    primitive_attempt = 1/(Y-Z)*log((Y-x)/(Z-x))
    assert primitive_valid(primitive_attempt, integrand, x)
