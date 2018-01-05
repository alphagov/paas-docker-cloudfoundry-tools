FROM alpine:3.6

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_SHARED_DIR /root/.terraform.d/providers/linux_amd64
ENV TERRAFORM_VER 0.10.2
ENV TERRAFORM_SUM 6c1b5ce1a78bc7bb895055052d9074e519f51293770871acfe2dbd289e2f2aaa
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip


ENV PROVIDER_CLOUDFLARE_VERSION 0.1.0
ENV PROVIDER_CLOUDFLARE_SUM 23f40d95515300884681104de808f05bd9c6d9e5c24bda67e0a3fb7bc0200ae6

ENV PROVIDER_OPENSTACK_VERSION 1.1.0
ENV PROVIDER_OPENSTACK_SUM 9a3779f867a1294fdd2077b5e671cd591dceea23b9d04c750eb2602d21794915

ENV PROVIDER_LOCAL_VERSION 1.0.0
ENV PROVIDER_LOCAL_SUM 6d80c49c3a8e193bdc4fc417e053f43ba59780df7010ab6e22e724ef3831fcb0

ENV PROVIDER_POWERDNS_VERSION 0.1.0
ENV PROVIDER_POWERDNS_SUM 12a9e74ab47fff07a52bbab5ee40fa4b561dd108c3e8d26f563d01fdd1ebc932

ENV PROVIDER_TERRAFORM_VERSION 1.0.2
ENV PROVIDER_TERRAFORM_SUM c4c1e826c85ef45fb18ca75e06284d13b0f72bce61a652e74eb016cf7779eafd


ENV PROVIDER_CLOUDFOUNDRY_VERSION 0.9.1
#ENV PROVIDER_CLOUDFOUNDRY_SUM TODO-xxx

ENV PROVIDER_CREDHUB_VERSION 0.10.0
#ENV PROVIDER_CREDHUB_SUM TODO-yyy

#ENV PROVIDER__VERSION 0.1.0
#ENV PROVIDER__SUM 0.1.0

RUN mkdir -p ${TERRAFORM_SHARED_DIR}

#RUN cat /etc/resolv.conf
#
#RUN env
#RUN traceroute dl-cdn.alpinelinux.org
#
#RUN echo $(date) \
#    && cat /etc/resolv.conf \
#    && nslookup --help \
#    && nslookup p-goodway.rd.francetelecom.fr 10.171.108.2 \
#    && wget https://releases.hashicorp.com/terraform/
#

