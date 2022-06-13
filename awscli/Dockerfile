FROM ghcr.io/alphagov/paas/curl-ssl:main

ENV AWSCLI_VERSION "1.18.140"

RUN apk add --no-cache \
        groff=1.22.4-r1 \
        less=590-r0 \
        python3=3.10.4-r0 \
        py3-pip=22.1.1-r0 \
    && pip3 install \
        awscli==$AWSCLI_VERSION
