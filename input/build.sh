#!/bin/bash
# Script to build latex document main.tex
# Arguments
#   BUILDDIR (optional)
#   DIRSFILE (optional)

# BUILDDIR is the final dir which `make` is executed in
BUILDDIR=${1:-../output}
if [[ ! -d $BUILDDIR ]]; then
    mkdir $BUILDDIR
fi

# DIRSFILE list dirs to look for (and run) Makefiles in (BUILDDIR excluded)
# all dirs listed are also symlinked from BUILDDIR
DIRSFILE=${2:-dirs.txt}

if [[ -f $DIRSFILE ]]; then
    DIRS=$(cat $DIRSFILE)
else
    DIRS=$(find . -maxdepth 1 -type d \
        -not -path '.' \
        -not -path '*/\.*' \
        -not -path '*_region_*' \
        -not -path "*/$BUILDDIR")
fi

echo $DIRS
for d in $DIRS; do
    cp -rau $d $BUILDDIR
    # Loop over directories and look for Makefiles and run them
    if [[ -f $d/Makefile ]]; then
        cd $BUILDDIR/$d
        pwd
        make
        cd -
    fi
done

TGTS=(main.tex supp_mater.tex *.bib Variables.ini)
echo "${TGTS[@]}"
for t in "${TGTS[@]}"; do
    tgt=$BUILDDIR/$t
    if [[ ! -L $tgt ]]; then
        ln -s ../input/$t $tgt
    fi
done
if [[ ! -L $BUILDDIR/Makefile ]]; then
    ln -s ../input/_Makefile $BUILDDIR/Makefile 
fi
cd $BUILDDIR
make
biber main
make
cd -
