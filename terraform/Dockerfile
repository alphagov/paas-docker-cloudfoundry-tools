FROM alpine:3.9

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 0.11.1
ENV TERRAFORM_SUM 4e3d5e4c6a267e31e9f95d4c1b00f5a7be5a319698f0370825b459cb786e2f35
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip

RUN apk add --no-cache openssl openssh-client ca-certificates
RUN set -ex \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} \
    && echo "${TERRAFORM_SUM}  /tmp/${TERRAFORM_ZIP}" | sha256sum -c - \
    && unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin \
    && rm /tmp/${TERRAFORM_ZIP}

ENV TF_DATA_DIR "/.terraform"
COPY plugin_cache.tf /tmp/
RUN cd /tmp && terraform init

ENV TF_INPUT 0
