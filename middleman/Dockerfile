FROM ruby:2.7-slim

LABEL org.opencontainers.image.source https://github.com/alphagov/paas-docker-cloudfoundry-tools

RUN apt-get update && apt-get install -y build-essential libffi-dev git libcurl4-openssl-dev nodejs && gem install middleman
