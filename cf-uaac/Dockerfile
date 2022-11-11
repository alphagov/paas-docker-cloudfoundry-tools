FROM ghcr.io/alphagov/paas/ruby-base:main

RUN apk add --no-cache musl-dev gcc make g++

RUN gem install cf-uaac -v 4.7.0 --no-document
