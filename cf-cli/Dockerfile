FROM ruby:2.6-alpine3.9

ENV PACKAGES "unzip curl openssl ca-certificates git libc6-compat bash jq gettext"
ENV CF_CLI_VERSION "6.45.0"
ENV CF_BGD_VERSION "1.3.0"
ENV CF_BGD_CHECKSUM "c74995ae0ba3ec9eded9c2a555e5984ba536d314cf9dc30013c872eb6b9d76b6"
ENV CF_BGD_TEMPFILE "/tmp/blue-green-deploy.linux64"
ENV CF_AUTOPILOT_VERSION "0.0.4"
ENV CF_AUTOPILOT_CHECKSUM "a755f9da3981fb6dc6aa675a55f8fc7de9d73c87b8cad4883d98c543a45a9922"
ENV CF_AUTOPILOT_TEMPFILE "/tmp/autopilot-linux"
ENV SPRUCE_VERSION "1.17.0"

RUN apk add --no-cache $PACKAGES

RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -zx -C /usr/local/bin

RUN curl -L -o "${CF_BGD_TEMPFILE}" \
  "https://github.com/bluemixgaragelondon/cf-blue-green-deploy/releases/download/v${CF_BGD_VERSION}/blue-green-deploy.linux64" \
  && echo "${CF_BGD_CHECKSUM}  ${CF_BGD_TEMPFILE}" | sha256sum -c - \
  && chmod +x "${CF_BGD_TEMPFILE}" \
  && cf install-plugin -f "${CF_BGD_TEMPFILE}" \
  && rm "${CF_BGD_TEMPFILE}"

RUN curl -L -o "${CF_AUTOPILOT_TEMPFILE}" \
  "https://github.com/contraband/autopilot/releases/download/${CF_AUTOPILOT_VERSION}/autopilot-linux" \
  && echo "${CF_AUTOPILOT_CHECKSUM}  ${CF_AUTOPILOT_TEMPFILE}" | sha256sum -c - \
  && chmod +x "${CF_AUTOPILOT_TEMPFILE}" \
  && cf install-plugin -f "${CF_AUTOPILOT_TEMPFILE}" \
  && rm "${CF_AUTOPILOT_TEMPFILE}"

RUN curl -Lo /usr/local/bin/spruce https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
  && chmod +x /usr/local/bin/spruce
