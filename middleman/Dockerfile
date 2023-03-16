FROM ruby:3.1-slim

RUN apt update \
    && apt install -y \
        build-essential \
        libffi-dev \
        git \
        libcurl4-openssl-dev \
        nodejs

RUN gem install \
        middleman
