FROM ghcr.io/alphagov/paas/curl-ssl:main

ENV AWSCLI_VERSION "1.19.112"

RUN apk add --no-cache \
        groff~1.22.4-r1 \
        less>=590-r0 \
        python3~3.10 \
        py3-pip~22 \
        openssh \
    && pip3 install \
        awscli==$AWSCLI_VERSION \
        pyyaml==5.3.1
