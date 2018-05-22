FROM ruby:2.5-alpine

ENV BOSH_CLI_VERSION 3.0.1
ENV BOSH_CLI_SUM ccc893bab8b219e9e4a628ed044ebca6c6de9ca0
ENV BOSH_CLI_FILENAME bosh-cli-${BOSH_CLI_VERSION}-linux-amd64

RUN apk add --update wget bash openssl openssh-client file git netcat-openbsd \
   && rm -rf /var/cache/apk/*

RUN wget -nv https://s3.amazonaws.com/bosh-cli-artifacts/${BOSH_CLI_FILENAME} \
  && echo "${BOSH_CLI_SUM}  ${BOSH_CLI_FILENAME}" | sha1sum -c - \
  && chmod +x ${BOSH_CLI_FILENAME} \
  && mv ${BOSH_CLI_FILENAME} /usr/local/bin/bosh

COPY startup.sh /startup.sh

ENTRYPOINT ["/startup.sh"]
CMD []
