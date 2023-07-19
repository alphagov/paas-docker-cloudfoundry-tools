FROM ghcr.io/alphagov/paas/curl-ssl:main

ENV AWSCLI_VERSION "1.19.112"

RUN apk add --no-cache \
        groff~1.22.4-r1 \
        less>=590-r0 \
        python3~3.10 \
        py3-pip~22 \
    && pip3 install --upgrade pip \
        awscli==$AWSCLI_VERSION
