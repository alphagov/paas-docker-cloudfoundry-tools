FROM golang:1.5.1-alpine

RUN apk update
RUN apk add git \
  && go get github.com/geofffranks/spruce \
  && apk del git
