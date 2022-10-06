FROM ghcr.io/alphagov/paas/ruby:main

RUN apt update \
    && apt install -y \
        build-essential \
        libffi-dev \
        git \
        libcurl4-openssl-dev \
        nodejs

RUN gem install \
        middleman
