FROM alpine:3.12

LABEL org.opencontainers.image.source https://github.com/alphagov/paas-docker-cloudfoundry-tools

ENV PACKAGES "jq gettext curl openssl ca-certificates"

RUN apk add --no-cache $PACKAGES
