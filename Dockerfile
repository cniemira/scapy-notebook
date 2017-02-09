FROM jupyter/scipy-notebook
MAINTAINER CJ Niemira <siege@siege.org>
USER root
RUN apt-get -q update
RUN apt-get install -y tcpdump
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN conda install -y pyasn1
RUN conda install -y rsa
RUN conda install -c damianavila82 rise
RUN pip install pem
ENV updated 20170208-2130
RUN git clone https://github.com/phaethon/scapy.git /tmp/scapy
RUN git clone https://github.com/cniemira/scapy-ssl_tls-python3.git /tmp/scapy-ssl_tls-python3
RUN git clone https://github.com/cniemira/py3x509.git /tmp/py3x509
RUN cd /tmp/scapy && /opt/conda/bin/python3 ./setup.py install
RUN cd /tmp/scapy-ssl_tls-python3 && /opt/conda/bin/python3 ./setup.py install
RUN cd /tmp/py3x509 && /opt/conda/bin/python3 ./setup.py install
RUN rm -rf /tmp/*
USER $NB_USER
