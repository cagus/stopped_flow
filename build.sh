#!/bin/bash
DIRSFILE=dirs.txt
BUILDDIR=build

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
    tgt=build/$t
    if [ -d $tgt ]
    then
        if [ ! -L $tgt ]
        then
            ln -s ../$t $tgt
        fi
    else
        if [ ! -L $tgt ]
        then
            ln -s ../$t $tgt
        fi
    fi
done
if [ ! -L build/Makefile ]
then
    ln -s ../_Makefile build/Makefile 
fi
cd $BUILDDIR
make
evince main.pdf &
cd -
