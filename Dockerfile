FROM ubuntu:xenial

RUN apt-get update -y &&\
	apt-get install -y texlive texlive-latex-extra texlive-latex3 texlive-fonts-extra 

