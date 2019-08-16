FROM ruby:2.6-alpine3.9

ENV BOSH_CLI_VERSION 5.5.1
ENV BOSH_CLI_SUM 34e9898c244655ccbce2dc657b7d1df52e487cfd
ENV BOSH_CLI_FILENAME bosh-cli-${BOSH_CLI_VERSION}-linux-amd64

ENV CREDHUB_CLI_VERSION 2.4.0
ENV CREDHUB_CLI_SUM 73edaf1ee47323c4f0aa455bcc17303a73c0cf2a6d9156542f1f6b7b1b1aa3db
ENV CREDHUB_CLI_FILENAME credhub-linux-${CREDHUB_CLI_VERSION}.tgz

RUN apk add --no-cache wget bash openssl openssh-client file git netcat-openbsd vim libc6-compat

RUN wget -nv https://s3.amazonaws.com/bosh-cli-artifacts/${BOSH_CLI_FILENAME} \
  && echo "${BOSH_CLI_SUM}  ${BOSH_CLI_FILENAME}" | sha1sum -c - \
  && chmod +x ${BOSH_CLI_FILENAME} \
  && mv ${BOSH_CLI_FILENAME} /usr/local/bin/bosh

RUN wget -nv https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} \
  && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
  && tar zxvf ${CREDHUB_CLI_FILENAME} \
  && chmod +x credhub \
  && mv credhub /usr/local/bin/credhub

COPY startup.sh /startup.sh

ENTRYPOINT /startup.sh
