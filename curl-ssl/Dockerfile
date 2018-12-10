FROM alpine:3.3

ENV PACKAGES "gettext curl openssl ca-certificates"

RUN apk add --update $PACKAGES && rm -rf /var/cache/apk/*
