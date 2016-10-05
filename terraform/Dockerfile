FROM golang:1.7.1-alpine

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_TAG datadog_dashboard_type_style

RUN apk add --update openssl openssh-client ca-certificates make bash git && rm -rf /var/cache/apk/*
RUN set -ex \
    && mkdir -p /go/src/github.com/hashicorp/ \
    && cd /go/src/github.com/hashicorp/ \
    && git clone https://github.com/alphagov/paas-terraform.git terraform \
    && cd terraform \
    && git checkout $TERRAFORM_TAG \
    && make dev \
    && mv bin/terraform /usr/local/bin \
    && rm -rf /go \
    && rm -rf /var/cache/apk/*
