FROM ubuntu:20.04

ENV GIT_COMMIT bd8b02aa8c1b81bc5cfc070722a1a894a348f00a
ENV CERTSTRAP_VERSION 1.2.0

RUN apt update && apt install -y openssl curl ca-certificates wget \
  && wget -O certstrap https://github.com/square/certstrap/releases/download/v${CERTSTRAP_VERSION}/certstrap-${CERTSTRAP_VERSION}-linux-amd64 \
  && chmod +x certstrap \
  && cp certstrap /usr/local/bin/
