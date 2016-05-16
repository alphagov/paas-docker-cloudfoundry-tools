FROM ruby:2.2-slim

ENV PACKAGES unzip curl ca-certificates git

RUN apt-get update \
      && apt-get install -y --no-install-recommends $PACKAGES \
      && rm -rf /var/lib/apt/lists/*
RUN curl -L 'https://cli.run.pivotal.io/stable?release=linux64-binary&version=6.16.1' | tar -zx -C /usr/local/bin

