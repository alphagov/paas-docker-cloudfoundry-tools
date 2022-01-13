FROM ruby:2.7-slim-buster

ENV BOSH_CLI_VERSION 6.4.11
ENV BOSH_CLI_SUM ea3960f25c561346ab073c3d2133b9e5d35a62f1cd39cdcb986bff45c0ab0536
ENV BOSH_CLI_FILENAME bosh-cli-${BOSH_CLI_VERSION}-linux-amd64

ENV DEBIAN_PACKAGES "ca-certificates wget git openssh-client file jq"

# https://bosh.io/docs/cli-env-deps.html
ENV BOSH_ENV_DEPS "build-essential zlibc zlib1g-dev openssl libxslt1-dev \
  libxml2-dev libssl-dev libreadline7 libreadline-dev libyaml-dev libsqlite3-dev sqlite3"

ENV BOSH_AWS_CPI_URL https://bosh.io/d/github.com/cloudfoundry/bosh-aws-cpi-release?v=87
ENV BOSH_AWS_CPI_CHECKSUM a920cd1bdead3d6167273e763912becca2225ba6

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends ${DEBIAN_PACKAGES} \
  && apt-get install -y --no-install-recommends ${BOSH_ENV_DEPS} \
  && rm -rf /var/lib/apt/lists/*

RUN wget -nv https://s3.amazonaws.com/bosh-cli-artifacts/${BOSH_CLI_FILENAME} \
  && echo "${BOSH_CLI_SUM}  ${BOSH_CLI_FILENAME}" | sha256sum -c - \
  && chmod +x ${BOSH_CLI_FILENAME} \
  && mv ${BOSH_CLI_FILENAME} /usr/local/bin/bosh


ENV CREDHUB_CLI_VERSION 2.9.1
ENV CREDHUB_CLI_SUM df8aa256d4563d741bda71e4e0baff077addce8438dba4f9157504b387b93d9f
ENV CREDHUB_CLI_FILENAME credhub-linux-${CREDHUB_CLI_VERSION}.tgz

RUN wget -nv https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} \
  && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
  && tar zxvf ${CREDHUB_CLI_FILENAME} \
  && chmod +x credhub \
  && mv credhub /usr/local/bin/credhub

ENV YQ_VERSION 4.9.6
ENV YQ_SUM a1cfa39a9538e27f11066aa5659b32f9beae1eea93369d395bf45bcfc8a181dc
ENV YQ_FILENAME yq_linux_amd64

RUN wget -nv https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/${YQ_FILENAME} \
  && echo "${YQ_SUM}  ${YQ_FILENAME}" | sha256sum -c - \
  && chmod +x ${YQ_FILENAME} \
  && mv ${YQ_FILENAME} /usr/local/bin/yq
