FROM golang:1.5.1-alpine

ENV SPRUCE_VERSION 0.12.0

RUN apk add --update git \
  && go get -d github.com/geofffranks/spruce \
  && cd ${GOPATH}/src/github.com/geofffranks/spruce \
  && git checkout v${SPRUCE_VERSION} \
  && go install \
  && apk del git \
  && rm -rf /var/cache/apk/*
