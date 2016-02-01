FROM golang:1.5.3-alpine

ENV GIT_COMMIT 8b3cd66cfe2433e2e998c46a618eb09f732c2c2c
ENV CERTSTRAP_VERSION 0.1.0

RUN apk add --update git bash openssl \
  && go get -d github.com/square/certstrap \
  && cd ${GOPATH}/src/github.com/square/certstrap \
  && git checkout ${GIT_COMMIT} \
  && ./build \
  && cp bin/certstrap /usr/local/bin \
  && apk del git bash \
  && rm -rf /var/cache/apk/* ${GOPATH}
