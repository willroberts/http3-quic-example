docker:
	docker build -t nginx-http3-quic .
	docker run --rm -p 8000:8000 -p 8000:8000/udp --name nginx-http3-quic nginx-http3-quic
