FROM ruby:2.2-alpine

RUN gem install bosh_cli -v 1.3192.0 --no-rdoc --no-ri

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*
