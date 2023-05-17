FROM ghcr.io/alphagov/paas/ubuntu:main

ENV GIT_COMMIT 1377eabdd8242bc353dcebf879a3b077413036c2
ENV CERTSTRAP_VERSION 1.3.0

RUN wget -O certstrap https://github.com/square/certstrap/releases/download/v${CERTSTRAP_VERSION}/certstrap-linux-amd64 \
    && chmod +x certstrap \
    && cp certstrap /usr/local/bin/