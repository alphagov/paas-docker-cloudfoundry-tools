FROM ruby:2.2-slim

ENV PACKAGES unzip git

RUN apt-get update \
      && apt-get install -y --no-install-recommends $PACKAGES \
      && rm -rf /var/lib/apt/lists/*

