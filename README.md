# http3-quic-example

Minimal examples of HTTP/3 and QUIC.

## Server Implementation

There are server implementations in both pure Go and as an Nginx configuration.
Both listen for QUIC requests on port `8000` using local, self-signed certs.

Run the server with `make server` or `make nginx`.

## Client Implementation

The client is implemented in Go, using the `quic-go` library. Ignores SSL
validation for local requests.

Run the client with `make client`.
