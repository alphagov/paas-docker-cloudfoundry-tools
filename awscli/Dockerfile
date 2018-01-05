FROM governmentpaas/curl-ssl

ENV AWSCLI_VERSION "1.14.10"
ENV PACKAGES "groff less python py-pip jq=1.5-r1"

RUN apk add --update $PACKAGES \
    && pip install awscli==$AWSCLI_VERSION \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*
