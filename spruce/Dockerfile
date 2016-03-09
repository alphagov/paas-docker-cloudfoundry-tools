FROM golang:1.5.1-alpine

ENV SPRUCE_VERSION 0.13.0

RUN apk add --update git \
  && go get -d github.com/geofffranks/spruce \
  && cd ${GOPATH}/src/github.com/geofffranks/spruce \
  && git checkout v${SPRUCE_VERSION} \
  && export GOPATH=$(pwd)/Godeps/_workspace:$GOPATH \
  && go install \
  && apk del git \
  && rm -rf /var/cache/apk/*
