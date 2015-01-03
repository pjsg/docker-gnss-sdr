# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.9.15

MAINTAINER philip@gladstonefamily.net version: 0.1

RUN apt-get update && apt-get dist-upgrade -yf && apt-get clean && apt-get autoremove
RUN apt-get install -y git subversion axel wget zip unzip libssl-dev libgflags-dev

# --- 
# GNURadio 

RUN mkdir /gnuradio
WORKDIR /gnuradio

RUN axel http://www.sbrac.org/files/build-gnuradio && chmod a+x ./build-gnuradio && printf "y\ny\ny\ny\n" | ./build-gnuradio -ja
RUN echo "export PYTHONPATH=/usr/local/lib/python2.7/dist-packages" > ~/.bashrc
RUN git clone git://git.code.sf.net/p/gnss-sdr/cttc gnss-sdr && cd gnss-sdr/build && git checkout next && cmake ../ && make && make install

ENTRYPOINT      ["/bin/bash"]
