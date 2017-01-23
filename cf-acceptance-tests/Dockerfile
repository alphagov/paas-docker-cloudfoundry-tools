FROM golang:1.6-alpine

RUN apk add --update curl unzip git bash && apk update && apk upgrade && rm -rf /var/cache/apk/*
RUN curl -L 'https://cli.run.pivotal.io/stable?release=linux64-binary&version=6.21.1' | tar -zx -C /usr/local/bin

RUN go get github.com/tools/godep
RUN go get github.com/onsi/ginkgo/ginkgo
