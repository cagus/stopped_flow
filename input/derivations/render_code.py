#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function, division, absolute_import

from itertools import product

from enmako import render_mako_template_to


def main():
    NAMES = map('_'.join, product(('rev', 'irrev'),('binary', 'unary')))
    PARAMS = ('K_eq', 'k_b')
    BODY = {name_param: open(name_param+'.c','rt').read() for \
            name_param in map('_'.join, product(NAMES, PARAMS))}
    render_mako_template_to('analytic_template.c', 'analytic.c', locals())
    render_mako_template_to('_analytic_template.pyx', '_analytic.pyx', locals())


if __name__ == '__main__':
    main()
