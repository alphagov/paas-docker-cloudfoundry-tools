FROM ruby:2.2-alpine

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 0.7.10
ENV TERRAFORM_SUM a6da76d6228349855f7c503b769fb231e6b1009add5e5b2586ecb7624e9ecf15
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip

RUN gem install dogapi -v 1.24.0
RUN apk add --update openssl openssh-client ca-certificates && rm -rf /var/cache/apk/*
RUN set -ex \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} \
    && echo "${TERRAFORM_SUM}  /tmp/${TERRAFORM_ZIP}" | sha256sum -c - \
    && unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin \
    && rm /tmp/${TERRAFORM_ZIP}
