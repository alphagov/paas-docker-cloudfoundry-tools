FROM ruby:2.5-alpine

RUN apk add --update musl-dev gcc make g++ && rm -rf /var/cache/apk/*

RUN gem install cf-uaac -v 3.2.0 --no-rdoc --no-ri
