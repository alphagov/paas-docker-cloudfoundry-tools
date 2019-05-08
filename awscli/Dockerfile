FROM governmentpaas/curl-ssl

ENV AWSCLI_VERSION "1.16.154"
ENV PACKAGES "groff less python py-pip jq"

RUN apk add --no-cache $PACKAGES \
    && pip install awscli==$AWSCLI_VERSION \
    && apk --purge -v del py-pip
