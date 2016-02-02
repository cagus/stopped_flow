#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import re

art = '@article{'

def main(path, ofh):
    for l in open(path, 'rt'):
        if l.startswith(art):
            l = art+l[len(art):-2].replace(':', '')+',\n'
        elif l.strip().startswith('date'):
            before, inside = l.split('{', 1)
            after_rev, inside_rev = inside[::-1].split('}', 1)
            inside = inside_rev[::-1].split('-', 1)[0]
            after = after_rev[::-1]
            print(before, inside, after)
            l = before + '{' + inside + '}' + after
        ofh.write(l)

if __name__ == '__main__':
    with open(sys.argv[2], 'wt') as ofh:
        main(sys.argv[1], ofh)
