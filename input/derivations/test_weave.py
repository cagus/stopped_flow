#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function, division, absolute_import

import argh
from scipy import weave


def main(fname_code='irrev_unary_code.c', fname_data, ):
    def cb(t, Y, Z, k_f, k_b):
        return weave.inline(open(fname_code, 'rt').read(), 't Y Z k_f k_b'.split())
    print(cb(0.5, 20e-3, 2e-3, 110, 10))


if __name__ == '__main__':
    argh.dispatch_command(main)
