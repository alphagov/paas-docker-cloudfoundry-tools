FROM alpine:3.7

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_SHARED_DIR /root/.terraform.d/plugins/linux_amd64
ENV TERRAFORM_VER 0.11.2
ENV TERRAFORM_SUM f728fa73ff2a4c4235a28de4019802531758c7c090b6ca4c024d48063ab8537b
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip


ENV PROVIDER_CLOUDFOUNDRY_VERSION 0.9.1
#ENV PROVIDER_CLOUDFOUNDRY_SUM TODO-xxx

ENV PROVIDER_CREDHUB_VERSION 0.10.0
#ENV PROVIDER_CREDHUB_SUM TODO-yyy


RUN mkdir -p ${TERRAFORM_SHARED_DIR}

RUN apk add --update openssl openssh-client ca-certificates wget && rm -rf /var/cache/apk/*


RUN set -ex \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} \
    && echo "${TERRAFORM_SUM}  /tmp/${TERRAFORM_ZIP}" | sha256sum -c - \
    && unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin \
    && rm /tmp/${TERRAFORM_ZIP}


# Terraform CF provider name is not version dependant
RUN set -ex \
    && export FILENAME="terraform-provider-cloudfoundry" \
    && export FILENAME_SUFFIX="_0.10_linux_amd64" \
    && export FULL_FILENAME="$FILENAME$FILENAME_SUFFIX" \
    && export URL="https://github.com/orange-cloudfoundry/terraform-provider-cloudfoundry/releases/download/v${PROVIDER_CLOUDFOUNDRY_VERSION}/${FULL_FILENAME}" \
    && export SUM=${PROVIDER_CLOUDFOUNDRY_SUM} \
    && wget ${URL} -O /tmp/${FULL_FILENAME} \
    && mv /tmp/${FULL_FILENAME} ${TERRAFORM_SHARED_DIR}/${FILENAME} \
    && chmod +x ${TERRAFORM_SHARED_DIR}/*
#    && echo "${SUM}  /tmp/${FILENAME}" | sha256sum -c - \

# Terraform Credhub provider name is not version dependant
RUN set -ex \
    && export FILENAME="terraform-provider-credhub" \
    && export FILENAME_SUFFIX="_0.10_linux_amd64" \
    && export FULL_FILENAME="$FILENAME$FILENAME_SUFFIX" \
    && export URL="https://github.com/orange-cloudfoundry/terraform-provider-credhub/releases/download/v${PROVIDER_CREDHUB_VERSION}/${FULL_FILENAME}" \
    && export SUM=${PROVIDER_CREDHUB_SUM} \
    && wget ${URL} -O /tmp/${FULL_FILENAME} \
    && mv /tmp/${FULL_FILENAME} ${TERRAFORM_SHARED_DIR}/${FILENAME} \
    && chmod +x ${TERRAFORM_SHARED_DIR}/*
#    && echo "${SUM}  /tmp/${FILENAME}" | sha256sum -c - \


ENV TF_DATA_DIR "/root/.terraform.d"
COPY plugin_cache.tf /tmp/
RUN cd /tmp && terraform init

ENV TF_INPUT 0