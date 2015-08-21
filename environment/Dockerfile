FROM ubuntu:14.04.2
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get --quiet --assume-yes install make texlive-bibtex-extra \ 
    texlive-lang-swedish texlive-science texlive-latex-recommended \
    dvipng texlive-fonts-recommended texlive-generic-recommended \
    texlive-latex-extra graphviz dot2tex python-pygments biber \
    python-numpy python-scipy python-mako cython gcc python-argh \
    git g++ gfortran valgrind cmake wget curl liblapack-dev \
    python-matplotlib python-mpmath python-quantities && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY sympy-0.7.6.tar.gz /tmp/sympy-0.7.6.tar.gz
RUN cd /tmp && \
    tar xzf sympy-0.7.6.tar.gz && \
    cd sympy-0.7.6 && \
    python setup.py install && \
    cd .. && \
    rm -r sympy-0.7.6/ sympy-0.7.6.tar.gz
