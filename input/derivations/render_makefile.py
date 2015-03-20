#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function, division, absolute_import

from itertools import product

from enmako import render_mako_template_to

def get_outputs(name):
    token = r'# GENERATES WITHOUT ARGUMENTS:'
    for line in open(name+'.py', 'rt'):
        if token in line:
            return line.split(token)[1].split()

rev_irrev = ('rev', 'irrev')
unary_binary = ('unary', 'binary')
kb_Keq = ('k_b', 'K_eq')

def main():
    NAMES = ['_'.join(args) for args in product(rev_irrev, unary_binary)]
    OUTPUTS={}
    for _name in NAMES:
        _tmp = get_outputs(_name)
        OUTPUTS[_name] = _tmp
    RBKs = list(product(rev_irrev, unary_binary, kb_Keq))
    render_mako_template_to('Makefile_template.mako', 'Makefile', locals())

if __name__ == '__main__':
   main()
