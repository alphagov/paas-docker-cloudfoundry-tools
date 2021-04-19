FROM alpine:3.12

LABEL org.opencontainers.image.source https://github.com/alphagov/paas-docker-cloudfoundry-tools

ENV PACKAGES "git openssl curl openssh-client gnupg bash"

RUN apk add --no-cache $PACKAGES

RUN mkdir -p /root/.ssh

RUN git config --global user.email "git-ssh@governmentpaas.docker" && \
    git config --global user.name "Docker container git-ssh"
