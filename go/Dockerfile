FROM golang:1.9-alpine

ADD https://github.com/golang/dep/releases/download/v0.3.2/dep-linux-amd64 /usr/local/bin/dep

RUN chmod +x /usr/local/bin/dep

RUN apk add --update git && rm -rf /var/cache/apk/*
RUN go get github.com/onsi/ginkgo/ginkgo
