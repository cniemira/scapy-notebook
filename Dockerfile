FROM jupyter/scipy-notebook
MAINTAINER CJ Niemira <siege@siege.org>
USER root
RUN apt-get -q update
RUN apt-get install -y tcpdump
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENV updated 20170207-1554
RUN git clone https://github.com/phaethon/scapy.git /tmp/scapy
RUN git clone https://github.com/cniemira/scapy-ssl_tls-python3.git /tmp/scapy-ssl_tls-python3
RUN cd /tmp/scapy && /opt/conda/bin/python3 ./setup.py install
RUN cd /tmp/scapy-ssl_tls-python3 && /opt/conda/bin/python3 ./setup.py install
RUN rm -rf /tmp/scapy*
USER $NB_USER
