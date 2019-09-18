FROM ruby:2.6-alpine3.9

ENV CREDHUB_CLI_VERSION 2.4.0
ENV CREDHUB_CLI_SUM 73edaf1ee47323c4f0aa455bcc17303a73c0cf2a6d9156542f1f6b7b1b1aa3db
ENV CREDHUB_CLI_FILENAME credhub-linux-${CREDHUB_CLI_VERSION}.tgz

RUN apk add --no-cache wget bash openssl openssh-client file git netcat-openbsd vim libc6-compat jq

RUN wget -nv https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} \
  && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
  && tar zxvf ${CREDHUB_CLI_FILENAME} \
  && chmod +x credhub \
  && mv credhub /usr/local/bin/credhub

COPY startup.sh /startup.sh

ENTRYPOINT ["/startup.sh"]
