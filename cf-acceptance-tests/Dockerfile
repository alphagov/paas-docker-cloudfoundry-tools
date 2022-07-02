FROM ubuntu:xenial

RUN \
  apt-get update && \
  apt-get -y install \
    build-essential \
    wget \
    curl \
    openssh-client \
    unzip \
    python-pip \
    jq \
    git fossil mercurial bzr subversion \
  && rm -rf /var/lib/apt/lists/*

ENV GOPATH /go
ENV PATH /go/bin:/usr/local/go/bin:$PATH

ENV GO_VERSION "1.17"
ENV CF_CLI_VERSION "7.4.0"
ENV CF_LOG_CACHE_VERSION "2.1.0"

RUN \
  wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz -P /tmp && \
  tar xzvf /tmp/go${GO_VERSION}.linux-amd64.tar.gz -C /usr/local && \
  mkdir $GOPATH && \
  rm -rf /tmp/*

RUN go get github.com/onsi/ginkgo/v2 && \
    go install -mod=mod github.com/onsi/ginkgo/v2/ginkgo@latest

# Install the cf CLI
RUN wget -q -O cf.deb "https://packages.cloudfoundry.org/stable?release=debian64&version=${CF_CLI_VERSION}&source=github-rel" && \
    dpkg -i cf.deb && \
    rm -f cf.deb

# Setup plugins
ENV CF_PLUGIN_HOME /root/

# Install the log-cache-cli plugin
RUN cf install-plugin -f "https://github.com/cloudfoundry/log-cache-cli/releases/download/v${CF_LOG_CACHE_VERSION}/log-cache-cf-plugin-linux"

# Install the AWS-CLI
RUN pip install awscli=="1.14.10"
