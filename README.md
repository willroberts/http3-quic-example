# http3-quic-example

Minimal example of HTTP/3 and QUIC.

## Server Implementation

The server is implemented as Nginx configuration in Docker.
Nginx is built with BoringSSL for QUIC support.
Listens for QUIC requests on port `8000` using local, self-signed certs.

Run the server with `make server`. See `Dockerfile`, `nginx/nginx.conf`, and `nginx/default.conf` for details.

## Client Implementation

The client is implemented in Go, using the `quic-go` library.
Ignores SSL validation for local requests.

Run the client with `make client`. See `cmd/client/main.go` for details.
