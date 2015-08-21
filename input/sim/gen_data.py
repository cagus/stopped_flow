#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function, division, absolute_import

import numpy as np
from scipy.integrate import ode

import argh


def f(t, y, params):
    rf = params[0]*y[0]*y[1]
    rb = params[1]*y[2]
    return np.array(
        [rb-rf, rb-rf, rf-rb])


def main(Z, Y, eps_l, k_f, k_b, tend, d, nt=500, fname='data.txt'):
    """
         A + B <->  C
    t0   Y   Z     X=0
    """
    Z, Y, eps_l, k_f, k_b, tend, d = map(float, [Z,Y,eps_l,k_f,k_b,tend,d])
    tout = np.linspace(d, tend+d, nt)
    y = np.empty((nt, 3))
    sys = ode(f)
    sys.set_integrator('vode', method='adams', atol=1e-12, rtol=1e-12)
    sys.set_initial_value(np.array([Y, Z, 0]), 0)
    sys.set_f_params(np.array([k_f, k_b]))
    for i, t in np.ndenumerate(tout):
        sys.integrate(t)
        y[i,:] = sys.y
    np.savetxt(fname, np.hstack((tout.reshape((nt,1))-d, eps_l*y[:,2].reshape((nt,1)))))


if __name__ == '__main__':
    argh.dispatch_command(main)
