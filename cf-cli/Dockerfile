FROM ruby:2.6-alpine3.9

ENV PACKAGES "unzip curl openssl ca-certificates git libc6-compat bash jq gettext"
ENV CF_CLI_VERSION "7.0.0-beta.25"
ENV SPRUCE_VERSION "1.17.0"

RUN apk add --no-cache $PACKAGES

RUN curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -zx -C /tmp
RUN cp /tmp/cf7 /usr/local/bin/cf

RUN curl -Lo /usr/local/bin/spruce https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
  && chmod +x /usr/local/bin/spruce
