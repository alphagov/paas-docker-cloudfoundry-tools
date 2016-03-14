FROM alpine:3.3

ENV PACKAGES "git=2.6.4-r0 openssh-client=7.1_p2-r0"

RUN apk add --update $PACKAGES && rm -rf /var/cache/apk/*
