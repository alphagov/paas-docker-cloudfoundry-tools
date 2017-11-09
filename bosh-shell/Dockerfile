FROM ruby:2.4-alpine

RUN gem install bosh_cli -v 1.3262.26.0 --no-rdoc --no-ri

RUN apk add --update bash openssl openssh-client file git && rm -rf /var/cache/apk/*

COPY startup.sh /startup.sh
COPY bosh-ssh /usr/local/bin

ENTRYPOINT /startup.sh
