#FROM nginx:1.27
FROM docker.io/denji/nginx-boringssl:stable-alpine
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
RUN apk add openssl
RUN mkdir /etc/nginx/certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=US/ST=XX/L=XX/O=XX/CN=www.example.local" -keyout /etc/nginx/certs/nginx.key -out /etc/nginx/certs/nginx.crt
