FROM alpine:3.7

ENV PACKAGES "postgresql-client"

RUN apk add --update $PACKAGES && rm -rf /var/cache/apk/*
