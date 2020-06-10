FROM ruby:2.7-alpine3.11

ENV PACKAGES "unzip curl openssl ca-certificates git libc6-compat bash jq gettext"

ENV CF_CLI_VERSION "7.0.0-beta.25"

ENV CF_CONDUIT_VERSION "v0.0.8"
ENV CF_CONDUIT_CHECKSUM "716d64a442f1b9ee7fe12497c58a67cc72ff742f"
ENV CF_CONDUIT_TEMPFILE "/tmp/cf-conduit.linux.amd64"

ENV SPRUCE_VERSION "1.22.0"

RUN apk add --no-cache $PACKAGES

RUN curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -zx -C /tmp
RUN cp /tmp/cf7 /usr/local/bin/cf
RUN ln -sf /usr/local/bin/cf /usr/local/bin/cf7

RUN curl -L -o "${CF_CONDUIT_TEMPFILE}" \
  "https://github.com/alphagov/paas-cf-conduit/releases/download/${CF_CONDUIT_VERSION}/cf-conduit.linux.amd64" \
  && echo "${CF_CONDUIT_CHECKSUM}  ${CF_CONDUIT_TEMPFILE}" | sha1sum -c - \
  && chmod +x "${CF_CONDUIT_TEMPFILE}" \
  && cf install-plugin -f "${CF_CONDUIT_TEMPFILE}" \
  && rm "${CF_CONDUIT_TEMPFILE}"

RUN curl -Lo /usr/local/bin/spruce https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
  && chmod +x /usr/local/bin/spruce
