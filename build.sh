#!/bin/bash
BUILDDIR=build
mkdir $BUILDDIR
for t in {*.tex,Variables.ini,txt}
do
    ln -s ../$t build/$t
done
ln -s ../_Makefile build/Makefile
cd $BUILDDIR
make
evince main.pdf &
cd -
