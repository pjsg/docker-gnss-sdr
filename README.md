This is a Dockerfile for building GNURadio 3.7.1 and particulary gnss-sdr:

- uhd (003.008.000-release)
- rtl-sdr
- hackrf
- gr-iqba
- bladeRF
- gr-osmosdr
- gr-baz
- gr-extras
- gnss-sdr

----------
**BUILD**

To build an image with this file simply use:

    $ git clone https://github.com/pjsg/docker-gnss-sdr.git
    $ cd docker-gnss-sdr 
    $ docker build -t n1dq/gnss-sdr .

----------

**DEPLOY**

A pre-build image of this dockerfile can be found at https://registry.hub.docker.com/u/n1dq/gnss-sdr
   
    $ docker pull n1dq/gnss-sdr
    $ docker run -t -i --privileged -v /dev/bus/usb:/dev/bus/usb n1dq/gnss-sdr /bin/bash
