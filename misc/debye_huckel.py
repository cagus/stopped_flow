#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import (absolute_import, division,
                        print_function, unicode_literals)
from future.builtins import *

import quantities as pq


def debye_huckel_A(eps_r, T):
    """
    Parameters
    ----------
    eps_r: float
        relative permittivity
    T: float with unit
        temperature
    """
    q = pq.constants.elementary_charge
    NA = pq.constants.Avogadro_constant
    eps0 = pq.constants.vacuum_permittivity
    kB = pq.constants.Boltzmann_constant
    A = q**3*NA**0.5/(4*2**0.5*(eps_r*eps0*kB*T)**(3./2))
    return A.rescale((pq.kg/pq.mole)**0.5)


def main():
    print(debye_huckel_A(80, 298.15*pq.kelvin))


if __name__ == '__main__':
    main()
