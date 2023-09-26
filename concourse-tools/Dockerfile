FROM ghcr.io/alphagov/paas/bosh-cli-v2:main

ENV AWSCLI_VERSION "1.19.112"
ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 1.5.2
ENV TERRAFORM_SUM 781ffe0c8888d35b3f5bd0481e951cebe9964b9cfcb27e352f22687975401bcd
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
