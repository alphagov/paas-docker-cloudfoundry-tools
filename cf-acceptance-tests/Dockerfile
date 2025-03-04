FROM ghcr.io/alphagov/paas/ubuntu:main

RUN wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc > /etc/apt/trusted.gpg.d/ACCC4CF8.asc \
  && echo "deb http://apt.postgresql.org/pub/repos/apt/ jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt update && apt install -y \
  build-essential \
  openssh-client \
  unzip \
  python3-pip \
  jq \
  git \
  fossil \
  mercurial \
  bzr \
  subversion \
  postgresql-12 \
  postgresql-client-12

ENV GOPATH /go
ENV PATH /go/bin:/usr/local/go/bin:$PATH

ENV GO_VERSION "1.24.0"
ENV CF_CLI_VERSION "8.10.0"
ENV CF_LOG_CACHE_VERSION "6.2.1"

RUN \
  wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz -P /tmp && \
  tar xzvf /tmp/go${GO_VERSION}.linux-amd64.tar.gz -C /usr/local && \
  mkdir $GOPATH && \
  rm -rf /tmp/*

RUN go install github.com/onsi/ginkgo/v2/ginkgo@latest

# Install the cf CLI
RUN wget -q -O cf.deb "https://packages.cloudfoundry.org/stable?release=debian64&version=${CF_CLI_VERSION}&source=github-rel" && \
  dpkg -i cf.deb && \
  rm -f cf.deb

# Setup plugins
ENV CF_PLUGIN_HOME /root/

# Install the log-cache-cli plugin
RUN cf install-plugin -f "https://github.com/cloudfoundry/log-cache-cli/releases/download/v${CF_LOG_CACHE_VERSION}/log-cache-cf-plugin-linux"

# Install the AWS-CLI
RUN pip install awscli=="1.29.79"
