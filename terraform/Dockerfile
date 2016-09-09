FROM alpine:3.3

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 0.7.3
ENV TERRAFORM_SUM 4e985f222ec99616e8c730d737c9b400f9d73bf0c436661ec888b2406d3a6f39
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip

RUN apk add --update openssl openssh-client ca-certificates && rm -rf /var/cache/apk/*
RUN set -ex \
       && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} \
       && echo "${TERRAFORM_SUM}  /tmp/${TERRAFORM_ZIP}" | sha256sum -c - \
       && unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin \
       && rm /tmp/${TERRAFORM_ZIP}
