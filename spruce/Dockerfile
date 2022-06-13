FROM ghcr.io/alphagov/paas/alpine:main

ENV SPRUCE_VERSION 1.27.0

RUN apk add --no-cache \
        wget=1.21.3-r0 \
    && wget https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
    && chmod +x spruce-linux-amd64 \
    && mv spruce-linux-amd64 /usr/local/bin/spruce \
    && apk del wget ca-certificates
