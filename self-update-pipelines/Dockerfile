FROM ruby:3.1-slim-buster

ENV AWSCLI_VERSION "1.19.112"
ENV PACKAGES make python-setuptools python-pip groff less curl

RUN apt-get update \
      && apt-get install -y --no-install-recommends $PACKAGES \
      && rm -rf /var/lib/apt/lists/* \
      && pip install awscli==$AWSCLI_VERSION
