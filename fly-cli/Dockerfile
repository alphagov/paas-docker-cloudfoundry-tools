FROM alpine:3.3

ENV PACKAGES bash ruby curl ca-certificates
ENV FLY_CLI_URL http://ci.concourse.ci/api/v1/cli?arch=amd64&platform=linux

RUN apk add --update $PACKAGES \
    && rm -rf /var/cache/apk/* \
    && curl -f -L "${FLY_CLI_URL}" > /usr/local/bin/fly \
    && chmod +x /usr/local/bin/fly

