FROM alpine:3.3

ENV PACKAGES "git openssh-client gnupg"

RUN apk add --update $PACKAGES && rm -rf /var/cache/apk/*
