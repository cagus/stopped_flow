#!/bin/bash

# BUILDDIR is the final dir which `make` is executed in
BUILDDIR=${1:-../output}

# DIRSFILE list dirs to look for (and run) Makefiles in (BUILDDIR excluded)
# all dirs listed are also symlinked from BUILDDIR
DIRSFILE=${2:-dirs.txt}

if [ -f $DIRSFILE ]
then
    DIRS=$(cat $DIRSFILE)
else
    DIRS=$(find . -maxdepth 1 -type d -not -path '.' -not -path '*/\.*' -not -path "*/$BUILDDIR")    
fi

echo $DIRS
for d in $DIRS
do
    # Loop over directories and look for Makefiles and run them
    if [ -f $d/Makefile ]
    then
        cd $d
        pwd
        make
        cd -
    fi
done

# Now let's build the final pdf
if [ ! -d $BUILDDIR ]
then
    mkdir $BUILDDIR
fi

TGTS=(*.tex Variables.ini ${DIRS[@]})
echo "${TGTS[@]}"
for t in "${TGTS[@]}"
do
    tgt=$BUILDDIR/$t
    if [ -d $tgt ]
    then
        if [ ! -L $tgt ]
        then
            ln -s ../input/$t $tgt
        fi
    else
        if [ ! -L $tgt ]
        then
            ln -s ../input/$t $tgt
        fi
    fi
done
if [ ! -L $BUILDDIR/Makefile ]
then
    ln -s ../input/_Makefile $BUILDDIR/Makefile 
fi
cd $BUILDDIR
make
cd -
