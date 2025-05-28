FROM golang:1.24-alpine

RUN apk add openssl
RUN mkdir /etc/certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=US/ST=XX/L=XX/O=XX/CN=www.example.local" -keyout /etc/certs/ssl.key -out /etc/certs/ssl.crt

RUN mkdir /app
COPY . /app
WORKDIR /app
RUN go mod tidy

ENTRYPOINT go run cmd/server/main.go
