FROM ghcr.io/alphagov/paas/bosh-cli-v2:main

ENV AWSCLI_VERSION "1.19.112"

RUN apt-get update && apt-get install -y \
  curl \
  python3 \
  python3-pip \
  && pip3 install \
    awscli==$AWSCLI_VERSION
