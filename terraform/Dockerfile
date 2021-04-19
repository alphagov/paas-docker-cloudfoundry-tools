FROM alpine:3.12

LABEL org.opencontainers.image.source https://github.com/alphagov/paas-docker-cloudfoundry-tools

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 0.14.4
ENV TERRAFORM_SUM 042f1f4fb47696b3442eca12bce7cce6de0b477b299503ddad6b8bc3777a54b5
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
