FROM alpine:3.4

ENV SPIFF_VERSION 1.0.8

RUN apk add --update wget openssl ca-certificates bash coreutils \
  && wget -O /tmp/spiff_linux_amd64.zip "https://github.com/cloudfoundry-incubator/spiff/releases/download/v${SPIFF_VERSION}/spiff_linux_amd64.zip" \
  && unzip /tmp/spiff_linux_amd64.zip -d /usr/local/bin \
  && chmod +x /usr/local/bin/spiff \
  && apk del wget ca-certificates \
  && rm -rf /var/cache/apk/*
