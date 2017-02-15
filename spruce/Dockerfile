FROM alpine:3.4

ENV SPRUCE_VERSION 1.8.9

RUN apk add --update wget ca-certificates \
  && wget https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
  && chmod +x spruce-linux-amd64 \
  && mv spruce-linux-amd64 /usr/local/bin/spruce \
  && apk del wget ca-certificates \
  && rm -rf /var/cache/apk/*
