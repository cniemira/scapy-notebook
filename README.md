# scapy-notebook

A docker image containing the jupyter notebook, python 3, the scipy stack, scapy, and scapy's tls layer. Useful for 

* Based on jupyter/scipy-notebook
* Includes [scapy3k](https://github.com/phaethon/scapy/)
* Includes [scapy3k-ssl_tls](https://github.com/cniemira/scapy-ssl_tls-python3)

To test, fire up the notebook server and test:

	from scapy.layers.ssl_tls import *
	import socket

	s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
	s.connect(('google.com', 443))
	p = TLSRecord()/TLSHandshake()/TLSClientHello(cipher_suites=[TLSCipherSuite.RSA_WITH_AES_128_CBC_SHA])
	s.sendall(bytes(p))
	r=s.recv(1024*8)
	print("received, %d"%(len(r)))
	s.close()
	res = TLS(r)

	res.show()
