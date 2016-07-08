FROM ruby:2.2-alpine

RUN gem install bosh_cli -v 1.3232.0 --no-rdoc --no-ri

RUN apk add --update openssl openssh-client file && rm -rf /var/cache/apk/*
