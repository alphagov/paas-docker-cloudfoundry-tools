FROM golang:1.7.4-wheezy

RUN curl -L 'https://cli.run.pivotal.io/stable?release=linux64-binary&version=6.21.1' | tar -zx -C /usr/local/bin
RUN apt-get update \
      && apt-get install -y --no-install-recommends unzip \
      && rm -rf /var/lib/apt/lists/*

RUN go get github.com/tools/godep
RUN go get github.com/onsi/ginkgo/ginkgo
