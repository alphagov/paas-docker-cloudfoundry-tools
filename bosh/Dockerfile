FROM ruby:2.6-alpine3.9

ENV BOSH_CLI_VERSION 5.2.1
ENV BOSH_CLI_SUM 89916f4b499f46037e7217ffceda0f1a352006b8
ENV BOSH_CLI_FILENAME bosh-cli-${BOSH_CLI_VERSION}-linux-amd64

RUN apk add --no-cache wget bash openssl openssh-client file git netcat-openbsd

RUN wget -nv https://s3.amazonaws.com/bosh-cli-artifacts/${BOSH_CLI_FILENAME} \
  && echo "${BOSH_CLI_SUM}  ${BOSH_CLI_FILENAME}" | sha1sum -c - \
  && chmod +x ${BOSH_CLI_FILENAME} \
  && mv ${BOSH_CLI_FILENAME} /usr/local/bin/bosh

COPY startup.sh /startup.sh

ENTRYPOINT ["/startup.sh"]
CMD []
