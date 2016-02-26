FROM alpine:3.3

ENV PACKAGES "postgresql-client=9.4.6-r0"

RUN apk add --update $PACKAGES && rm -rf /var/cache/apk/*
