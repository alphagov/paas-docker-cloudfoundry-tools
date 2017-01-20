FROM golang:1.7.4-wheezy

RUN curl -L 'https://cli.run.pivotal.io/stable?release=linux64-binary&version=6.21.1' | tar -zx -C /usr/local/bin
RUN apt-get update \
      && apt-get install -y --no-install-recommends unzip \
      && rm -rf /var/lib/apt/lists/*

RUN go get github.com/tools/godep
RUN go get github.com/onsi/ginkgo/ginkgo

# FIXME: Remove this hack after https://github.com/cloudfoundry/cf-acceptance-tests/pull/145#issuecomment-274111140 is fixed
RUN mkdir /bin/old && mv /bin/gzip /bin/old/gzip
COPY gzip /bin
RUN chmod +x /bin/gzip

