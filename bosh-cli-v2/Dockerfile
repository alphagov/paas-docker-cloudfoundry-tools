FROM ruby:3.1-slim-buster

ENV BOSH_CLI_VERSION 6.4.17
ENV BOSH_CLI_SUM d0917d3ad0ff544a4c69a7986e710fe48e8cb2207717f77db31905d639e28c18
ENV BOSH_CLI_FILENAME bosh-cli-${BOSH_CLI_VERSION}-linux-amd64

ENV DEBIAN_PACKAGES "ca-certificates wget git openssh-client file jq"

# https://bosh.io/docs/cli-env-deps.html
ENV BOSH_ENV_DEPS "build-essential zlibc zlib1g-dev openssl libxslt1-dev \
  libxml2-dev libssl-dev libreadline7 libreadline-dev libyaml-dev libsqlite3-dev sqlite3"

ENV BOSH_AWS_CPI_URL https://bosh.io/d/github.com/cloudfoundry/bosh-aws-cpi-release?v=97
ENV BOSH_AWS_CPI_CHECKSUM b6aa84bc178e5cc99faa55a89943214c33488d5f

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

ENV CREDHUB_CLI_VERSION 2.9.14
ENV CREDHUB_CLI_SUM 79cf9100fd4e0c9024752b097911406bc73d387c985c72330598ba445eb92bfb
ENV CREDHUB_CLI_FILENAME credhub-linux-${CREDHUB_CLI_VERSION}.tgz

RUN wget -nv https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} \
  && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
  && tar zxvf ${CREDHUB_CLI_FILENAME} \
  && chmod +x credhub \
  && mv credhub /usr/local/bin/credhub

ENV YQ_VERSION 4.26.1
ENV YQ_SUM 9e35b817e7cdc358c1fcd8498f3872db169c3303b61645cc1faf972990f37582
ENV YQ_FILENAME yq_linux_amd64

RUN wget -nv https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/${YQ_FILENAME} \
  && echo "${YQ_SUM}  ${YQ_FILENAME}" | sha256sum -c - \
  && chmod +x ${YQ_FILENAME} \
  && mv ${YQ_FILENAME} /usr/local/bin/yq