RUN apk add --update openssl openssh-client ca-certificates && rm -rf /var/cache/apk/*

#RUN wget --help

RUN set -ex \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} \
    && echo "${TERRAFORM_SUM}  /tmp/${TERRAFORM_ZIP}" | sha256sum -c - \
    && unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin \
    && rm /tmp/${TERRAFORM_ZIP}


RUN set -ex \
    && export FILENAME="terraform-provider-cloudflare_${PROVIDER_CLOUDFLARE_VERSION}_linux_amd64.zip" \
    && export URL="https://releases.hashicorp.com/terraform-provider-cloudflare/${PROVIDER_CLOUDFLARE_VERSION}/${FILENAME}" \
    && export SUM=${PROVIDER_CLOUDFLARE_SUM} \
    && wget ${URL} -O /tmp/${FILENAME} \
    && echo "${SUM}  /tmp/${FILENAME}" | sha256sum -c - \
    && unzip /tmp/${FILENAME} -d ${TERRAFORM_SHARED_DIR} \
    && rm /tmp/${FILENAME}

RUN set -ex \
    && export FILENAME="terraform-provider-openstack_${PROVIDER_OPENSTACK_VERSION}_linux_amd64.zip" \
    && export URL="https://releases.hashicorp.com/terraform-provider-openstack/${PROVIDER_OPENSTACK_VERSION}/${FILENAME}" \
    && export SUM=${PROVIDER_OPENSTACK_SUM} \
    && wget ${URL} -O /tmp/${FILENAME} \
    && echo "${SUM}  /tmp/${FILENAME}" | sha256sum -c - \
    && unzip /tmp/${FILENAME} -d ${TERRAFORM_SHARED_DIR} \
    && rm /tmp/${FILENAME}

RUN set -ex \
    && export FILENAME="terraform-provider-local_${PROVIDER_LOCAL_VERSION}_linux_amd64.zip" \
    && export URL="https://releases.hashicorp.com/terraform-provider-local/${PROVIDER_LOCAL_VERSION}/${FILENAME}" \
    && export SUM=${PROVIDER_LOCAL_SUM} \
    && wget ${URL} -O /tmp/${FILENAME} \
    && echo "${SUM}  /tmp/${FILENAME}" | sha256sum -c - \
    && unzip /tmp/${FILENAME} -d ${TERRAFORM_SHARED_DIR} \
    && rm /tmp/${FILENAME}

RUN set -ex \
    && export FILENAME="terraform-provider-powerdns_${PROVIDER_POWERDNS_VERSION}_linux_amd64.zip" \
    && export URL="https://releases.hashicorp.com/terraform-provider-powerdns/${PROVIDER_POWERDNS_VERSION}/${FILENAME}" \
    && export SUM=${PROVIDER_POWERDNS_SUM} \
    && wget ${URL} -O /tmp/${FILENAME} \
    && echo "${SUM}  /tmp/${FILENAME}" | sha256sum -c - \
    && unzip /tmp/${FILENAME} -d ${TERRAFORM_SHARED_DIR} \
    && rm /tmp/${FILENAME}

RUN set -ex \
    && export FILENAME="terraform-provider-terraform_${PROVIDER_TERRAFORM_VERSION}_linux_amd64.zip" \
    && export URL="https://releases.hashicorp.com/terraform-provider-terraform/${PROVIDER_TERRAFORM_VERSION}/${FILENAME}" \
    && export SUM=${PROVIDER_TERRAFORM_SUM} \
    && wget ${URL} -O /tmp/${FILENAME} \
    && echo "${SUM}  /tmp/${FILENAME}" | sha256sum -c - \
    && unzip /tmp/${FILENAME} -d ${TERRAFORM_SHARED_DIR} \
    && rm /tmp/${FILENAME}

#RUN set -ex \
#    && export FILENAME="terraform-provider-_${PROVIDER__VERSION}_linux_amd64.zip" \
#    && export URL="https://releases.hashicorp.com/terraform-provider-/${PROVIDER__VERSION}/${FILENAME}"
#    && export SUM=${PROVIDER__SUM} \
#    && wget ${URL} -O /tmp/${FILENAME} \
#    && echo "${SUM}  /tmp/${FILENAME}" | sha256sum -c - \
#    && unzip /tmp/${FILENAME} -d ${TERRAFORM_SHARED_DIR} \
#    && rm /tmp/${FILENAME}

# Terraform CF provider name is not version dependant
RUN set -ex \
    && export FILENAME="terraform-provider-cloudfoundry_0.10_linux_amd64" \
    && export URL="https://github.com/orange-cloudfoundry/terraform-provider-cloudfoundry/releases/download/v${PROVIDER_CLOUDFOUNDRY_VERSION}/${FILENAME}" \
    && export SUM=${PROVIDER_CLOUDFOUNDRY_SUM} \
    && wget ${URL} -O /tmp/${FILENAME} \
    && mv /tmp/${FILENAME} ${TERRAFORM_SHARED_DIR} \
    && chmod +x ${TERRAFORM_SHARED_DIR}
#    && echo "${SUM}  /tmp/${FILENAME}" | sha256sum -c - \

# Terraform Credhub provider name is not version dependant
RUN set -ex \
    && export FILENAME="terraform-provider-credhub_0.10_linux_amd64" \
    && export URL="https://github.com/orange-cloudfoundry/terraform-provider-credhub/releases/download/v${PROVIDER_CREDHUB_VERSION}/${FILENAME}" \
    && export SUM=${PROVIDER_CREDHUB_SUM} \
    && wget ${URL} -O /tmp/${FILENAME} \
    && mv /tmp/${FILENAME} ${TERRAFORM_SHARED_DIR} \
    && chmod +x ${TERRAFORM_SHARED_DIR}
#    && echo "${SUM}  /tmp/${FILENAME}" | sha256sum -c - \
