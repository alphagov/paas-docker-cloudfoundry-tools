FROM alpine:3.12

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 0.11.14
ENV TERRAFORM_SUM 9b9a4492738c69077b079e595f5b2a9ef1bc4e8fb5596610f69a6f322a8af8dd
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
