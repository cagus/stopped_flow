#!/bin/bash
BUILDDIR=build
mkdir $BUILDDIR
for t in {*.tex,Variables.ini,txt}
do
    tgt=build/$t
    if [ -d $tgt ]
    then
        if [ ! -L $tgt ]
        then
            ln -s ../$t $tgt
        fi
    else
        ln -s ../$t $tgt
    fi
done
ln -s ../_Makefile build/Makefile
cd $BUILDDIR
make
evince main.pdf &
cd -
