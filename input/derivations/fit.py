#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function, division, absolute_import

import argh
import numpy as np
from scipy.optimize import curve_fit


def plot_fit():
    pass


def fit_to_data(expr, symbs):
    from sympy.utilities.lambdify import lambdify
    _vars = [symbs[k] for k in 't Y Z k_f k_b'.split()]
    cb = lambdify(_vars, expr, modules='numpy')

    f = lambda t: binary_eq_analytic(...)
    popt, pcov = curve_fit(f, tdata, ydata, **kwargs)

    yplot = cb(tplot)
    data = np.hstack((tplot, yplot)).transpose()
    return data, params


def main():
    from fit import fit_to_data
    fitdata, fitparams = fit_to_data(alt_expl_in_t, symbs)
    np.savetxt('rev_unary_fit_data.txt', fitdata)
    np.savetxt('rev_unary_fit_params.txt', fitparams)

    plot_fit('rev_unary_fit.png', fitdata, fitparams)


if __name__ == '__main__':
    argh.dispatch_command(main)
