FROM alpine:3.4

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 0.8.5
ENV TERRAFORM_SUM 4b4324e354c26257f0b830eacb0e7cc7e2ced017d78855f74cb9377f1abf1dd7
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip

RUN apk add --update openssl openssh-client ca-certificates && rm -rf /var/cache/apk/*
RUN set -ex \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} \
    && echo "${TERRAFORM_SUM}  /tmp/${TERRAFORM_ZIP}" | sha256sum -c - \
    && unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin \
    && rm /tmp/${TERRAFORM_ZIP}
