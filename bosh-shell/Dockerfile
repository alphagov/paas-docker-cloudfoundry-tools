FROM ruby:2.2-alpine

RUN gem install bosh_cli -v 1.3262.26.0 --no-rdoc --no-ri

RUN apk add --update bash openssl openssh-client file git && rm -rf /var/cache/apk/*

COPY bosh-ssh /usr/local/bin
COPY bosh_wrapper.sh /usr/local/bin
COPY bosh_wrapper.rc /
COPY startup.sh /startup.sh

ENTRYPOINT /startup.sh
