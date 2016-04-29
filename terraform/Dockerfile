FROM alpine:3.3

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 0.6.15
ENV TERRAFORM_SUM 2a81faa54ed6c5e7c065444617fc999f0ab6d433e4e03a0ad599892e74ffff6b
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
       && echo "${TERRAFORM_SUM}  /tmp/${TERRAFORM_ZIP}" | sha256sum -c - \
       && unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin ${BINARY_WHITELIST} \
       && rm /tmp/${TERRAFORM_ZIP}
