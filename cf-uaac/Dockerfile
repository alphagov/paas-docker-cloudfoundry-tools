FROM ruby:2.5-alpine

# TODO: remove after https://github.com/docker-library/ruby/pull/209 was fixed.
ENV PATH "/usr/local/bundle/bin:${PATH}"

RUN apk add --update musl-dev gcc make g++ && rm -rf /var/cache/apk/*

RUN gem install cf-uaac -v 3.2.0 --no-rdoc --no-ri
