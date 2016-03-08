FROM alpine:3.3

ENV SPRUCE_VERSION 1.1.2

ENV PACKAGES "curl openssl ca-certificates"

RUN apk add --update $PACKAGES \
  && curl -f -L https://github.com/geofffranks/spruce/releases/download/v$SPRUCE_VERSION/spruce-linux-amd64 > /usr/local/bin/spruce \
  && chmod +x /usr/local/bin/spruce \
  && apk del $PACKAGES \
  && rm -rf /var/cache/apk/*
