FROM alpine:3.3

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 0.6.13
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip
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

RUN apk add --update openssl openssh-client ca-certificates && rm -rf /var/cache/apk/*
RUN set -ex \
       && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} \
       && unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin ${BINARY_WHITELIST} \
       && rm /tmp/${TERRAFORM_ZIP}
