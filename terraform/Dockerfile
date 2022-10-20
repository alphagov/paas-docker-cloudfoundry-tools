FROM ghcr.io/alphagov/paas/alpine:main

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 1.3.3
ENV TERRAFORM_SUM fa5cbf4274c67f2937cabf1a6544529d35d0b8b729ce814b40d0611fd26193c1
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip

RUN apk add --no-cache openssl openssh-client ca-certificates
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
