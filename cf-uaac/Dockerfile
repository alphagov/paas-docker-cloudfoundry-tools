FROM ruby:2.7-alpine3.11

LABEL org.opencontainers.image.source https://github.com/alphagov/paas-docker-cloudfoundry-tools

# TODO: remove after https://github.com/docker-library/ruby/pull/209 was fixed.
ENV PATH "/usr/local/bundle/bin:${PATH}"

RUN apk add --no-cache musl-dev gcc make g++

RUN gem install cf-uaac -v 3.2.0 --no-document
