.PHONY: client
client:
	go run cmd/client/main.go

.PHONY: server
server:
	docker build -f Dockerfile -t http3-quic .
	docker run --rm -p 8000:8000 -p 8000:8000/udp --name http3-quic http3-quic

.PHONY: nginx
nginx:
	docker build -f Dockerfile.nginx -t nginx-http3-quic .
	docker run --rm -p 8000:8000 -p 8000:8000/udp --name nginx-http3-quic nginx-http3-quic
