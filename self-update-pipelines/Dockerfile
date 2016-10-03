FROM ruby:2.2-slim

ENV AWSCLI_VERSION "1.9.21"
ENV PACKAGES make python-pip groff less curl

RUN apt-get update \
      && apt-get install -y --no-install-recommends $PACKAGES \
      && rm -rf /var/lib/apt/lists/* \
      && pip install awscli==$AWSCLI_VERSION
