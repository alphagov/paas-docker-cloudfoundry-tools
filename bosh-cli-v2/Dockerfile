FROM ruby:2.7-slim

ENV BOSH_CLI_VERSION 6.2.1
ENV BOSH_CLI_SUM ca7580008abfd4942dcb1dd6218bde04d35f727717a7d08a2bc9f7d346bce0f6
ENV BOSH_CLI_FILENAME bosh-cli-${BOSH_CLI_VERSION}-linux-amd64

ENV DEBIAN_PACKAGES "ca-certificates wget git openssh-client file"

# https://bosh.io/docs/cli-env-deps.html
ENV BOSH_ENV_DEPS "build-essential zlibc zlib1g-dev openssl libxslt1-dev \
  libxml2-dev libssl-dev libreadline7 libreadline-dev libyaml-dev libsqlite3-dev sqlite3"

ENV BOSH_AWS_CPI_URL https://bosh.io/d/github.com/cloudfoundry/bosh-aws-cpi-release?v=82
ENV BOSH_AWS_CPI_CHECKSUM 1a4826469e715f5595de38a15df7b7f511fbfe85

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends ${DEBIAN_PACKAGES} \
  && apt-get install -y --no-install-recommends ${BOSH_ENV_DEPS} \
  && rm -rf /var/lib/apt/lists/*

RUN wget -nv https://s3.amazonaws.com/bosh-cli-artifacts/${BOSH_CLI_FILENAME} \
  && echo "${BOSH_CLI_SUM}  ${BOSH_CLI_FILENAME}" | sha256sum -c - \
  && chmod +x ${BOSH_CLI_FILENAME} \
  && mv ${BOSH_CLI_FILENAME} /usr/local/bin/bosh

COPY bosh_init_cache /tmp/bosh_init_cache/
RUN /tmp/bosh_init_cache/seed_bosh_init_cache.sh && \
    rm -rf /tmp/bosh_init_cache

ENV CREDHUB_CLI_VERSION 2.7.0
ENV CREDHUB_CLI_SUM a453c937caedbd15c30a348a6fd4a717bb321ce7c077d137ef2ea28eb8befb8b
ENV CREDHUB_CLI_FILENAME credhub-linux-${CREDHUB_CLI_VERSION}.tgz

RUN wget -nv https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} \
  && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
  && tar zxvf ${CREDHUB_CLI_FILENAME} \
  && chmod +x credhub \
  && mv credhub /usr/local/bin/credhub
