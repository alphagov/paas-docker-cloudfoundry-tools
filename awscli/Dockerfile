FROM governmentpaas/curl-ssl

ENV AWSCLI_VERSION "1.10.38"
ENV PACKAGES "groff less python py-pip"

RUN apk add --update $PACKAGES \
    && pip install awscli==$AWSCLI_VERSION \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*

