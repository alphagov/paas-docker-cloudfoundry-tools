FROM ruby:2.7-alpine3.11

LABEL org.opencontainers.image.source https://github.com/alphagov/paas-docker-cloudfoundry-tools

ENV PACKAGES "unzip curl openssl ca-certificates git libc6-compat bash jq gettext make"
ENV CF_CLI_VERSION "7.2.0"
ENV SPRUCE_VERSION "1.27.0"

RUN apk add --no-cache $PACKAGES

RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -zx -C /usr/local/bin

RUN cf install-plugin -f -r CF-Community app-autoscaler-plugin

RUN curl -Lo /usr/local/bin/spruce https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
  && chmod +x /usr/local/bin/spruce
