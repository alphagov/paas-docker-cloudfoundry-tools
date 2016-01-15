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

ENV BOSH_AWS_CPI_URL https://bosh.io/d/github.com/cloudfoundry-incubator/bosh-aws-cpi-release?v=36
ENV BOSH_AWS_CPI_CHECKSUM db2a6c6cdd5ff9f77bf083e10118fa72e1f5e181

COPY bosh_init_cache /tmp/bosh_init_cache/
RUN /tmp/bosh_init_cache/seed_bosh_init_cache.sh && \
    rm -rf /tmp/bosh_init_cache
