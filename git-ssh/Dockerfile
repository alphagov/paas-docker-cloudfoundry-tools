FROM ghcr.io/alphagov/paas/alpine:main

RUN apk add --no-cache \
        git=2.36.1-r0 \
        openssl=1.1.1o-r0 \
        curl=7.83.1-r1 \
        openssh-client=9.0_p1-r1 \
        gnupg=2.2.35-r3 \
        bash=5.1.16-r2

RUN mkdir -p /root/.ssh \
    && git config --global user.email "git-ssh@governmentpaas.docker"  \
    && git config --global user.name "Docker container git-ssh"
