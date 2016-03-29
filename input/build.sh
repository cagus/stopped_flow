#!/bin/bash -e
# Script to build latex document main.tex
DIRS=$(find . -maxdepth 1 -type d \
    -not -path '.' \
    -not -path '*/\.*' \
    -not -path '*_region_*' \
    -not -path "*/$BUILDDIR")

for d in $DIRS; do
    if [[ -f $d/Makefile ]]; then
        ( cd $d; make )
    fi
done

make main.bib
make
biber main
make
