FROM ruby:3.4-slim

RUN apt update \
    && apt install -y \
    build-essential \
    libffi-dev \
    git \
    libcurl4-openssl-dev \
    nodejs

RUN gem install concurrent-ruby -v 1.3.4
RUN gem install middleman
