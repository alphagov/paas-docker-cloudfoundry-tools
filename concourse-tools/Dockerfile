FROM ghcr.io/alphagov/paas/bosh-cli-v2:main

ENV AWSCLI_VERSION "1.19.112"
ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 1.9.2
ENV TERRAFORM_SUM d5f5aaba0f8ebff88ef0b23935872e154e2abf3172596261be834605ba3ba714
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip

RUN apt-get update && apt-get install -y \
    unzip \
    curl \
    python3 \
    python3-pip \
    && pip3 install \
      awscli==$AWSCLI_VERSION

RUN set -ex \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} \
    && echo "${TERRAFORM_SUM}  /tmp/${TERRAFORM_ZIP}" | sha256sum -c - \
    && unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin \
    && rm /tmp/${TERRAFORM_ZIP}

ENV TF_DATA_DIR "/.terraform"
COPY plugin_cache.tf /tmp/
COPY terraform.lock.hcl /tmp/.terraform.lock.hcl
RUN cd /tmp && terraform init

ENV TF_INPUT 0
