# http3-quic-example

Minimal example of HTTP/3 and QUIC.

## Server Implementation

The server is implemented as Nginx configuration in Docker.
Nginx is built with BoringSSL for QUIC support.
Uses local, self-signed certs. Listens for QUIC requests on port `8000`.

See `Dockerfile` and configs in `nginx/` for details.

## Client Implementation

The client is implemented in Go, using the `quic-go` library.
Ignores SSL validation for local requests.

See `cmd/client/main.go` for details.
