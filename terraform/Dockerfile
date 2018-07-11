FROM alpine:3.7

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_SHARED_DIR /.terraform/plugins/linux_amd64
ENV TERRAFORM_VER 0.11.7
ENV TERRAFORM_SUM 6b8ce67647a59b2a3f70199c304abca0ddec0e49fd060944c26f666298e23418
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip


ENV PROVIDER_CLOUDFOUNDRY_VERSION 0.9.1
ENV PROVIDER_CLOUDFOUNDRY_SUM baf908c3c8af4fcc06a772de45e61e2ebc5f3023939b58ddb4118b6a6a4ac173

ENV PROVIDER_CREDHUB_VERSION 0.11.0
ENV PROVIDER_CREDHUB_SUM 1b43ea2c404bb716eefa36e18a9fd8baa35f8e5ea991d98b2dd3447cba08435a

ENV PROVIDER_UAA_VERSION 0.9.0
ENV PROVIDER_UAA_SUM bfbab04dde59e70354c98f4516924c447d70c3bb3a5689dd4d6466e744162220

RUN mkdir -p ${TERRAFORM_SHARED_DIR}

ENV HELM_HOME "/.helm-home"
RUN mkdir -p ${HELM_HOME}

RUN apk add --update openssl openssh-client ca-certificates wget libc6-compat && rm -rf /var/cache/apk/*



RUN set -ex \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} \
    && echo "Computed sha256sum: $(sha256sum /tmp/${TERRAFORM_ZIP})" \
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
    && echo "Computed sha256sum: $(sha256sum /tmp/${FULL_FILENAME})" \
    && echo "${SUM}  /tmp/${FULL_FILENAME}" | sha256sum -c - \
    && mv /tmp/${FULL_FILENAME} ${TERRAFORM_SHARED_DIR}/${FILENAME}_v${PROVIDER_CLOUDFOUNDRY_VERSION} \
    && chmod +x ${TERRAFORM_SHARED_DIR}/*

# Terraform Credhub provider name is not version dependant
RUN set -ex \
    && export FILENAME="terraform-provider-credhub" \
    && export FILENAME_SUFFIX="_linux_amd64" \
    && export FULL_FILENAME="$FILENAME$FILENAME_SUFFIX" \
    && export URL="https://github.com/orange-cloudfoundry/terraform-provider-credhub/releases/download/v${PROVIDER_CREDHUB_VERSION}/${FULL_FILENAME}" \
    && export SUM=${PROVIDER_CREDHUB_SUM} \
    && wget ${URL} -O /tmp/${FULL_FILENAME} \
    && echo "Computed sha256sum: $(sha256sum /tmp/${FULL_FILENAME})" \
    && echo "${SUM}  /tmp/${FULL_FILENAME}" | sha256sum -c - \
    && mv /tmp/${FULL_FILENAME} ${TERRAFORM_SHARED_DIR}/${FILENAME}_v${PROVIDER_CREDHUB_VERSION} \
    && chmod +x ${TERRAFORM_SHARED_DIR}/* \
    && echo "Computed sha256sum: $(sha256sum ${TERRAFORM_SHARED_DIR}/${FILENAME}_v${PROVIDER_CREDHUB_VERSION})"

# Terraform UAA provider name is not version dependant
RUN set -ex \
    && export FILENAME="terraform-provider-uaa" \
    && export FILENAME_SUFFIX="_linux_amd64" \
    && export FULL_FILENAME="$FILENAME$FILENAME_SUFFIX" \
    && export URL="https://github.com/orange-cloudfoundry/terraform-provider-uaa/releases/download/${PROVIDER_UAA_VERSION}/${FULL_FILENAME}" \
    && export SUM=${PROVIDER_UAA_SUM} \
    && wget ${URL} -O /tmp/${FULL_FILENAME} \
    && echo "Computed sha256sum: $(sha256sum /tmp/${FULL_FILENAME})" \
    && echo "${SUM}  /tmp/${FULL_FILENAME}" | sha256sum -c - \
    && mv /tmp/${FULL_FILENAME} ${TERRAFORM_SHARED_DIR}/${FILENAME}_v${PROVIDER_UAA_VERSION} \
    && chmod +x ${TERRAFORM_SHARED_DIR}/*

ENV TF_DATA_DIR "/.terraform"
COPY plugin_cache.tf /tmp/
RUN cd /tmp && terraform init

ENV TF_INPUT 0
