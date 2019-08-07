FROM golang:1.7-alpine

ENV GIT_COMMIT 8b3cd66cfe2433e2e998c46a618eb09f732c2c2c
ENV CERTSTRAP_VERSION 0.1.0

RUN apk add --no-cache git bash openssl curl ca-certificates \
  && go get -d github.com/square/certstrap \
  && cd ${GOPATH}/src/github.com/square/certstrap \
  && git checkout ${GIT_COMMIT} \
  && ./build \
  && cp bin/certstrap /usr/local/bin \
  && apk del git bash
