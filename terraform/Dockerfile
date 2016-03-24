FROM golang:1.6-alpine

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_TAG 9cb08cb229a821753bdba8a6fc8c010767dea6c1
ENV BINARY_WHITELIST \
  terraform \
  terraform-provider-aws \
  terraform-provider-null \
  terraform-provider-template \
  terraform-provider-tls \
  terraform-provider-postgresql \
  terraform-provisioner-file \
  terraform-provisioner-local-exec \
  terraform-provisioner-remote-exec

ENV PACKAGES "openssl openssh-client ca-certificates make bash git"

RUN set -ex \
    && apk add --update $PACKAGES \
    && mkdir -p /go/src/github.com/hashicorp/ \
    && cd /go/src/github.com/hashicorp/ \
    && git clone https://github.com/hashicorp/terraform.git \
    && cd terraform \
    && git checkout $TERRAFORM_TAG \
    && make dev \
    && for file in $BINARY_WHITELIST ; do mv bin/$file /usr/local/bin ; done \
    && rm -rf /go \
    && rm -rf /var/cache/apk/*
