FROM orangecloudfoundry/curl-ssl

ENV AWSCLI_VERSION "1.18.140"
ENV PACKAGES "groff less python3 py-pip jq"

RUN apk add --no-cache $PACKAGES \
    && pip3 install awscli==$AWSCLI_VERSION
