FROM governmentpaas/bosh-cli-v2:latest

ENV CF_PACKAGES "unzip curl openssl ca-certificates git libc6 bash jq gettext make" # we use libc6 instead of libc6-compat as we do not use alpine base image
ENV CF_CLI_VERSION "7.0.1"
ENV SPRUCE_VERSION "1.25.1"

# we also use apt-get as we use an Ubuntu image, not an Alpine
RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends ${CF_PACKAGES} \
  && rm -rf /var/lib/apt/lists/*

RUN rm -rf ~/.bosh/cache  # Cleanup AWS CPI

RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -zx -C /usr/local/bin

RUN curl -Lo /usr/local/bin/spruce https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
  && chmod +x /usr/local/bin/spruce

