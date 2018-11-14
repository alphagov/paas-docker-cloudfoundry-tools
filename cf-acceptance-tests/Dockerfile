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
    python-pip \
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
RUN wget -q -O cf.deb "https://cli.run.pivotal.io/stable?release=debian64&version=6.39.1&source=github-rel" && \
    dpkg -i cf.deb && \
    rm -f cf.deb

# Setup plugins
ENV CF_PLUGIN_HOME /root/

# Install the log-cache-cli plugin
RUN cf install-plugin -f https://github.com/cloudfoundry/log-cache-cli/releases/download/v2.0.0/log-cache-cf-plugin-linux

# Install the AWS-CLI
RUN pip install awscli=="1.14.10"
