FROM ghcr.io/alphagov/paas/alpine:main

RUN apk add --no-cache \
        git=2.36.2-r0 \
        curl=7.83.1-r2 \
        openssh-client-default=9.0_p1-r2 \
        gnupg=2.2.35-r4 \
        bash=5.1.16-r2

RUN mkdir -p /root/.ssh \
    && git config --global user.email "git-ssh@governmentpaas.docker"  \
    && git config --global user.name "Docker container git-ssh"
