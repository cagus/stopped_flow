FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get --quiet --assume-yes install make texlive-bibtex-extra \ 
    texlive-lang-swedish texlive-science texlive-latex-recommended \
    dvipng texlive-fonts-recommended texlive-generic-recommended \
    texlive-latex-extra python-pygments && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
