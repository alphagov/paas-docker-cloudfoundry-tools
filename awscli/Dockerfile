FROM governmentpaas/curl-ssl

ENV AWSCLI_VERSION "1.17.2"
ENV PACKAGES "groff less python3 py-pip jq"

RUN apk add --no-cache $PACKAGES \
    && pip3 install awscli==$AWSCLI_VERSION
