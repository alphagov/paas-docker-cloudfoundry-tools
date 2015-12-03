FROM ubuntu:14.04

ENV BOSH_INIT_VERSION 0.0.80
ENV BOSH_INIT_URL https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-${BOSH_INIT_VERSION}-linux-amd64
ENV BOSH_INIT_PACKAGES "build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt1-dev libxml2-dev \
    libssl-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev sqlite3"

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y --no-install-recommends ${BOSH_INIT_PACKAGES}
RUN apt-get install -y wget

RUN wget -q -O /usr/local/bin/bosh-init --no-check-certificate ${BOSH_INIT_URL}
RUN chmod +x /usr/local/bin/bosh-init
