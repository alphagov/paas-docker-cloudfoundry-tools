FROM ruby:2.6-slim

ENV BOSH_CLI_VERSION 5.5.1
ENV BOSH_CLI_SUM 34e9898c244655ccbce2dc657b7d1df52e487cfd
ENV BOSH_CLI_FILENAME bosh-cli-${BOSH_CLI_VERSION}-linux-amd64

ENV DEBIAN_PACKAGES "ca-certificates wget git openssh-client file"

# https://bosh.io/docs/cli-env-deps.html
ENV BOSH_ENV_DEPS "build-essential zlibc zlib1g-dev openssl libxslt1-dev \
  libxml2-dev libssl-dev libreadline7 libreadline-dev libyaml-dev libsqlite3-dev sqlite3"

ENV BOSH_AWS_CPI_URL https://bosh.io/d/github.com/cloudfoundry/bosh-aws-cpi-release?v=75
ENV BOSH_AWS_CPI_CHECKSUM a6f32491067eae70f62cb03fc559654708e4f2f3

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends ${DEBIAN_PACKAGES} \
  && apt-get install -y --no-install-recommends ${BOSH_ENV_DEPS} \
  && rm -rf /var/lib/apt/lists/*

RUN wget -nv https://s3.amazonaws.com/bosh-cli-artifacts/${BOSH_CLI_FILENAME} \
  && echo "${BOSH_CLI_SUM}  ${BOSH_CLI_FILENAME}" | sha1sum -c - \
  && chmod +x ${BOSH_CLI_FILENAME} \
  && mv ${BOSH_CLI_FILENAME} /usr/local/bin/bosh

COPY bosh_init_cache /tmp/bosh_init_cache/
RUN /tmp/bosh_init_cache/seed_bosh_init_cache.sh && \
    rm -rf /tmp/bosh_init_cache

ENV CREDHUB_CLI_VERSION 2.4.0
ENV CREDHUB_CLI_SUM 73edaf1ee47323c4f0aa455bcc17303a73c0cf2a6d9156542f1f6b7b1b1aa3db
ENV CREDHUB_CLI_FILENAME credhub-linux-${CREDHUB_CLI_VERSION}.tgz

RUN wget -nv https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} \
  && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
  && tar zxvf ${CREDHUB_CLI_FILENAME} \
  && chmod +x credhub \
  && mv credhub /usr/local/bin/credhub
