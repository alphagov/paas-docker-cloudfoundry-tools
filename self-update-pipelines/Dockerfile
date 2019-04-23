FROM ruby:2.6-slim

ENV AWSCLI_VERSION "1.16.140"
ENV PACKAGES make python-setuptools python-pip groff less curl

RUN apt-get update \
      && apt-get install -y --no-install-recommends $PACKAGES \
      && rm -rf /var/lib/apt/lists/* \
      && pip install awscli==$AWSCLI_VERSION
