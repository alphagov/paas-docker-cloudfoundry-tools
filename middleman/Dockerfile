FROM ghcr.io/alphagov/paas/ruby:main

RUN apt update \
    && apt install -y \
    build-essential \
    libffi-dev \
    git \
    libcurl4-openssl-dev \
    nodejs

RUN gem install concurrent-ruby -v 1.3.4
RUN gem install middleman
