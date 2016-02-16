FROM ruby:2.2-slim

RUN gem install bosh_cli -v 1.3192.0 --no-rdoc --no-ri
RUN apt-get update && apt-get install -y openssh-client

