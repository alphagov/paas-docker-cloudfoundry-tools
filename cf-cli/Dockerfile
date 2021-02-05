FROM ruby:2.7-alpine3.11

ENV PACKAGES "python3 unzip curl openssl ca-certificates git libc6-compat bash jq gettext make"
ENV CF_CLI_VERSION "6.53.0"

RUN apk update
RUN apk add --no-cache $PACKAGES

RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -zx -C /usr/local/bin

RUN pip3 install --no-cache-dir --upgrade pip 
RUN pip3 install --no-cache-dir awscli
