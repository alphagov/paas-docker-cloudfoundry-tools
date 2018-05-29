FROM ubuntu:trusty

RUN \
  apt-get update && \
  apt-get -y install \
    build-essential \
    wget \
    curl \
    openssh-client \
    unzip \
    git \
  && rm -rf /var/lib/apt/lists/*

ENV GOPATH /go
ENV PATH /go/bin:/usr/local/go/bin:$PATH
RUN \
  wget https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz -P /tmp && \
  tar xzvf /tmp/go1.9.linux-amd64.tar.gz -C /usr/local && \
  mkdir $GOPATH && \
  rm -rf /tmp/*

RUN go get github.com/tools/godep
RUN go get github.com/onsi/ginkgo/ginkgo

# Install the cf CLI
RUN wget -q -O cf.deb "https://cli.run.pivotal.io/stable?release=debian64&version=6.36.0&source=github-rel" && \
    dpkg -i cf.deb && \
    rm -f cf.deb

# Setup plugins
ENV CF_PLUGIN_HOME /root/

# Install the container networking CLI plugin
RUN cf install-plugin -f "https://github.com/cloudfoundry-incubator/netman-release/releases/download/v0.11.0/network-policy-plugin-linux64"

# Install the log-cache-cli plugin
RUN cf install-plugin -f https://github.com/cloudfoundry/log-cache-cli/releases/download/v1.1.0/log-cache-cf-plugin-linux
