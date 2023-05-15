FROM ghcr.io/alphagov/paas/alpine:main

RUN apk add --no-cache \
        git~2 \
        curl~8 \
        openssh-client-default~9 \
        gnupg~2.2 \
        bash~5.1

RUN mkdir -p /root/.ssh \
    && git config --global user.email "git-ssh@governmentpaas.docker"  \
    && git config --global user.name "Docker container git-ssh"
