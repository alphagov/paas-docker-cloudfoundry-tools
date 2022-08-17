FROM ghcr.io/alphagov/paas/ruby:main

RUN apt-get update \
    && apt-get install -y \
        build-essential \
        libffi-dev \
        git \
        libcurl4-openssl-dev \
        nodejs \
    && gem install \
        middleman
